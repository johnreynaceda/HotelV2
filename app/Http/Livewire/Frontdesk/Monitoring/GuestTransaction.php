<?php

namespace App\Http\Livewire\Frontdesk\Monitoring;

use Livewire\Component;
use App\Models\TransactionType;
use App\Models\Guest;
use App\Models\Transaction;
use App\Models\CheckinDetail;
use App\Models\HotelItems;
use App\Models\RequestableItem;
use WireUi\Traits\Actions;
use App\Models\ExtensionRate;
use App\Models\Type;
use App\Models\Floor;
use App\Models\Room;
use App\Models\Rate;
use App\Models\Menu;
use App\Models\Inventory;
use App\Models\AssignedFrontdesk;
use App\Models\StayExtension;
use Carbon\Carbon;
use DB;

class GuestTransaction extends Component
{
    public $guest_id;

    //modals
    public $transfer_modal = false;
    public $deposit_modal = false;
    public $deposit_deduct_modal = false;
    public $extend_modal = false;
    public $damage_modal = false;
    public $amenities_modal = false;
    public $food_beverages_modal = false;
    public $autorization_modal = false;
    public $pay_modal = false;
    public $payWithDeposit_modal = false;
    public $payAllWithDeposit_modal = false;
    public $reminders_modal = false;
    public $override_modal = false;

    //Deposit
    public $deposit_amount;
    public $deposit_remarks;
    public $deduction_amount;
    public $total_deposit;
    public $deposit_remote_and_key;
    public $deposit_except_remote_and_key;
    public $check_in_details;

    public function mount()
    {
        $this->guest_id = request()->id;
    }
    public function render()
    {
        return view('livewire.frontdesk.monitoring.guest-transaction', [
            'transactions' => TransactionType::whereHas('transactions')
                ->with('transactions')
                ->get(),
            'guest' => Guest::where('id', $this->guest_id)->first(),
        ]);
    }

    public function updatedDepositModal()
    {
        // dd('sdsd');
        $this->check_in_details = CheckinDetail::where(
            'guest_id',
            $this->guest_id
        )->first();
        $this->deposit_remote_and_key = Transaction::where(
            'branch_id',
            auth()->user()->branch_id
        )
            ->where('guest_id', $this->guest_id)
            ->where('transaction_type_id', 2)
            ->where('remarks', 'Deposit From Check In (Room Key & TV Remote)')
            ->sum('payable_amount');

        $this->deposit_except_remote_and_key = Transaction::where(
            'branch_id',
            auth()->user()->branch_id
        )
            ->where('guest_id', $this->guest_id)
            ->where('transaction_type_id', 2)
            ->where(
                'remarks',
                '!=',
                'Deposit From Check In (Room Key & TV Remote)'
            )
            ->sum('payable_amount');
    }
}
