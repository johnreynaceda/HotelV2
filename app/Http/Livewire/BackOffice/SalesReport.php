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

    public $date_from;
    public $date_to;
    public $shift;
    public $frontdesk;

    public function render()
    {
        $transactions = Transaction::query()
            ->whereHas('room.latestCheckInDetail', function ($query) {
            $query->when($this->date_from, function ($q, $date_from) {
                $q->whereDate('check_in_at', '>=', $date_from);
            })->when($this->date_to, function ($q, $date_to) {
                $q->whereDate('check_in_at', '<=', $date_to);
            })->when($this->frontdesk, function ($q, $frontdesk) {
                $q->where('frontdesk_id', $frontdesk);
            });
            })
            ->whereHas('room.checkOutGuestReports', function ($query) {
            $query->when($this->shift, function ($q, $shift) {
                $q->where('shift', $shift);
            });
            });

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
            ->selectRaw('room_id, SUM(payable_amount) as total_paid')
            ->groupBy('room_id')
            ->get();

        $roomIds = $transactions->pluck('room_id');

        $this->extendedTransactions = Transaction::where('transaction_type_id', 6)
            ->whereIn('room_id', $roomIds)
            ->selectRaw('room_id, SUM(payable_amount) as total_paid')
            ->groupBy('room_id')
            ->get();

        $this->amenitiesTransactions = Transaction::where('transaction_type_id', 8)
            ->whereIn('room_id', $roomIds)
            ->selectRaw('room_id, SUM(payable_amount) as total_paid')
            ->groupBy('room_id')
            ->get();

        $this->foodTransactions = Transaction::where('transaction_type_id', 9)
            ->whereIn('room_id', $roomIds)
            ->selectRaw('room_id, SUM(payable_amount) as total_paid')
            ->groupBy('room_id')
            ->get();

        $this->damagesTransactions = Transaction::where('transaction_type_id', 4)
            ->whereIn('room_id', $roomIds)
            ->selectRaw('room_id, SUM(payable_amount) as total_paid')
            ->groupBy('room_id')
            ->get();

        $this->depositTransactions = Transaction::where('transaction_type_id', 2)
            ->whereNotIn('remarks', ['Deposit From Check In (Room Key & TV Remote)'])
            ->whereIn('room_id', $roomIds)
            ->selectRaw('room_id, SUM(payable_amount) as total_paid')
            ->groupBy('room_id')
            ->get();

        $roomAmount = 0;

        foreach ($transactions as $transaction) {
            $roomAmount += $transaction->room->latestCheckInDetail?->rate->amount;
        }

        $this->totalSales =
            ($this->showExtend ? ($this->extendedTransactions->sum('total_paid') ?? 0) : 0) +
            ($this->showAmenities ? ($this->amenitiesTransactions->sum('total_paid') ?? 0) : 0) +
            ($this->showFood ? ($this->foodTransactions->sum('total_paid') ?? 0) : 0) +
            ($this->showDamages ? ($this->damagesTransactions->sum('total_paid') ?? 0) : 0) +
            ($this->showDeposits ? ($this->depositTransactions->sum('total_paid') ?? 0) : 0) +
            $roomAmount;

        return view('livewire.back-office.sales-report', [
            'transactions' => $transactions,
            'totalSales' => $this->totalSales,
            'frontdesks' => \App\Models\Frontdesk::where('branch_id', auth()->user()->branch_id)->get(),
        ]);
    }

    public function returnBack()
    {
        return redirect()->route('back-office.reports');
    }
}
