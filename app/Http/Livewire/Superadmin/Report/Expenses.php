<?php

namespace App\Http\Livewire\Superadmin\Report;

use App\Models\Branch;
use App\Models\User;
use App\Models\Expense;
use Livewire\Component;

class Expenses extends Component
{
    public $shift = '';
    public $branch_id = '';
    public $frontdesk;
    public $frontdesk_id = '';

    public function render()
    {
        return view('livewire.superadmin.report.expenses', [
            'branches' => Branch::all(),
            'frontdesks' => User::when($this->branch_id, function ($query) {
                $query->where('branch_id', $this->branch_id);
            })->role('frontdesk')->get(),
            'expenses' => Expense::whereHas('expenseCategory', function ($query) {
                $query->when($this->branch_id, function ($query) {
                    $query->where('branch_id', $this->branch_id);
                });
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
