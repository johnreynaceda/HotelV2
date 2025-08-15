<?php

namespace App\Http\Livewire\Roomboy;

use Livewire\Component;

class CleaningHistory extends Component
{
    public $histories;
    public function render()
    {
        $this->histories = auth()->user()->cleaningHistories()
            ->orderBy('created_at', 'desc')
            ->get();
        return view('livewire.roomboy.cleaning-history', [
            'histories' => $this->histories
        ]);
    }
}
