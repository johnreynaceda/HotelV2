<?php

namespace App\Http\Livewire\Frontdesk\Monitoring;

use Livewire\Component;
use App\Models\Guest;
use App\Models\Transaction;

class ManageGuestTransaction extends Component
{
    public $guest;
    public $transaction;
    public $transaction_description;

    public function mount()
    {
        $this->guest = Guest::where('branch_id', auth()->user()->branch_id)->where('id', request()->id)->first();
        $this->transaction = Transaction::where('branch_id', auth()->user()->branch_id)->where('guest_id', request()->id)->get();
        $count = $this->transaction->where('description', 'Deposit')->count();
    }

    public function render()
    {
        return view('livewire.frontdesk.monitoring.manage-guest-transaction', [
            'transactions' => $this->transaction,
        ]);
    }
}
