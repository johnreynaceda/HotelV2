<?php

namespace App\Http\Livewire\Kiosk;

use Livewire\Component;
use App\Models\Type;
use App\Models\Room;
use App\Models\Rate;
use WireUi\Traits\Actions;

class CheckIn extends Component
{
    use Actions;
    public $steps;
    public $types = [];
    public $rooms = [];
    public $rates = [];
    public $type_id;
    public $room_id;
    public $rate_id;
    public $longstay;

    public $name, $contact;

    //check_in details
    public $room_number, $room_type, $room_floor, $room_rate, $room_pay;

    public function render()
    {
        return view('livewire.kiosk.check-in');
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

        $this->steps = 1;
    }

    public function selectType($type_id)
    {
        if (
            Room::where('type_id', $type_id)
                ->where('status', 'Available')
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
            $this->rooms = Room::whereTypeId($this->type_id)
                ->where('status', 'Available')
                ->with(['type.rates'])
                ->orderBy('number', 'asc')
                ->get()
                ->take(10);
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

        $this->room_number = Room::where('id', $this->room_id)->first()->number;
        $this->room_floor = Room::where('id', $this->room_id)
            ->first()
            ->floor->numberWithFormat();
        $this->room_type = Type::where('id', $this->type_id)->first()->name;
        $this->room_rate = Rate::where(
            'id',
            $this->rate_id
        )->first()->stayingHour->number;
        $this->room_pay = Rate::where('id', $this->rate_id)->first()->amount;
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
    }
}
