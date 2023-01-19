<?php

namespace App\Http\Livewire\Frontdesk\Monitoring;

use Livewire\Component;
use App\Models\Guest;
use App\Models\Transaction;
use App\Models\CheckinDetail;
use App\Models\HotelItems;
use WireUi\Traits\Actions;
use App\Models\ExtensionRate;
use App\Models\Type;
use App\Models\Floor;
use App\Models\Room;
use App\Models\Rate;
use DB;

class ManageGuestTransaction extends Component
{
    use Actions;
    public $guest;
    public $transaction;
    public $transaction_description;
    public $items;
    //Amenities
    public $item_id;
    public $item_quantity;
    public $item_price;
    public $subtotal;
    public $additional_amount;
    public $total_amount;
    //Damage Charges
    public $item_id_damage;
    public $item_price_damage;
    public $additional_amount_damage;
    public $total_amount_damage;
    //Deposit
    public $deposit_amount;
    public $deposit_remarks;
    public $deduction_amount;
    public $total_deposit;

    public $extension_rates = [];
    public $types = [];
    public $floors = [];
    public $rooms = [];

    //modals
    public $transfer_modal = false;
    public $deposit_modal = false;
    public $deposit_deduct_modal = false;
    public $extend_modal = false;
    public $damage_modal = false;
    public $amenities_modal = false;
    public $food_beverages_modal = false;
    public $autorization_modal = false;

    //extend
    public $extend_rate;

    //transfer
    public $type_id;
    public $floor_id;
    public $room_id;
    public $old_status;
    public $reason;
    public $total;
    public $code;
    public function mount()
    {
        $this->guest = Guest::where('branch_id', auth()->user()->branch_id)
            ->where('id', request()->id)
            ->first();

        $this->item_quantity = 1;
        $this->item_price = 0;
        $this->subtotal = 0;
        $this->additional_amount = 0;
        $this->total_amount = 0;

        $this->item_price_damage = 0;
        $this->additional_amount_damage = 0;
        $this->total_amount_damage = 0;

        $this->extension_rates = ExtensionRate::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();

        $this->types = Type::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();

        $this->floors = Floor::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();
    }

