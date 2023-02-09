<?php

namespace App\Http\Livewire\Admin\Manage;

use Livewire\Component;
use App\Models\RequestableItem;
use WireUi\Traits\Actions;
use Livewire\WithPagination;

class Amenities extends Component
{
    use WithPagination;
    use Actions;
    public $name, $amount, $request_id;
    public $add_modal = false;
    public $edit_modal = false;
    public $search;
    public function render()
    {
        return view('livewire.admin.manage.amenities', [
            'requestable_items' => RequestableItem::where(
                'branch_id',
                auth()->user()->branch_id
            )->where('name', 'like', '%' . $this->search . '%')->get(),
        ]);
    }

    public function saveRequest()
    {
        $this->validate([
            'name' => 'required|unique:requestable_items,name',
            'amount' => 'required|numeric|regex:/^\d+$/',
        ]);

        RequestableItem::create([
            'name' => $this->name,
            'price' => $this->amount,
            'branch_id' => auth()->user()->branch_id,
        ]);
        $this->dialog()->success(
            $title = 'Requestable Item Saved',
            $description = 'Item has been saved successfully'
        );
        $this->add_modal = false;
        $this->name = null;
        $this->amount = null;
    }

    public function editItem($item_id)
    {
        $item = RequestableItem::where('id', $item_id)->first();
        $this->item_id = $item->id;
        $this->name = $item->name;
        $this->amount = $item->price;
        $this->edit_modal = true;
    }

    public function updateItems()
    {
        $this->validate([
            'name' =>
                'required|unique:requestable_items,name,' . $this->item_id,
            'amount' => 'required|numeric|regex:/^\d+$/',
        ]);

        RequestableItem::where('id', $this->item_id)->update([
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
        RequestableItem::where('id', $item_id)->delete();
        $this->dialog()->success(
            $title = 'Item Deleted',
            $description = 'item has been deleted successfully'
        );
    }
}
