<?php

namespace App\Http\Livewire\Frontdesk\Monitoring;

use Livewire\Component;
use App\Models\Floor;
use App\Models\Room;
use App\Models\TemporaryCheckInKiosk;
use Livewire\WithPagination;

class RoomMonitoring extends Component
{
    use WithPagination;
    public $search;
    public $filter_floor, $filter_status;
    public $checkInModal = false;
    public $temporary_checkIn, $guest, $rate, $stayingHour, $additional_charges;
    public $total, $amountPaid, $excess_amount;
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
         $this->guest = Guest::find($this->temporary_checkIn)->first();
         $this->rate = Rate::find($this->guest->rate_id)->first();
         $this->stayingHour = StayingHour::find($this->rate->staying_hour_id)->first();
         $this->total = $this->rate->amount + $this->additional_charges;
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
            'amountPaid' => 'required',
        ]);

        CheckinDetail::create([
            'guest_id' => $this->guest->id,
            'type_id' => $this->guest->type_id,
            'room_id' => $this->guest->room_id,
            'rate_id' => $this->guest->rate_id,
            'static_amount' => $this->amountPaid,
            'hours_stayed' => $this->stayingHour->number,
            'check_in_at' => now(),
            'check_out_at' => now(),
            'is_long_stay' => 0,
            'number_of_days' => 1,
        ]);

        $this->temporary_checkIn->delete();

        $this->reset(['amountPaid']);

            $this->dialog()->success(
                $title = 'Success',
                $description = 'data successfully saved'
            );

            $this->checkInModal = false;
    }
    
}
