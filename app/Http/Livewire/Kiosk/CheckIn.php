<?php

namespace App\Http\Livewire\Kiosk;

use Livewire\Component;
use App\Models\Type;
use App\Models\Room;
use App\Models\Rate;
use App\Models\Floor;
use WireUi\Traits\Actions;
use App\Models\Guest;
use App\Models\TemporaryCheckInKiosk;
use Carbon\Carbon;
use App\Jobs\TerminationInKiosk;
use App\Models\StayingHour;

class CheckIn extends Component
{
    use Actions;
    public $steps;
    public $types = [];
    // public $rooms = [];
    public $rates = [];
    public $floors = [];
    public $floor_id;
    public $type_id;
    public $room_id;
    public $rate_id;
    public $longstay;
    public $generatedQrCode;

    public $name, $contact;

    //check_in details
    public $room_number, $room_type, $room_floor, $room_rate, $room_pay;

    public function render()
    {
        $temporaryCheckInKiosk = TemporaryCheckInKiosk::where(
            'branch_id',
            auth()->user()->branch_id
        )
            ->pluck('room_id')
            ->toArray();
        return view('livewire.kiosk.check-in', [
            'rooms' => Room::whereTypeId($this->type_id)
                ->where('status', 'Available')
                ->whereNotIn('id', $temporaryCheckInKiosk)
                ->where('is_priority', true)
                ->when($this->floor_id, function ($query) {
                    return $query->where('floor_id', $this->floor_id);
                })
                ->with(['type.rates'])
                ->orderBy('number', 'asc')
                ->get()
                ->take(10),
        ]);
    }

    public function getTypes()
    {
        return $this->types = Type::whereBranchId(
            auth()->user()->branch_id
        )->get();
    }

    public function mount()
    {
        $this->getTypes();
        $this->floors = Floor::get();

        $this->steps = 1;
    }

    public function selectType($type_id)
    {
        $temporaryCheckInKiosk = TemporaryCheckInKiosk::where(
            'branch_id',
            auth()->user()->branch_id
        )
            ->pluck('room_id')
            ->toArray();
        if (
            Room::where('type_id', $type_id)
                ->where('status', 'Available')
                ->whereNotIn('id', $temporaryCheckInKiosk)
                ->with(['type.rates'])
                ->orderBy('number', 'asc')
                ->count() <= 0
        ) {
            $this->dialog()->error(
                $title = 'SORRY',
                $description = 'There is no available room in this type.'
            );
        } else {
            $this->type_id = $type_id;
            // $this->rooms =

            // $this->floors = Floor::get();
        }
    }

    public function updatedLongstay()
    {
        $this->rate_id = null;
    }

    public function selectRoom($room_id)
    {
        $this->room_id = $room_id;
        $this->rates = Rate::whereBranchId(auth()->user()->branch_id)
            ->whereTypeId($this->type_id)
            ->with(['stayingHour'])
            ->get();
    }

    public function selectRate($rate_id)
    {
        $this->rate_id = $rate_id;
    }

    public function proceedFillUp()
    {
        $this->room_number = Room::where('id', $this->room_id)->first()->number;
        $this->room_floor = Room::where('id', $this->room_id)
            ->first()
            ->floor->numberWithFormat();
        $this->room_type = Type::where('id', $this->type_id)->first()->name;

        if ($this->longstay == null) {
            $this->room_rate = Rate::where(
                'id',
                $this->rate_id
            )->first()->stayingHour->number;

            $this->room_pay = Rate::where(
                'id',
                $this->rate_id
            )->first()->amount;
        } else {
            $this->validate([
                'longstay' => 'required|numeric|min:1|max:31',
            ]);

            $long = StayingHour::where('branch_id', auth()->user()->branch_id)
                ->where('number', 24)
                ->first();

            $rate_exist = Rate::where('branch_id', auth()->user()->branch_id)
                ->where('type_id', $this->type_id)
                ->where('staying_hour_id', $long->id)
                ->exists();

            if ($rate_exist) {
                $this->room_rate =
                    Rate::where('branch_id', auth()->user()->branch_id)
                        ->where('type_id', $this->type_id)
                        ->max('amount') * $this->longstay;

                $this->rate_id = Rate::where(
                    'branch_id',
                    auth()->user()->branch_id
                )
                    ->where('type_id', $this->type_id)
                    ->where('staying_hour_id', $long->id)
                    ->first()->id;

                $this->room_pay = $this->room_rate;
                $this->steps = 4;
            } else {
                $this->dialog()->error(
                    $title = 'SORRY',
                    $description =
                        'Long Stay rate is not set yet. Please contact the administrator.'
                );
            }
        }
    }

    public function confirmTransaction()
    {
        if ($this->contact == null) {
            $this->validate([
                'name' => 'required|min:3',
            ]);
        } else {
            $this->validate([
                'name' => 'required|min:3',
                'contact' => 'required|min:9|max:9',
            ]);
        }

        $this->dialog()->confirm([
            'title' => 'Are you Sure?',
            'description' => 'Confirm the Transaction?',
            'icon' => 'question',
            'accept' => [
                'label' => 'Yes, Confirm it',
                'method' => 'confirmCheckIn',
            ],
            'reject' => [
                'label' => 'No, cancel',
            ],
        ]);
    }

    public function confirmCheckIn()
    {
        $transaction = Guest::whereYear(
            'created_at',
            \Carbon\Carbon::today()->year
        )->count();
        $transaction += 1;
        $transaction_code =
            auth()->user()->branch_id .
            today()->format('y') .
            str_pad($transaction, 4, '0', STR_PAD_LEFT);
        $this->generatedQrCode = $transaction_code;

        $guest = Guest::create([
            'branch_id' => auth()->user()->branch_id,
            'name' => $this->name,
            'contact' => $this->contact,
            'qr_code' => $transaction_code,
            'room_id' => $this->room_id,
            'rate_id' => $this->rate_id,
            'type_id' => $this->type_id,
            'static_amount' => $this->room_pay,
            'is_long_stay' => $this->longstay != null ? true : false,
        ]);

        TemporaryCheckInKiosk::create([
            'guest_id' => $guest->id,
            'room_id' => $this->room_id,
            'branch_id' => auth()->user()->branch_id,
            'terminated_at' => Carbon::now()->addMinutes(20),
        ]);
        TerminationInKiosk::dispatch($this->room_id)->delay(
            Carbon::now()->addMinutes(20)
        );

        $this->steps = 5;
    }
}
