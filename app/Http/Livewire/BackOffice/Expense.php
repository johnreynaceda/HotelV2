<?php

namespace App\Http\Livewire\BackOffice;

use Livewire\Component;
use App\Models\ExpenseCategory;
use WireUi\Traits\Actions;
class Expense extends Component
{
    use Actions;
    public $manage_modal = false;
    public $edit_expense_modal = false;
    //category
    public $category_name, $category_id;
    public function render()
    {
        return view('livewire.back-office.expense', [
            'categories' => ExpenseCategory::where(
                'branch_id',
                auth()->user()->branch_id
            )->get(),
        ]);
    }

    public function saveCategory()
    {
        $this->validate([
            'category_name' => 'required',
        ]);
        ExpenseCategory::create([
            'name' => $this->category_name,
            'branch_id' => auth()->user()->branch_id,
        ]);
        $this->category_name = '';
    }

    public function editCategory($category_id)
    {
        $category = ExpenseCategory::where('id', $category_id)->first();
        $this->category_name = $category->name;
        $this->category_id = $category->id;
        $this->edit_expense_modal = true;
    }

    public function updateCategory()
    {
        $this->validate([
            'category_name' => 'required',
        ]);
        $category = ExpenseCategory::where('id', $this->category_id)->first();
        $category->update([
            'name' => $this->category_name,
        ]);
        $this->category_name = '';
        $this->category_id = '';
        $this->edit_expense_modal = false;
    }

    public function deleteCategory($category_id)
    {
        ExpenseCategory::where('id', $category_id)->delete();
        $this->edit_expense_modal = false;
        $this->dialog()->success(
            $title = 'Category Deleted',
            $description = 'The Category was successfully deleted.'
        );
    }
}
