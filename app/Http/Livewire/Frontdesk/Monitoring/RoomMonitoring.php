<?php

namespace App\Http\Livewire\Frontdesk\Monitoring;

use Livewire\Component;
use DB;
use App\Models\Floor;
use App\Models\TemporaryCheckInKiosk;
use App\Models\CheckInDetail;
use App\Models\Transaction;
use App\Models\Room;
use App\Models\Guest;
use App\Models\Rate;
use App\Models\StayingHour;
use WireUi\Traits\Actions;
use Livewire\WithPagination;

class RoomMonitoring extends Component
{
    use WithPagination;
    use Actions;
    public $search, $search_kiosk;
    public $filter_floor, $filter_status;
    public $checkInModal = false;
    public $temporary_checkIn, $guest, $room, $rate, $stayingHour, $additional_charges;
    public $total, $amountPaid, $excess_amount;
    public $save_excess;
    public $excess = false;
    public function mount()
    {
        $this->floors = Floor::where('branch_id', auth()->user()->branch_id)
            ->orderBy('number', 'asc')
            ->get();
    }

    public function render()
    {
        return view('livewire.frontdesk.monitoring.room-monitoring', [
            'rooms' => $this->searchRooms(),
            'kiosks' => $this->searchKiosk(),
        ]);
    }

    public function searchKiosk()
    {
        return TemporaryCheckInKiosk::with('guest')
        ->where('branch_id', auth()->user()->branch_id)
        ->where(function($query) {
            $query->whereHas('guest', function($query) {
                $query->where('name', 'like', '%'.$this->search_kiosk.'%')
                ->orWhere('qr_code', 'like', '%'.$this->search_kiosk.'%');
            });
        })
        ->orderBy('created_at', 'desc')
        ->get();
    }

    public function searchRooms()
    {
        return Room::where('branch_id', auth()->user()->branch_id)
            ->when($this->filter_status, function ($query) {
                return $query->where('status', $this->filter_status);
            })
            ->when($this->filter_floor, function ($query) {
                return $query->where('floor_id', $this->filter_floor);
            })
            ->when($this->search, function ($query) {
                return $query->where(
                    'number',
                    'like',
                    '%' . $this->search . '%'
                );
            })
            ->with('floor')
            ->orderBy('number', 'asc')
            ->paginate(10);
    }

    public function checkIn($id)
    {

         $this->additional_charges = 200;
         $this->excess_amount = 0;
         $this->temporary_checkIn = TemporaryCheckInKiosk::where('branch_id', auth()->user()->branch_id)->where('id', $id)->first();
         $this->guest = Guest::where('id', $this->temporary_checkIn->guest_id)->first();
         $this->room = Room::where('id', $this->temporary_checkIn->room_id)->first();
         $this->rate = Rate::where('id', $this->guest->rate_id)->first();
         $this->stayingHour = StayingHour::where('id', $this->rate->staying_hour_id)->first();
         $this->total = $this->guest->static_amount + $this->additional_charges;
         return $this->checkInModal = true;

    }

    public function updatedAmountPaid()
    {
        if ($this->amountPaid > $this->total) {
            $this->excess = true;
            $this->excess_amount = $this->amountPaid - $this->total;
        } else {
            $this->excess = false;
            $this->excess_amount = 0;
        }
    }

    public function saveCheckInDetails()
    {
        $this->validate([
            'amountPaid' => 'required|gte:'.$this->total,
        ]);

        DB::beginTransaction();
        CheckinDetail::create([ 
            'guest_id' => $this->guest->id,
            'type_id' => $this->guest->type_id,
            'room_id' => $this->guest->room_id,
            'rate_id' => $this->guest->rate_id,
            'static_amount' => $this->total,
            'hours_stayed' => $this->temporary_checkIn->guest->is_long_stay ? $this->stayingHour->number * $this->temporary_checkIn->guest->number_of_days : $this->stayingHour->number,
            'total_deposit' => $this->save_excess ? $this->excess_amount : 0,
            'check_in_at' => now(),
            'check_out_at' => $this->guest->is_long_stay ?  now()->addDays( $this->guest->number_of_days) : now()->addHours( $this->stayingHour->number),
            'is_long_stay' => $this->temporary_checkIn->guest->is_long_stay,
            'number_of_days' => $this->temporary_checkIn->guest->is_long_stay ? $this->temporary_checkIn->guest->number_of_days : 0,
        ]);
        $room_number = Room::where('id', $this->guest->room_id)->first()->number;
        Transaction::create([
            'branch_id' =>  auth()->user()->branch_id,
            'room_id' =>   $this->guest->room_id,
            'guest_id' => $this->guest->id,
            'floor_id' => $this->room->floor_id,
            'transaction_type_id' => 2,
            'description' => 'Guest Check In',
            'payable_amount' => $this->total,
            'paid_amount' => $this->amountPaid,
            'change_amount' => $this->excess_amount != 0 ? $this->excess_amount : 0,
            'deposit_amount' => 0,
            'paid_at' => now(),
            'override_at' => null,
            'remarks' => 'Guest Checked In at room #'.$room_number,
        ]);

        if($this->save_excess)
        {
            Transaction::create([
                'branch_id' =>  auth()->user()->branch_id,
                'room_id' =>   $this->guest->room_id,
                'guest_id' => $this->guest->id,
                'floor_id' => $this->room->floor_id,
                'transaction_type_id' => 1,
                'description' => 'Deposit',
                'payable_amount' => $this->total,
                'paid_amount' => $this->amountPaid,
                'change_amount' => 0,
                'deposit_amount' => $this->excess_amount,
                'paid_at' => now(),
                'override_at' => null,
                'remarks' => 'Deposit From Check In',
            ]);
        }

        $this->reset(['amountPaid']);
        $this->checkInModal = false;
        Room::where('id', $this->temporary_checkIn->room_id)->first()->update([
            'status' => 'Occupied'
        ]);
        TemporaryCheckInKiosk::where('id', $this->temporary_checkIn->id)->first()->delete();
        $this->temporary_checkIn = null;
        DB::commit();
            $this->dialog()->success(
                $title = 'Success',
                $description = 'Data successfully saved'
            );    
    }
    
}