<?php

namespace App\Http\Livewire\Admin\Manage;

use Livewire\Component;
use App\Models\HotelItems;
use WireUi\Traits\Actions;
use Livewire\WithPagination;

class DamageCharges extends Component
{
    use WithPagination;
    use Actions;
    public $name, $amount, $item_id;
    public $add_modal = false;
    public $edit_modal = false;
    public $search;
    public function render()
    {
        return view('livewire.admin.manage.damage-charges', [
            'items' => HotelItems::where(
                'branch_id',
                auth()->user()->branch_id
            )->where('name', 'like', '%' . $this->search . '%')->get(),
        ]);
    }

    public function saveCharges()
    {
        $this->validate([
            'name' => 'required|unique:hotel_items,name',
            'amount' => 'required|numeric|regex:/^\d+$/',
        ]);

        HotelItems::create([
            'name' => $this->name,
            'price' => $this->amount,
            'branch_id' => auth()->user()->branch_id,
        ]);
        $this->dialog()->success(
            $title = 'Item Saved',
            $description = 'item has been saved successfully'
        );
        $this->add_modal = false;
        $this->name = null;
        $this->amount = null;
    }

    public function editItem($item_id)
    {
        $item = HotelItems::where('id', $item_id)->first();
        $this->item_id = $item->id;
        $this->name = $item->name;
        $this->amount = $item->price;
        $this->edit_modal = true;
    }

    public function updateCharges()
    {
        $this->validate([
            'name' => 'required|unique:hotel_items,name,' . $this->item_id,
            'amount' => 'required|numeric|regex:/^\d+$/',
        ]);

        HotelItems::where('id', $this->item_id)->update([
            'name' => $this->name,
            'price' => $this->amount,
        ]);
        $this->dialog()->success(
            $title = 'Item Updated',
            $description = 'item has been updated successfully'
        );
        $this->edit_modal = false;
        $this->name = null;
        $this->amount = null;
    }

    public function deleteItem($item_id)
    {
        $this->dialog()->confirm([
            'title' => 'Are you Sure?',
            'description' => 'delete Damage Charges',
            'icon' => 'question',
            'accept' => [
                'label' => 'Yes, delete it',
                'method' => 'confirmDelete',
                'params' => [$item_id],
            ],
            'reject' => [
                'label' => 'No, cancel',
            ],
        ]);
    }

    public function confirmDelete($item_id)
    {
        HotelItems::where('id', $item_id)->delete();
        $this->dialog()->success(
            $title = 'Item Deleted',
            $description = 'item has been deleted successfully'
        );
    }
}
