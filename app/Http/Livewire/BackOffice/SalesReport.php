<?php

namespace App\Http\Livewire\BackOffice;
use App\Models\Transaction;

use Livewire\Component;

class SalesReport extends Component
{
     public $type = 'Overall Sales';
     public $showExtend = true;
     public $showAmenities = true;
     public $showFood = true;
     public $showDamages = true;
     public $showDeposits = true;

     public $totalSales = 0;

    public $extendedTransactions;
    public $amenitiesTransactions;
    public $foodTransactions;
    public $damagesTransactions;
    public $depositTransactions;

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
        }

        $transactions = $transactions
            ->whereNotIn('transaction_type_id', [5, 7])
            ->selectRaw('room_id, SUM(paid_amount) as total_paid')
            ->groupBy('room_id')
            ->get();


        // $transactions = $transactions
        //     ->whereNotIn('transaction_type_id', [2, 5, 7])
        //     ->selectRaw('room_id, SUM(paid_amount) as total_paid')
        //     ->groupBy('room_id')
        //     ->get();

        // Get all extended transactions as a Collection
        $this->extendedTransactions = Transaction::where('transaction_type_id', 6)
            ->whereIn('room_id', $transactions->pluck('room_id'))
            ->selectRaw('room_id, SUM(paid_amount) as total_paid')
            ->groupBy('room_id')
            ->get();

        $this->amenitiesTransactions = Transaction::where('transaction_type_id', 8)
            ->whereIn('room_id', $transactions->pluck('room_id'))
            ->selectRaw('room_id, SUM(paid_amount) as total_paid')
            ->groupBy('room_id')
            ->get();

        $this->foodTransactions = Transaction::where('transaction_type_id', 9)
            ->whereIn('room_id', $transactions->pluck('room_id'))
            ->selectRaw('room_id, SUM(paid_amount) as total_paid')
            ->groupBy('room_id')
            ->get();

        $this->damagesTransactions = Transaction::where('transaction_type_id', 4)
            ->whereIn('room_id', $transactions->pluck('room_id'))
            ->selectRaw('room_id, SUM(paid_amount) as total_paid')
            ->groupBy('room_id')
            ->get();

        $this->depositTransactions = Transaction::where('transaction_type_id', 2)
            ->whereIn('room_id', $transactions->pluck('room_id'))
            ->selectRaw('room_id, SUM(paid_amount) as total_paid')
            ->groupBy('room_id')
            ->get();

         $roomAmount = 0;

        foreach ($transactions as $transaction) {
            $roomAmount += $transaction->room->latestCheckInDetail->rate->amount;
        }

        $this->totalSales =
                ($this->showExtend ? ($this->extendedTransactions->sum('total_paid') ?? 0) : 0) +
                ($this->showAmenities ? ($this->amenitiesTransactions->sum('total_paid') ?? 0) : 0) +
                ($this->showFood ? ($this->foodTransactions->sum('total_paid') ?? 0) : 0) +
                ($this->showDamages ? ($this->damagesTransactions->sum('total_paid') ?? 0) : 0) +
                ($this->showDeposits ? ($this->depositTransactions->sum('total_paid') ?? 0) : 0) +
                $roomAmount;

                // dd($transactions->sum('total_paid'),
                //     $this->extendedTransactions->sum('total_paid'),
                //     $this->amenitiesTransactions->sum('total_paid'),
                //     $this->foodTransactions->sum('total_paid'),
                //     $this->damagesTransactions->sum('total_paid'),
                //     $this->depositTransactions->sum('total_paid'),
                //     $roomAmount
                // );

        // $extendedTransactions = Transaction::where('transaction_type_id', 6)
        //     ->whereNotIn('room_id', $transactions->pluck('room_id'))
        //     ->selectRaw('room_id, SUM(paid_amount) as total_paid')
        //     ->groupBy('room_id')
        //     ->get();
        // $amenitiesTransactions = Transaction::where('transaction_type_id', 8)
        //     ->whereNotIn('room_id', $transactions->pluck('room_id'))
        //     ->selectRaw('room_id, SUM(paid_amount) as total_paid')
        //     ->groupBy('room_id')
        //     ->get();
        // $foodTransactions = Transaction::where('transaction_type_id', 9)
        //     ->whereNotIn('room_id', $transactions->pluck('room_id'))
        //     ->selectRaw('room_id, SUM(paid_amount) as total_paid')
        //     ->groupBy('room_id')
        //     ->get();
        // $damagesTransactions = Transaction::where('transaction_type_id', 4)
        //     ->whereNotIn('room_id', $transactions->pluck('room_id'))
        //     ->selectRaw('room_id, SUM(paid_amount) as total_paid')
        //     ->groupBy('room_id')
        //     ->get();
        // $depositTransactions = Transaction::where('transaction_type_id', 2)
        //     ->whereNotIn('room_id', $transactions->pluck('room_id'))
        //     ->selectRaw('room_id, SUM(paid_amount) as total_paid')
        //     ->groupBy('room_id')
        //     ->get();



        //  dd($transactions->sum('total_paid'), $extendedTransactions->sum('total_paid'),
        //     $amenitiesTransactions->sum('total_paid'), $foodTransactions->sum('total_paid'),
        //     $damagesTransactions->sum('total_paid'), $depositTransactions->sum('total_paid'),
        //     $roomAmount
        // );


        return view('livewire.back-office.sales-report', [
            'transactions' => $transactions,
            'totalSales' => $this->totalSales,
        ]);
    }
}
