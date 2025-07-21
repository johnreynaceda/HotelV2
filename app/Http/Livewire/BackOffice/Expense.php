<?php

namespace App\Http\Livewire\BackOffice;

use App\Models\User;
use Livewire\Component;
use WireUi\Traits\Actions;
use App\Models\ExpenseCategory;
use App\Models\Expense as ExpenseModel;
use Spatie\Permission\Models\Role;

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
    public $employee_name, $expense_category_id, $expense_amount, $description, $user_id, $shift;

    public $users;

    public function mount()
    {

        $this->users = User::where('branch_id', auth()->user()->branch_id)->role('frontdesk')->get();
    }

    public function render()
    {
        $this->total = ExpenseModel::whereHas('expenseCategory', function (
            $query
        ) {
            $query->where('branch_id', auth()->user()->branch_id);
        })->sum('amount');
        return view('livewire.back-office.expense', [
            'total' => $this->total,
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

    public function redirectReport()
    {
        return redirect()->route('back-office.expense-report');
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
        // Validate the inputs
        $this->validate([
            'user_id' => 'required',
            'shift' => 'required',
            'expense_category_id' => 'required',
            'expense_amount' => 'required|numeric',
            'description' => 'required',
        ]);

        $user = User::find($this->user_id);

        ExpenseModel::create([
            'user_id' => $this->user_id,
            'shift' => $this->shift,
            'name' => $user->name,
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
