<?php

namespace App\Http\Livewire\Frontdesk\Monitoring;

use Livewire\Component;
use DB;
use App\Models\Guest;
use App\Models\Transaction;
use App\Models\CheckinDetail;
use App\Models\HotelItems;
use WireUi\Traits\Actions;

class ManageGuestTransaction extends Component
{
    use Actions;
    public $guest;
    public $transaction;
    public $transaction_description;
    public $items;
    public $item_id;
    public $item_quantity;
    public $item_price;
    public $subtotal;
    public $additional_amount;
    public $total_amount;
    //modals
    public $transfer_modal = false;
    public $deposit_modal = false;
    public $extend_modal = false;
    public $damage_modal = false;
    public $amenities_modal = false;
    public $food_beverages_modal = false;



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
        $this->item_quantity = 1;
        $this->item_price = 0;
        $this->subtotal = 0;
        $this->additional_amount = 0;
        $this->total_amount = 0;
    }

    public function updated($item)
    {
        if($item == 'item_id')
        {
            if($this->item_quantity != '' && $this->additional_amount != '')
            {
                $this->item_price = HotelItems::where('branch_id', auth()->user()->branch_id)->where('id', $this->item_id)->first()->price;
                $this->subtotal = $this->item_price * $this->item_quantity;
                $this->total_amount = $this->subtotal + $this->additional_amount;
            }
        }
        
        if($item == 'item_quantity')
        {
            if($this->item_id != null)
            {
                if($this->item_quantity == '')
                {
                    $this->item_price = HotelItems::where('branch_id', auth()->user()->branch_id)->where('id', $this->item_id)->first()->price;
                    $this->subtotal = $this->item_price * 1;
                    $this->total_amount = $this->subtotal + $this->additional_amount;
                }else if($this->additional_amount == ''){
                    $this->item_price = HotelItems::where('branch_id', auth()->user()->branch_id)->where('id', $this->item_id)->first()->price;
                    $this->subtotal = $this->item_price * $this->item_quantity;
                    $this->total_amount = $this->subtotal + 0;
                }else if($this->additional_amount == '' && $this->item_quantity == ''){
                    $this->item_price = HotelItems::where('branch_id', auth()->user()->branch_id)->where('id', $this->item_id)->first()->price;
                    $this->subtotal = $this->item_price * 1;
                    $this->total_amount = $this->subtotal + 0;
                }
                else{
                    $this->item_price = HotelItems::where('branch_id', auth()->user()->branch_id)->where('id', $this->item_id)->first()->price;
                    $this->subtotal = $this->item_price * $this->item_quantity;
                    $this->total_amount = $this->subtotal + $this->additional_amount;
                }
            }
        }

        if($item == 'additional_amount')
        {
            if($this->item_id != null)
            {
                if($this->item_quantity == '')
                {
                    $this->item_price = HotelItems::where('branch_id', auth()->user()->branch_id)->where('id', $this->item_id)->first()->price;
                    $this->subtotal = $this->item_price * 1;
                    $this->total_amount = $this->subtotal + $this->additional_amount;
                }else if($this->additional_amount == ''){
                    $this->item_price = HotelItems::where('branch_id', auth()->user()->branch_id)->where('id', $this->item_id)->first()->price;
                    $this->subtotal = $this->item_price * $this->item_quantity;
                    $this->total_amount = $this->subtotal + 0;
                }else if($this->additional_amount == '' && $this->item_quantity == ''){
                    $this->item_price = HotelItems::where('branch_id', auth()->user()->branch_id)->where('id', $this->item_id)->first()->price;
                    $this->subtotal = $this->item_price * 1;
                    $this->total_amount = $this->subtotal + 0;
                }
                else{
                    $this->item_price = HotelItems::where('branch_id', auth()->user()->branch_id)->where('id', $this->item_id)->first()->price;
                    $this->subtotal = $this->item_price * $this->item_quantity;
                    $this->total_amount = $this->subtotal + $this->additional_amount;
                }
            }
        }
    }

    public function addAmenities()
    {
        $this->validate([
            'item_id' => 'required',
            'item_quantity' => 'required',
        ]);
        DB::beginTransaction();
        $check_in_detail = CheckInDetail::where('guest_id', $this->guest->id)->first();
        $amenities = HotelItems::where('branch_id', auth()->user()->branch_id)->where('id', $this->item_id)->first();

        Transaction::create([
            'branch_id' => $check_in_detail->guest->branch_id,
            'room_id' => $check_in_detail->room_id,
            'guest_id' => $check_in_detail->guest_id,
            'floor_id' => $check_in_detail->room->floor_id,
            'transaction_type_id' => 8,
            'description' => 'Amenities',
            'payable_amount' => $this->total_amount,
            'paid_amount' => 0,
            'change_amount' => 0,
            'deposit_amount' => 0,
            'paid_at' => null,
            'override_at' => null,
            'remarks' => 'Guest Added Amenities: ('.$this->item_quantity.')'.' '.$amenities->name,
        ]);
        DB::commit();
        $this->amenities_modal = false;
        $this->dialog()->success(
            $title = 'Success',
            $description = 'Data successfully saved'
        );    
    }

    public function render()
    {
        return view('livewire.frontdesk.monitoring.manage-guest-transaction', [
            'transactions' => $this->transaction,
            'items' => $this->items,
        ]);
    }
}
