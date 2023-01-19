<?php

namespace App\Http\Livewire\Frontdesk\Monitoring;

use Livewire\Component;
use DB;
use App\Models\Guest;
use App\Models\Transaction;
use App\Models\ExtensionRate;
use App\Models\Type;
use App\Models\Floor;
use App\Models\Room;

class ManageGuestTransaction extends Component
{
    use Actions;
    public $guest;
    public $transaction;
    public $transaction_description;
    public $extension_rates = [];
    public $types = [];
    public $floors = [];
    public $rooms = [];

    //modals
    public $transfer_modal = false;
    public $deposit_modal = false;
    public $extend_modal = false;
    public $damage_modal = false;
    public $amenities_modal = false;
    public $food_beverages_modal = false;

    //extend
    public $extend_rate;

    //transfer
    public $type_id;
    public $floor_id;
    public $room_id;
    public $old_status;
    public $reason;
    public $total_amount;

    public function mount()
    {
        $this->guest = Guest::where('branch_id', auth()->user()->branch_id)
            ->where('id', request()->id)
            ->first();
        $this->transaction = Transaction::where(
            'branch_id',
            auth()->user()->branch_id
        )
            ->where('guest_id', request()->id)
            ->get();
        $this->items = HotelItems::where('branch_id', auth()->user()->branch_id)->get();

        $count = $this->transaction->where('description', 'Deposit')->count();

        $this->extension_rates = ExtensionRate::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();

        $this->types = Type::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();

        $this->floors = Floor::where('branch_id',auth()->user()->branch_id)->get();
    }

    public function render()
    {
        return view('livewire.frontdesk.monitoring.manage-guest-transaction', [
            'transactions' => $this->transaction,
            'items' => $this->items,
        ]);
    }

    public function updatedFloorId()
    {
        $this->rooms = Room::where('branch_id', auth()->user()->branch_id)
            ->where('type_id', $this->type_id)
            ->where('floor_id', $this->floor_id)
            ->where('status', 'Available')
            ->get();
    }

    public function saveTransfer()
    {
        $this->validate([
            'type_id' => 'required',
            'floor_id' => 'required',
            'room_id' => 'required',
            'old_status' => 'required',
            'reason' => 'required',
        ]);

        DB::beginTransaction();
        Transaction::create([
            'branch_id' => auth()->user()->branch_id,
            'room_id' => $this->room_id,
            'guest_id' => $this->guest->id,
            'floor_id',
            $this->floor_id,
        ]);
        DB::commit();
    }
}
