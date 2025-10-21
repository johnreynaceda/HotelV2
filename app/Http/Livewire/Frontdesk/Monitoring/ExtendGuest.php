<?php

namespace App\Http\Livewire\Frontdesk\Monitoring;

use App\Models\Rate;
use App\Models\Room;
use App\Models\Guest;
use Livewire\Component;
use App\Models\StayingHour;

class ExtendGuest extends Component
{
    public $guest;
    public $room;
    public $rate;
    public $stayingHour;
    public function mount($record)
    {
        $this->guest = Guest::where('branch_id', auth()->user()->branch_id)
                ->where('id', $record)
                ->first();
        $this->room = Room::where('branch_id', auth()->user()->branch_id)
                ->where('id', $this->guest->checkInDetail->room_id)
                ->first();
        $this->rate = Rate::where('branch_id', auth()->user()->branch_id)
                ->where('id', $this->guest->rate_id)
                ->first();
        $this->stayingHour = StayingHour::where(
                'branch_id',
                auth()->user()->branch_id
            )
                ->where('id', $this->rate->staying_hour_id)
                ->first();
    }

    public function cancelExtend()
    {
        return redirect()->route('frontdesk.guest-transaction', ['id' => $this->guest->id]);
    }
    public function render()
    {
        return view('livewire.frontdesk.monitoring.extend-guest');
    }
}
