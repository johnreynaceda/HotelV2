<?php

namespace App\Http\Livewire\BackOffice;
use App\Models\Transaction;

use Livewire\Component;

class SalesReport extends Component
{
     public $type = 'Overall Sales';
    public function render()
    {
         $transactions = Transaction::query();
          switch ($this->type) {
            case 'Daily':
                $transactions->whereDate('paid_at', now()->format('Y-m-d'));
                break;
            case 'Weekly':
                $transactions->whereDate('paid_at', '>=', now()->startOfWeek());
                $transactions->whereDate('paid_at', '<=', now()->endOfWeek());
                break;
            case 'Monthly':
                $transactions->whereMonth('paid_at', now()->month);
                $transactions->whereYear('paid_at', now()->year);
                break;
            default:
                // Handle Overall Sales or any other cases
        }
        $transactions = $transactions->whereNotIn('transaction_type_id', [2, 5, 7])->get(); // Fetch the results
        $totalSales = $transactions->sum('paid_amount');

        return view('livewire.back-office.sales-report', compact('transactions', 'totalSales'));
    }
}
