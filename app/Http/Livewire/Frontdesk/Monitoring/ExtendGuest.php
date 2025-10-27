<?php

namespace App\Http\Livewire\Frontdesk\Monitoring;

use App\Models\Branch;
use App\Models\Rate;
use App\Models\Room;
use App\Models\Guest;
use Livewire\Component;
use App\Models\StayingHour;
use App\Models\ExtensionRate;

class ExtendGuest extends Component
{
    public $guest;
    public $room;
    public $rate;
    public $stayingHour;
    public $extension_rates;
    public $extension_rate_id;
    public $extension_time_reset;

    public $current_time_alloted;
    public $extended_rate;
    public $total_extended_hours;
    public $initial_amount;
    public $extended_amount;
    public $total_amount;
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
        $this->extension_rates = ExtensionRate::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();

        $this->extension_time_reset = Branch::where(
            'id',
            auth()->user()->branch_id
        )->first()->extension_time_reset;

        $this->total_extended_hours = $this->guest->stayExtensions->sum('hours');

        $this->current_time_alloted = $this->stayingHour?->number + $this->total_extended_hours;

        $this->initial_amount = 0;
        $this->extended_amount = 0;
        $this->total_amount = 0;
    }

    public function updatedExtensionRateId()
    {
        $this->current_time_alloted = $this->stayingHour?->number + $this->total_extended_hours;

        if ($this->extension_rate_id) {
            $this->extended_rate = ExtensionRate::where('branch_id', auth()->user()->branch_id)
                ->where('id', $this->extension_rate_id)
                ->first();

            if (($this->current_time_alloted + $this->extended_rate->hour) > $this->extension_time_reset) {
                $this->current_time_alloted = $this->extended_rate->hour - $this->current_time_alloted;
                $this->initial_amount = $this->rate->amount;
                $extend = ExtensionRate::where('branch_id', auth()->user()->branch_id)
                ->where('hour', $this->current_time_alloted)
                ->first();
                $this->extended_amount = $extend->amount;
                $this->total_amount = $this->initial_amount + $this->extended_amount;
            } else {
                $this->initial_amount = 0;
                 $extend = ExtensionRate::where('branch_id', auth()->user()->branch_id)
                ->where('hour', $this->current_time_alloted)
                ->first();
                $this->extended_amount = $extend->amount;
                $this->current_time_alloted = $this->current_time_alloted + $this->extended_rate->hour;
                $this->total_amount = $this->initial_amount + $this->extended_amount;
            }
        }

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
