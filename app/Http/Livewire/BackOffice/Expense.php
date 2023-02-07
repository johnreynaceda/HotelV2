<?php

namespace App\Http\Livewire\BackOffice;

use Livewire\Component;
use App\Models\ExpenseCategory;
use WireUi\Traits\Actions;
use App\Models\Expense as ExpenseModel;
class Expense extends Component
{
    use Actions;
    public $manage_modal = false;
    public $edit_expense_modal = false;
    public $add_modal = false;

    public $total;
    //category
    public $category_name, $category_id;

    //expenses
    public $employee_name, $expense_category_id, $expense_amount, $description;

    public function mount()
    {
        $this->total = ExpenseModel::whereHas('expenseCategory', function (
            $query
        ) {
            $query->where('branch_id', auth()->user()->branch_id);
        })->sum('amount');
    }

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

    public function saveExpense()
    {
        $this->validate([
            'employee_name' => 'required',
            'expense_category_id' => 'required',
            'expense_amount' => 'required|numeric',
            'description' => 'required',
        ]);

        ExpenseModel::create([
            'name' => $this->employee_name,
            'expense_category_id' => $this->expense_category_id,
            'amount' => $this->expense_amount,
            'description' => $this->description ?? null,
        ]);
        $this->dialog()->success(
            $title = 'Expense Added',
            $description = 'The Expense was successfully added.'
        );
        $this->reset(
            'employee_name',
            'expense_category_id',
            'expense_amount',
            'description'
        );
        $this->add_modal = false;
    }
}
