<?php

namespace App\Http\Livewire\Frontdesk\Monitoring;

use App\Models\Rate;
use App\Models\Room;
use App\Models\Guest;
use Livewire\Component;
use App\Models\StayingHour;
use App\Models\TemporaryCheckInKiosk;
use WireUi\Traits\Actions;

class CheckInFromKiosk extends Component
{
    use Actions;
    public $record;
    public $temporary_checkIn;
    public $additional_charges = 0;
    public $room;
    public $rate;
    public $stayingHour;
    public $guest;
    public $has_discount;
    public $discount_amount;
    public $total = 0;

    public $amountPaid;
    public $excess = false;
    public $excess_amount = 0;

    //modals
    public $change_modal = false;
    public function mount($record)
    {
         $this->additional_charges = auth()->user()->branch->initial_deposit;
        $this->record = TemporaryCheckInKiosk::findOrFail($record);
            $this->temporary_checkIn = TemporaryCheckInKiosk::where(
                'branch_id',
                auth()->user()->branch_id
            )
                ->where('id', $record)
                ->first();
        $this->guest = Guest::where('branch_id', auth()->user()->branch_id)
                ->where('id', $this->temporary_checkIn->guest_id)
                ->first();
        $this->room = Room::where('branch_id', auth()->user()->branch_id)
                ->where('id', $this->temporary_checkIn->room_id)
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
            $this->has_discount = $this->guest->has_discount;
            $this->discount_amount = auth()->user()->branch->discount_amount;

            if ($this->has_discount) {
                $this->total = ($this->guest->static_amount + $this->additional_charges) - $this->discount_amount;
            } else {
                $this->total = $this->guest->static_amount + $this->additional_charges;
            }
    }

    public function cancelCheckIn()
    {
        return redirect()->route('frontdesk.room-monitoring');
    }

    public function updatedHasDiscount()
    {
        //compute total amount
         if ($this->has_discount) {
                $this->total = ($this->guest->static_amount + $this->additional_charges) - $this->discount_amount;
            } else {
                $this->total = $this->guest->static_amount + $this->additional_charges;
        }
        //check if amount paid is greater than total
        if ($this->amountPaid > $this->total) {
            $this->excess = true;
            $this->excess_amount = $this->amountPaid - $this->total;
        } else {
            $this->excess = false;
            $this->excess_amount = 0;
        }
    }

    public function proceedCheckIn()
    {
        $this->validate([
            'amountPaid' => 'required|numeric|min:' . $this->total,
        ],
        [
            'amountPaid.required' => 'Amount Paid is required',
            'amountPaid.numeric' => 'Amount Paid must be a number',
            'amountPaid.min' => 'Amount Paid must be at least ' . $this->total,
        ]);


        //check if amount paid is greater than total
        if ($this->amountPaid > $this->total) {
            $this->excess_amount = $this->amountPaid - $this->total;
            $this->change_modal = true;
        }else{
             $this->dialog()->confirm([
            'title'       => 'Save Transaction?',
            'description' => 'The guest payment is the exact amount. Do you want to proceed with the check-in?',
            'acceptLabel' => 'Yes, proceed',
            'method'      => 'saveCheckIn',
            'params'      => 'Saved',
        ]);
        }
    }

    public function saveCheckIn()
    {
        dd('saveCheckIn called');
    }

    public function render()
    {
        return view('livewire.frontdesk.monitoring.check-in-from-kiosk');
    }
}
