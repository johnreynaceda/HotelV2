<?php

namespace App\Http\Livewire\Admin\Manage;

use Livewire\Component;
use App\Models\Discount as discountModel;
use WireUi\Traits\Actions;
use Livewire\WithPagination;

class Discount extends Component
{
    use Actions;
    use WithPagination;
    public $add_modal = false;
    public $edit_modal = false;

    public $discount_id, $name, $description, $amount, $type;

    public function render()
    {
        return view('livewire.admin.manage.discount', [
            'discounts' => discountModel::where(
                'branch_id',
                auth()->user()->branch_id
            )->get(),
        ]);
    }

    public function saveDiscount()
    {
        $this->validate([
            'name' => 'required|unique:discounts,name,',
            'description' => 'required',
            'amount' => 'required|integer|regex:/^\d+$/',
            'type' => 'required',
        ]);

        discountModel::create([
            'name' => $this->name,
            'description' => $this->description,
            'amount' => $this->amount,
            'is_percentage' => $this->type == '2' ? true : false,
            'branch_id' => auth()->user()->branch_id,
        ]);

        $this->dialog()->success(
            $title = 'Discount saved',
            $description = 'Discount was successfully saved'
        );
        $this->add_modal = false;
        $this->reset(['name', 'description', 'amount', 'type']);
    }

    public function editDiscount($discount_id)
    {
        $discount = discountModel::where('id', $discount_id)->first();
        $this->discount_id = $discount->id;
        $this->name = $discount->name;
        $this->description = $discount->description;
        $this->amount = $discount->amount;
        $this->type = $discount->is_percentage ? '2' : '1';
        $this->edit_modal = true;
    }

    public function updateDiscount()
    {
        $this->validate([
            'name' => 'required|unique:discounts,name,' . $this->discount_id,
            'description' => 'required',
            'amount' => 'required|integer|regex:/^\d+$/',
            'type' => 'required',
        ]);

        discountModel::where('id', $this->discount_id)->update([
            'name' => $this->name,
            'description' => $this->description,
            'amount' => $this->amount,
            'is_percentage' => $this->type == '2' ? true : false,
        ]);

        $this->dialog()->success(
            $title = 'Discount Updated',
            $description = 'The discount has been updated successfully.'
        );

        $this->edit_modal = false;
        $this->reset(['name', 'description', 'amount', 'type']);
    }

    public function deleteDiscount($discount_id)
    {
        $this->dialog()->confirm([
            'title' => 'Are you Sure?',
            'description' => 'delete this discount?',
            'icon' => 'question',
            'accept' => [
                'label' => 'Yes, delete this discount',
                'method' => 'confirmDelete',
                'params' => [$discount_id],
            ],
            'reject' => [
                'label' => 'No, cancel',
            ],
        ]);
    }

    public function confirmDelete($discount_id)
    {
        discountModel::where('id', $discount_id)->delete();

        $this->dialog()->success(
            $title = 'Discount Deleted',
            $description = 'The discount has been deleted successfully.'
        );
    }
}
