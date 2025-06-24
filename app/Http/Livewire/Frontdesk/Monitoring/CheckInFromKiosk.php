<?php

namespace App\Http\Livewire\Frontdesk\Monitoring;

use DB;
use Carbon\Carbon;
use App\Models\Rate;
use App\Models\Room;
use App\Models\Guest;
use Livewire\Component;
use WireUi\Traits\Actions;
use App\Models\StayingHour;
use App\Models\Transaction;
use App\Models\CheckinDetail;
use App\Models\NewGuestReport;
use App\Models\TemporaryCheckInKiosk;

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

    public $is_longStay = false;
    public $total = 0;

    public $save_excess = false;

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
        DB::beginTransaction();

        $rate = Rate::where('id', $this->guest->rate_id)->first()->stayingHour->number;
        $room_number = Room::where('id', $this->guest->room_id)->first()->number;
        $assigned_frontdesk = auth()->user()->assigned_frontdesks;
         //update guest
         $this->guest->static_amount = $this->total;
         $this->guest->has_discount = $this->has_discount;
         $this->guest->discount_amount = $this->discount_amount;
         $this->guest->save();

         //save check-in details
         $checkin = CheckinDetail::create([
            'guest_id' => $this->guest->id,
            'type_id' => $this->guest->type_id,
            'room_id' => $this->guest->room_id,
            'rate_id' => $this->guest->rate_id,
            'static_amount' => $this->guest->static_amount,
            'hours_stayed' => $this->is_longStay
                ? 0
                : $rate,
            'total_deposit' => $this->save_excess
                ? $this->excess_amount + $this->additional_charges
                : $this->additional_charges,
            'check_in_at' => now(),
            'check_out_at' => $this->guest->is_long_stay
                ? now()->addDays($this->guest->number_of_days)
                : now()->addHours($rate),
            'is_long_stay' => $this->is_longStay != null ? true : false,
        ]);

        //create transaction for check-in
         Transaction::create([
            'branch_id' => auth()->user()->branch_id,
            'room_id' => $this->guest->room_id,
            'guest_id' => $this->guest->id,
            'floor_id' => Room::where('id', $this->guest->room_id)->first()->floor->id,
            'transaction_type_id' => 1,
            'assigned_frontdesk_id' => json_encode($assigned_frontdesk),
            'description' => 'Guest Check In',
            'payable_amount' => $this->guest->static_amount,
            'paid_amount' => $this->amountPaid,
            'change_amount' =>
                $this->excess_amount != 0 ? $this->excess_amount : 0,
            'deposit_amount' => 0,
            'paid_at' => now(),
            'override_at' => null,
            'remarks' => 'Guest Checked In at room #' . $room_number,
        ]);

        Transaction::create([
            'branch_id' => auth()->user()->branch_id,
            'room_id' => $this->guest->room_id,
            'guest_id' => $this->guest->id,
            'floor_id' => Room::where('id', $this->guest->room_id)->first()->floor->id,
            'transaction_type_id' => 2,
            'assigned_frontdesk_id' => json_encode($assigned_frontdesk),
            'description' => 'Deposit',
            'payable_amount' => $this->additional_charges,
            'paid_amount' => $this->amountPaid,
            'change_amount' =>
                $this->excess_amount != 0 ? $this->excess_amount : 0,
            'deposit_amount' => $this->additional_charges,
            'paid_at' => now(),
            'override_at' => null,
            'remarks' => 'Deposit From Check In (Room Key & TV Remote)',
        ]);

        if ($this->save_excess) {
            Transaction::create([
                'branch_id' => auth()->user()->branch_id,
                'room_id' => $this->guest->room_id,
                'guest_id' => $this->guest->id,
                'floor_id' => Room::where('id', $this->guest->room_id)->first()->floor->id,
                'transaction_type_id' => 2,
                'assigned_frontdesk_id' => json_encode($assigned_frontdesk),
                'description' => 'Deposit',
                'payable_amount' => $this->excess_amount,
                'paid_amount' => $this->amountPaid,
                'change_amount' => 0,
                'deposit_amount' => $this->excess_amount,
                'paid_at' => now(),
                'override_at' => null,
                'remarks' => 'Deposit From Check In (Excess Amount)',
            ]);
        }

        $shift_date = Carbon::parse(auth()->user()->time_in)->format('F j, Y');
        $shift = Carbon::parse(auth()->user()->time_in)->format('H:i');
        $hour = Carbon::parse($shift)->hour;

         if ($hour >= 8 && $hour < 20) {
            $shift_schedule = 'AM';
        } else {
            $shift_schedule = 'PM';
        }

         $decode_frontdesk = json_decode(
            auth()->user()->assigned_frontdesks,
            true
        );

         NewGuestReport::create([
            'branch_id' => auth()->user()->branch_id,
            'checkin_details_id' => $checkin->id,
            'room_id' => $checkin->room_id,
            'shift_date' => $shift_date,
            'shift' => $shift_schedule,
            'frontdesk_id' => $decode_frontdesk[0],
            'partner_name' => $decode_frontdesk[1],
        ]);

        $this->amountPaid = null;

        if($this->change_modal)
        {
            $this->change_modal = false;
        }

        Room::where('id', $this->guest->room_id)
            ->first()
            ->update([
                'status' => 'Occupied',
            ]);

        TemporaryCheckInKiosk::where('id', $this->temporary_checkIn->id)
            ->first()
            ->delete();

        $this->temporary_checkIn = null;
        DB::commit();
        $this->dialog()->success(
            $title = 'Success',
            $description = 'Guest Has been Check-in'
        );

        return redirect()->route('frontdesk.room-monitoring');
    }

    public function render()
    {
        return view('livewire.frontdesk.monitoring.check-in-from-kiosk');
    }
}
