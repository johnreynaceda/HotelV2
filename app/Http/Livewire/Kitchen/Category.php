<?php

namespace App\Http\Livewire\Kitchen;

use Livewire\Component;
use App\Models\MenuCategory;
use WireUi\Traits\Actions;

class Category extends Component
{
    use Actions;
    public $name;
    public $category_id;
    public $add_modal = false;
    public $edit_modal = false;
    public function render()
    {
        return view('livewire.kitchen.category', [
            'categories' => MenuCategory::where(
                'branch_id',
                auth()->user()->branch_id
            )->get(),
        ]);
    }

    public function saveCategory()
    {
        $this->validate([
            'name' => 'required',
        ]);

        MenuCategory::create([
            'name' => $this->name,
            'branch_id' => auth()->user()->branch_id,
        ]);
        $this->add_modal = false;
        $this->dialog()->success(
            $title = 'Success',
            $description = 'Category Added Successfully'
        );
    }

    public function editItem($item_id)
    {
        $item = MenuCategory::where('id', $item_id)->first();
        $this->name = $item->name;
        $this->category_id = $item->id;

        $this->edit_modal = true;
    }

    public function updateCategory()
    {
        $this->validate([
            'name' => 'required',
        ]);

        MenuCategory::where('id', $this->category_id)->update([
            'name' => $this->name,
        ]);
        $this->edit_modal = false;
        $this->dialog()->success(
            $title = 'Success',
            $description = 'Category Updated Successfully'
        );
    }

    public function deleteItem($item_id)
    {
        MenuCategory::where('id', $item_id)->delete();
        $this->dialog()->success(
            $title = 'Success',
            $description = 'Category Deleted Successfully'
        );
    }
}
