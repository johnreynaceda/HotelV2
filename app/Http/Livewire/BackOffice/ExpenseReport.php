<?php

namespace App\Http\Livewire\BackOffice;

use App\Models\User;
use App\Models\Expense;
use Livewire\Component;

class ExpenseReport extends Component
{
    public $shift;
    public $frontdesk;
    public $frontdesk_id;

    public function render()
    {
        return view('livewire.back-office.expense-report', [
            'frontdesks' => User::where('branch_id', auth()->user()->branch_id)->role('frontdesk')->get(),
            'expenses' => Expense::whereHas('expenseCategory', function ($query) {
                $query->where('branch_id', auth()->user()->branch_id);
            })
            ->when($this->shift, function ($query) {
                $query->where('shift', $this->shift);
            })
            ->when($this->frontdesk_id, function ($query) {
                $query->where('user_id', $this->frontdesk_id);
            })
            ->get(),
        ]);
    }
}
