<?php

namespace App\Http\Livewire\BackOffice;
use Livewire\Component;

use App\Models\Frontdesk;
use App\Models\Transaction;

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

    public $transactions;

    public function mount()
    {
        // Set default values
        $this->transactions = collect();
        $this->totalSales = 0;

        // Optional: load default report (ex: today's report)
        $this->type = 'Overall Sales';
        $this->generateReport();
    }

   public function render()
    {
        return view('livewire.back-office.sales-report', [
            'transactions' => $this->transactions ?? collect(),
            'totalSales' => $this->totalSales ?? 0,
            'frontdesks' => Frontdesk::where('branch_id', auth()->user()->branch_id)->get(),
        ]);
    }

    public function generateReport()
    {
        $transactions = Transaction::query()
        ->whereHas('room.latestCheckInDetail', function ($q) {
            $q->when($this->date_from, fn($q, $d) => $q->whereDate('check_in_at', '>=', $d))
            ->when($this->date_to, fn($q, $d) => $q->whereDate('check_in_at', '<=', $d))
            ->when($this->frontdesk, fn($q, $f) => $q->where('frontdesk_id', $f));
        })
        ->when($this->shift, function ($q, $shift) {
            $q->whereHas('room.checkOutGuestReports', function ($q2) use ($shift) {
                $q2->where('shift', $shift);
            });
        });

        switch ($this->type) {
            case 'Daily':
                $transactions->whereDate('paid_at', now()->format('Y-m-d'));
                break;
            case 'Weekly':
                $transactions->whereBetween('paid_at', [now()->startOfWeek(), now()->endOfWeek()]);
                break;
            case 'Monthly':
                $transactions->whereMonth('paid_at', now()->month)
                            ->whereYear('paid_at', now()->year);
                break;
            default:
                break;
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
            ($this->showExtend ? $this->extendedTransactions->sum('total_paid') : 0) +
            ($this->showAmenities ? $this->amenitiesTransactions->sum('total_paid') : 0) +
            ($this->showFood ? $this->foodTransactions->sum('total_paid') : 0) +
            ($this->showDamages ? $this->damagesTransactions->sum('total_paid') : 0) +
            ($this->showDeposits ? $this->depositTransactions->sum('total_paid') : 0) +
            $roomAmount;

        // Save final transactions for the view
        $this->transactions = $transactions;
    }

    public function resetFilters()
    {
        $this->reset(['frontdesk', 'type', 'date_from', 'date_to', 'shift']);
        $this->transactions = collect();
        $this->totalSales = 0;
        // Optional: load default report (ex: today's report)
        $this->type = 'Overall Sales';
        $this->generateReport();
    }


    public function returnBack()
    {
        return redirect()->route('back-office.reports');
    }
}