    public function updated($item)
    {
        if ($item == 'item_id') {
            if ($this->item_quantity != '' && $this->additional_amount != '') {
                $this->item_price = HotelItems::where(
                    'branch_id',
                    auth()->user()->branch_id
                )
                    ->where('id', $this->item_id)
                    ->first()->price;
                $this->subtotal = $this->item_price * $this->item_quantity;
                $this->total_amount =
                    $this->subtotal + $this->additional_amount;
            } elseif (
                $this->item_quantity != '' &&
                $this->additional_amount == ''
            ) {
                $this->item_price = HotelItems::where(
                    'branch_id',
                    auth()->user()->branch_id
                )
                    ->where('id', $this->item_id)
                    ->first()->price;
                $this->subtotal = $this->item_price * $this->item_quantity;
                $this->total_amount = $this->subtotal + 0;
            } elseif (
                $this->additional_amount != '' &&
                $this->item_quantity == ''
            ) {
                $this->item_price = HotelItems::where(
                    'branch_id',
                    auth()->user()->branch_id
                )
                    ->where('id', $this->item_id)
                    ->first()->price;
                $this->subtotal = $this->item_price * 1;
                $this->total_amount =
                    $this->subtotal + $this->additional_amount;
            } else {
                $this->item_price = HotelItems::where(
                    'branch_id',
                    auth()->user()->branch_id
                )
                    ->where('id', $this->item_id)
                    ->first()->price;
                $this->subtotal = $this->item_price * 1;
                $this->total_amount = $this->subtotal + 0;
            }
        }

        if ($item == 'item_quantity') {
            if ($this->item_id != null) {
                if (
                    $this->item_quantity != '' &&
                    $this->additional_amount != ''
                ) {
                    $this->item_price = HotelItems::where(
                        'branch_id',
                        auth()->user()->branch_id
                    )
                        ->where('id', $this->item_id)
                        ->first()->price;
                    $this->subtotal = $this->item_price * $this->item_quantity;
                    $this->total_amount =
                        $this->subtotal + $this->additional_amount;
                } elseif (
                    $this->item_quantity == '' &&
                    $this->additional_amount != ''
                ) {
                    $this->item_price = HotelItems::where(
                        'branch_id',
                        auth()->user()->branch_id
                    )
                        ->where('id', $this->item_id)
                        ->first()->price;
                    $this->subtotal = $this->item_price * 1;
                    $this->total_amount =
                        $this->subtotal + $this->additional_amount;
                } elseif (
                    $this->additional_amount == '' &&
                    $this->item_quantity != ''
                ) {
                    $this->item_price = HotelItems::where(
                        'branch_id',
                        auth()->user()->branch_id
                    )
                        ->where('id', $this->item_id)
                        ->first()->price;
                    $this->subtotal = $this->item_price * $this->item_quantity;
                    $this->total_amount = $this->subtotal + 0;
                } else {
                    $this->item_price = HotelItems::where(
                        'branch_id',
                        auth()->user()->branch_id
                    )
                        ->where('id', $this->item_id)
                        ->first()->price;
                    $this->subtotal = $this->item_price * 1;
                    $this->total_amount = $this->subtotal + 0;
                }
            }
        }

        if ($item == 'additional_amount') {
            if ($this->item_id != null) {
                if ($this->item_quantity == '') {
                    $this->item_price = HotelItems::where(
                        'branch_id',
                        auth()->user()->branch_id
                    )
                        ->where('id', $this->item_id)
                        ->first()->price;
                    $this->subtotal = $this->item_price * 1;
                    $this->total_amount =
                        $this->subtotal + $this->additional_amount;
                } elseif ($this->additional_amount == '') {
                    $this->item_price = HotelItems::where(
                        'branch_id',
                        auth()->user()->branch_id
                    )
                        ->where('id', $this->item_id)
                        ->first()->price;
                    $this->subtotal = $this->item_price * $this->item_quantity;
                    $this->total_amount = $this->subtotal + 0;
                } elseif (
                    $this->additional_amount == '' &&
                    $this->item_quantity == ''
                ) {
                    $this->item_price = HotelItems::where(
                        'branch_id',
                        auth()->user()->branch_id
                    )
                        ->where('id', $this->item_id)
                        ->first()->price;
                    $this->subtotal = $this->item_price * 1;
                    $this->total_amount = $this->subtotal + 0;
                } else {
                    $this->item_price = HotelItems::where(
                        'branch_id',
                        auth()->user()->branch_id
                    )
                        ->where('id', $this->item_id)
                        ->first()->price;
                    $this->subtotal = $this->item_price * $this->item_quantity;
                    $this->total_amount =
                        $this->subtotal + $this->additional_amount;
                }
            } elseif ($this->additional_amount != '') {
                $this->total_amount =
                    $this->subtotal + $this->additional_amount;
            } else {
                $this->total_amount = 0;
            }
        }

        if($item == 'item_id_damage')
        {
            if ($this->item_id_damage != null && $this->additional_amount_damage == '') {
                $this->item_price_damage = HotelItems::where('branch_id',auth()->user()->branch_id)
                ->where('id', $this->item_id_damage)
                ->first()->price;
                $this->total_amount_damage = $this->item_price_damage + 0;
            }else if($this->item_id_damage == null && $this->additional_amount_damage != ''){
                $this->total_amount_damage = 0 + $this->additional_amount_damage;
            }else{
                $this->item_price_damage = HotelItems::where('branch_id',auth()->user()->branch_id)
                ->where('id', $this->item_id_damage)
                ->first()->price;
                $this->total_amount_damage = $this->item_price_damage + $this->additional_amount_damage;
            }
        }

        if($item == 'additional_amount_damage')
        {
              if ($this->item_id_damage != null && $this->additional_amount_damage == '') {
                    $this->item_price_damage = HotelItems::where('branch_id',auth()->user()->branch_id)
                    ->where('id', $this->item_id_damage)
                    ->first()->price;
                    $this->total_amount_damage = $this->item_price_damage + 0;
                }else if($this->item_id_damage == null && $this->additional_amount_damage != ''){
                    $this->total_amount_damage = 0 + $this->additional_amount_damage;
                }else{
                    $this->item_price_damage = HotelItems::where('branch_id',auth()->user()->branch_id)
                    ->where('id', $this->item_id_damage)
                    ->first()->price;
                    $this->total_amount_damage = $this->item_price_damage + $this->additional_amount_damage;
                }
        }


    }

