<?php

namespace App\Http\Livewire\Frontdesk\Monitoring;

use Carbon\Carbon;
use App\Models\Rate;
use App\Models\Room;
use App\Models\Guest;
use App\Models\Branch;
use Livewire\Component;
use App\Models\ActivityLog;
use App\Models\StayingHour;
use App\Models\Transaction;
use App\Models\CheckinDetail;
use App\Models\ExtensionRate;
use App\Models\StayExtension;
use Illuminate\Support\Facades\DB;
use App\Models\ExtendedGuestReport;
use WireUi\Traits\Actions;

class ExtendGuest extends Component
{
    use Actions;
    public $assigned_frontdesk;
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
        $this->assigned_frontdesk = auth()->user()->assigned_frontdesks;

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
        $this->total_extended_hours = $this->guest->stayExtensions->sum('hours') > $this->extension_time_reset
            ? $this->guest->stayExtensions->sum('hours') - $this->extension_time_reset
            : $this->guest->stayExtensions->sum('hours');

        $this->current_time_alloted = ($this->stayingHour?->number + $this->total_extended_hours) > $this->extension_time_reset
            ? ($this->stayingHour?->number + $this->total_extended_hours) - $this->extension_time_reset
            : ($this->stayingHour?->number + $this->total_extended_hours);

        $this->initial_amount = 0;
        $this->extended_amount = 0;
        $this->total_amount = 0;
    }

    public function updatedExtensionRateId()
    {
        $this->current_time_alloted = ($this->stayingHour?->number + $this->total_extended_hours) > $this->extension_time_reset
            ? ($this->stayingHour?->number + $this->total_extended_hours) - $this->extension_time_reset
            : ($this->stayingHour?->number + $this->total_extended_hours);

        if ($this->extension_rate_id) {
            $this->extended_rate = ExtensionRate::where('branch_id', auth()->user()->branch_id)
                ->where('id', $this->extension_rate_id)
                ->first();
            $total_current_hours = $this->current_time_alloted + $this->extended_rate->hour;

            if ($total_current_hours > $this->extension_time_reset) {
                $balance = $total_current_hours - $this->extension_time_reset;
                $this->current_time_alloted = $balance;
                $this->initial_amount = $this->rate->amount;
                $extend = ExtensionRate::where('branch_id', auth()->user()->branch_id)
                ->where('hour', $this->current_time_alloted)
                ->first();

            } else {
                $this->initial_amount = 0;
                $this->current_time_alloted = $total_current_hours;
                $extend = ExtensionRate::where('branch_id', auth()->user()->branch_id)
                ->where('id', $this->extension_rate_id)
                ->first();
                //$this->extended_amount = $extend->amount;
                //$this->current_time_alloted =  $this->current_time_alloted + $this->extended_rate->hour;
                //$this->total_amount = $this->initial_amount + $this->extended_amount;
            }

            $this->extended_amount = $extend->amount;
            $this->total_amount = $this->initial_amount + $this->extended_amount;
        }

    }

    public function saveExtend()
    {
        $this->validate([
            'extension_rate_id' => 'required',
        ]);

         if (auth()->user()->branch->extension_time_reset == null) {
             $this->dialog()->error(
                $title = 'Missing Authorization Code',
                $description = 'Admin must add authorization code first'
            );
         }else{
             $check_in_detail = CheckinDetail::where(
                'guest_id',
                $this->guest->id
            )->first();
            $rate = ExtensionRate::where('branch_id', auth()->user()->branch_id)
                ->where('id', $this->extension_rate_id)
                ->first();
             DB::beginTransaction();
                $transaction = Transaction::create([
                    'branch_id' => $check_in_detail->guest->branch_id,
                    'room_id' => $check_in_detail->room_id,
                    'guest_id' => $check_in_detail->guest_id,
                    'floor_id' => $check_in_detail->room->floor_id,
                    'transaction_type_id' => 6,
                    'assigned_frontdesk_id' => json_encode(
                        $this->assigned_frontdesk
                    ),
                    'description' => 'Extension',
                    'payable_amount' => $this->total_amount,
                    'paid_amount' => 0,
                    'change_amount' => 0,
                    'deposit_amount' => 0,
                    'paid_at' => null,
                    'override_at' => null,
                    'remarks' => 'Guest Extension : ' . $rate->hour . ' hours',
                ]);
                StayExtension::create([
                    'guest_id' => $check_in_detail->guest_id,
                    'extension_id' => $rate->id,
                    'hours' => $rate->hour,
                    'amount' => $this->total_amount,
                    'frontdesk_ids' => json_encode($this->assigned_frontdesk),
                ]);

                 $check_in_detail->update([
                    'number_of_hours' => $this->current_time_alloted,
                    'check_out_at' =>  Carbon::parse($check_in_detail->check_out_at)->addHours($rate->hour),
                ]);

                $now = Carbon::now();
                $hour = (int) $now->format('H');
                $shift = $now->format('H:i');

                if ($hour >= 8 && $hour < 20) {
                    $shift_schedule = 'AM';
                    $shift_date = $now->format('F j, Y');
                } else {
                    $shift_schedule = 'PM';
                    // For times between 00:00 and 07:59 the PM shift started the previous day (8pm)
                    $shift_date = $hour < 8 ? $now->copy()->subDay()->format('F j, Y') : $now->format('F j, Y');
                }

                // $shift_date = Carbon::parse(auth()->user()->time_in)->format('F j, Y');
                // $shift = Carbon::parse(auth()->user()->time_in)->format('H:i');
                // $hour = Carbon::parse($shift)->hour;

                // if ($hour >= 8 && $hour < 20) {
                // $shift_schedule = 'AM';
                // } else {
                //     $shift_schedule = 'PM';
                // }

                $decode_frontdesk = json_decode(
                auth()->user()->assigned_frontdesks,
                true
                );

                $extended_guest = ExtendedGuestReport::where('branch_id', auth()->user()->branch_id)->where('checkin_details_id', $check_in_detail->id)->first();

                 if($extended_guest != null)
                {
                    $extended_guest->update([
                    'number_of_extension' => $extended_guest->number_of_extension + 1,
                    'total_hours' => $extended_guest->total_hours + $rate->hour,
                    ]);
                }else{
                    ExtendedGuestReport::create([
                        'branch_id' => auth()->user()->branch_id,
                        'room_id' =>  $check_in_detail->room_id,
                        'checkin_details_id' => $check_in_detail->id,
                        'number_of_extension' => 1,
                        'total_hours' => $rate->hour,
                        'shift' => $shift_schedule,
                        'frontdesk_id' => $decode_frontdesk[0],
                        'partner_name' => $decode_frontdesk[1],
                    ]);
                }

                ActivityLog::create([
                'branch_id' => auth()->user()->branch_id,
                'user_id' => auth()->user()->id,
                'activity' => 'Add Extension',
                'description' => 'Added new extension of ₱' . $this->total_amount . ' for guest ' . $check_in_detail->guest->name,
                ]);
             DB::commit();
            // if($this->extend_type === 'savePay')
            // {
            //     $this->payTransaction($transaction->id);
            // }elseif($this->extend_type === 'savePayDeposit')
            // {
            //     $this->payWithDeposit($transaction->id);
            // }else{
                $this->dialog()->success(
                    $title = 'Success',
                    $description = 'Extend successfully saved'
                );

                return redirect()->route('frontdesk.guest-transaction', [
                    'id' => $this->guest->id,
                ]);
            //}
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
