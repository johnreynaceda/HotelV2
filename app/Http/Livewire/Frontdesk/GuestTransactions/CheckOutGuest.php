<?php

namespace App\Http\Livewire\Frontdesk\GuestTransactions;

use App\Models\Guest;
use Livewire\Component;
use WireUi\Traits\Actions;
use App\Models\Transaction;
use Illuminate\Support\Facades\DB;

class CheckOutGuest extends Component
{
    use Actions;
    public $record;

    public $hasConfirmedRoomKeyHandedOver = false;
    public $roomKeyHandedOver;
    public $claimableDeposits;

    public $deposit_remote_and_key;
    public $deposit_except_remote_and_key;

    public $has_damaged_remote_and_key = false;

    public $assigned_frontdesk = [];

    public function mount($record)
    {
        $this->record = Guest::find($record);
        $this->deposit_remote_and_key = Transaction::where('branch_id', auth()->user()->branch_id)
            ->where('guest_id', $this->record->id)
            ->where('transaction_type_id', 2)
            ->where('remarks', 'Deposit From Check In (Room Key & TV Remote)')
            ->first()
            ?->deposit_amount ?? 0;
        $this->deposit_except_remote_and_key = Transaction::where('branch_id', auth()->user()->branch_id)
            ->where('guest_id', $this->record->id)
            ->where('transaction_type_id', 2)
            ->where('remarks', '!=', 'Deposit From Check In (Room Key & TV Remote)')
            ->first()
            ?->deposit_amount ?? 0;
        $this->assigned_frontdesk = auth()->user()->assigned_frontdesks;

        $this->has_damaged_remote_and_key = Transaction::where('branch_id', auth()->user()->branch_id)
            ->where('guest_id', $this->record->id)
            ->where('transaction_type_id', 4)
            ->where('remarks', 'Guest Charged for Damage: Room Key & TV Remote')
            ->exists();

        $this->has_damaged_remote_and_key ? $this->roomKeyHandedOver = 'No' : $this->roomKeyHandedOver = 'Yes';
         $this->has_damaged_remote_and_key ? $this->hasConfirmedRoomKeyHandedOver = false : $this->hasConfirmedRoomKeyHandedOver = true;
    }

    public function hasHandedRemote($value)
    {

         $this->dialog()->confirm([
            'title'       => 'Are you Sure?',
            'description' => 'Save the information?',
            'acceptLabel' => 'Yes, save it',
            'method'      => 'roomKeyHandedOver',
            'params'      => $value,
        ]);

    }

    public function roomKeyHandedOver($value)
    {

        $this->roomKeyHandedOver = $value;
        $this->hasConfirmedRoomKeyHandedOver = true;

        if ($this->roomKeyHandedOver == 'Yes') {
            $balance =
                $this->deposit_remote_and_key +
                ($this->deposit_except_remote_and_key -
                    $this->record->checkInDetail->total_deduction);
        } elseif ($this->roomKeyHandedOver == 'No') {
            $balance =
                $this->deposit_except_remote_and_key -
                $this->record->checkInDetail->total_deduction;
        }else{
            $balance =
                $this->deposit_remote_and_key +
                ($this->deposit_except_remote_and_key -
                    $this->record->checkInDetail->total_deduction);
        }

         $transaction = Transaction::where(
            'branch_id',
            auth()->user()->branch_id
        )
            ->where('guest_id', $this->record->id)
            ->first();

        DB::beginTransaction();
        $this->record->checkInDetail->update([
            'total_deduction' =>
                $this->record->checkInDetail->total_deduction + $balance,
        ]);

        if ($this->roomKeyHandedOver == 'No') {
            Transaction::create([
                'branch_id' => $transaction->branch_id,
                'room_id' => $transaction->room_id,
                'guest_id' => $transaction->guest_id,
                'floor_id' => $transaction->floor_id,
                'transaction_type_id' => 4,
                'assigned_frontdesk_id' => json_encode(
                    $this->assigned_frontdesk
                ),
                'description' => 'Damage Charges',
                'payable_amount' => $this->deposit_remote_and_key,
                'paid_amount' => $this->deposit_remote_and_key,
                'change_amount' => 0,
                'deposit_amount' => 0,
                'paid_at' => now(),
                'override_at' => null,
                'remarks' => 'Guest Charged for Damage: Room Key & TV Remote',
            ]);
        }
        DB::commit();


    }
    public function render()
    {
        if($this->roomKeyHandedOver == 'Yes')
        {
            $this->claimableDeposits = $this->record->transactions()->where('transaction_type_id', 2)->get();
        }elseif($this->roomKeyHandedOver == 'No'){
            $this->claimableDeposits = $this->record->transactions()
                ->where('transaction_type_id', 2)
                ->where('remarks', '!=', 'Deposit From Check In (Room Key & TV Remote)')
                ->get();
        }else {
            $this->claimableDeposits = $this->record->transactions()->where('transaction_type_id', 2)->get();
        }
        return view('livewire.frontdesk.guest-transactions.check-out-guest', [
            'deposits' => $this->claimableDeposits,
        ]);
    }
}