    public function addAmenities()
    {
        $this->validate([
            'item_id' => 'required',
            'item_quantity' => 'required',
        ],
        [
            'item_id.required' => 'This field is required',
            'item_quantity.required' => 'This field is required',
        ]);
        DB::beginTransaction();
        $check_in_detail = CheckInDetail::where(
            'guest_id',
            $this->guest->id
        )->first();
        $amenities = HotelItems::where('branch_id', auth()->user()->branch_id)
            ->where('id', $this->item_id)
            ->first();

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
            'remarks' =>
                'Guest Added Amenities: (' .
                $this->item_quantity .
                ')' .
                ' ' .
                $amenities->name,
        ]);
        DB::commit();
        $this->amenities_modal = false;
        $this->dialog()->success(
            $title = 'Success',
            $description = 'Data successfully saved'
        );
        return redirect()->back();
        

        $this->extension_rates = ExtensionRate::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();

        $this->types = Type::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();

        $this->floors = Floor::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();
    }

    public function addDamageCharges()
    {
        $this->validate([
            'item_id_damage' => 'required',
        ],
        [
            'item_id_damage.required' => 'This field is required',
        ]);
        DB::beginTransaction();
        $check_in_detail = CheckInDetail::where(
            'guest_id',
            $this->guest->id
        )->first();
        $damage_charges = HotelItems::where('branch_id', auth()->user()->branch_id)
            ->where('id', $this->item_id_damage)
            ->first();

        Transaction::create([
            'branch_id' => $check_in_detail->guest->branch_id,
            'room_id' => $check_in_detail->room_id,
            'guest_id' => $check_in_detail->guest_id,
            'floor_id' => $check_in_detail->room->floor_id,
            'transaction_type_id' => 8,
            'description' => 'Damage Charges',
            'payable_amount' => $this->total_amount_damage,
            'paid_amount' => 0,
            'change_amount' => 0,
            'deposit_amount' => 0,
            'paid_at' => null,
            'override_at' => null,
            'remarks' =>
                'Guest Charged for Damage: (' .
                1 .
                ')' .
                ' ' .
                $damage_charges->name,
        ]);
        DB::commit();
        $this->damage_modal = false;
        $this->dialog()->success(
            $title = 'Success',
            $description = 'Data successfully saved'
        );
        return redirect()->back();

        $this->extension_rates = ExtensionRate::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();

        $this->types = Type::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();

        $this->floors = Floor::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();
    }

    public function render()
    {
        $this->transaction = Transaction::where(
            'branch_id',
            auth()->user()->branch_id
        )
            ->where('guest_id', request()->id)
            ->get();

        $this->items = HotelItems::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();

        $this->total_deposit = Transaction::where('branch_id', auth()->user()->branch_id)->where('description', 'Deposit')->sum('deposit_amount');
        return view('livewire.frontdesk.monitoring.manage-guest-transaction', [
            'items' => $this->items,
            'transactions' => $this->transaction->groupBy('description'),
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

    public function updatedTypeId()
    {
        $hours = $this->guest->checkInDetail->hours_stayed;
        $new_room = Rate::where('branch_id', auth()->user()->branch_id)
            ->where('type_id', $this->type_id)
            ->where('is_available', true)
            ->whereHas('stayingHour', function ($query) use ($hours) {
                $query
                    ->where('branch_id', auth()->user()->branch_id)
                    ->where('number', '=', $hours);
            })
            ->first();
        if ($new_room->amount > $this->guest->static_amount) {
            $this->total = $new_room->amount - $this->guest->static_amount;
        } else {
            $this->total = 0;
        }
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

        $this->autorization_modal = true;
    }

    public function proceedTransfer()
    {
        $this->validate([
            'code' => 'required',
        ]);

        $autorization_code = auth()->user()->branch->autorization_code;

        if ($this->code != $autorization_code) {
            $this->dialog()->error(
                $title = 'Error',
                $description = 'Invalid Code'
            );
        } else {
            $this->dialog()->confirm([
                'title' => 'Are you Sure?',
                'description' => 'Save the information?',
                'icon' => 'question',
                'accept' => [
                    'label' => 'Yes, save it',
                    'method' => 'addTransfer',
                ],
                'reject' => [
                    'label' => 'No, cancel',
                ],
            ]);
        }
    }

    public function addTransfer()
    {
        DB::beginTransaction();
        Transaction::create([
            'branch_id' => auth()->user()->branch_id,
            'room_id' => $this->room_id,
            'guest_id' => $this->guest->id,
            'floor_id' => $this->floor_id,
            'transaction_type_id' => 7,
            'description' => 'Room Transfer',
            'payable_amount' => $this->total,
            'paid_amount' => 0,
            'change_amount' => 0,
            'deposit_amount' => 0,
            'paid_at' => null,
            'override_at' => null,
            'remarks' =>
                'Guest Transfered from Room #' .
                Room::where('id', $this->guest->checkInDetail->room_id)->first()
                    ->number .
                ' (' .
                Type::where('id', $this->guest->checkInDetail->type_id)->first()
                    ->name .
                ') to Room #' .
                Room::where('id', $this->room_id)->first()->number .
                ' (' .
                Type::where('id', $this->type_id)->first()->name .
                ') - Reason: ' .
                $this->reason,
        ]);

        Room::where('id', $this->room_id)->update([
            'status' => $this->old_status,
        ]);

        $this->dialog()->success(
            $title = 'Success',
            $description = 'Room Transfered'
        );
        DB::commit();
        $this->transfer_modal = false;
        $this->autorization_modal = false;
    }

    public function addNewDeposit()
    {
        $this->validate([
            'deposit_amount' => 'required|gte:0',
            'deposit_remarks' => 'required',
        ]);

        DB::beginTransaction();
        $check_in_detail = CheckInDetail::where(
            'guest_id',
            $this->guest->id
        )->first();
        Transaction::create([
            'branch_id' => $check_in_detail->guest->branch_id,
            'room_id' => $check_in_detail->room_id,
            'guest_id' => $check_in_detail->guest_id,
            'floor_id' => $check_in_detail->room->floor_id,
            'transaction_type_id' => 2,
            'description' => 'Deposit',
            'payable_amount' => 0,
            'paid_amount' => 0,
            'change_amount' => 0,
            'deposit_amount' => $this->deposit_amount,
            'paid_at' => null,
            'override_at' => null,
            'remarks' =>'Guest Deposit: '.$this->deposit_remarks,
        ]);
        DB::commit();
        $this->deposit_modal = false;
        $this->dialog()->success(
            $title = 'Success',
            $description = 'Data successfully saved'
        );
        return redirect()->back();
    }

    public function deductDeposit()
    {
        $this->validate([
            'deduction_amount' => 'required',
        ]);

        DB::beginTransaction();
        $check_in_detail = CheckInDetail::where(
            'guest_id',
            $this->guest->id
        )->first();
        Transaction::create([
            'branch_id' => $check_in_detail->guest->branch_id,
            'room_id' => $check_in_detail->room_id,
            'guest_id' => $check_in_detail->guest_id,
            'floor_id' => $check_in_detail->room->floor_id,
            'transaction_type_id' => 5,
            'description' => 'Deposit',
            'payable_amount' => 0,
            'paid_amount' => 0,
            'change_amount' => 0,
            'deposit_amount' => -1 * $this->deduction_amount,
            'paid_at' => null,
            'override_at' => null,
            'remarks' =>'Guest Deduction of Deposit: ₱'.$this->deduction_amount.' deducted.',
        ]);
        DB::commit();
        $this->deposit_modal = false;
        $this->deposit_deduct_modal = false;
        $this->dialog()->success(
            $title = 'Success',
            $description = 'Data successfully saved'
        );
        return redirect()->back();
    }
}
