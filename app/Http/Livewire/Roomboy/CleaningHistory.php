<?php

namespace App\Http\Livewire\Roomboy;

use Livewire\Component;

class CleaningHistory extends Component
{
    public $histories;
    public $date_from;
    public $date_to;
    public $status;

    public function render()
    {
        $query = auth()->user()->cleaningHistories()
            ->orderBy('created_at', 'desc');

        // Filter by date_from
        if ($this->date_from) {
            $query->whereDate('start_time', '>=', $this->date_from);
        }

        // Filter by date_to
        if ($this->date_to) {
            $query->whereDate('end_time', '<=', $this->date_to);
        }

        // Get results first
        $records = $query->get();

        // Filter by status in PHP since it's computed
        if ($this->status) {
            $records = $records->filter(function ($record) {
                $duration = $record->cleaning_duration;

                if ($this->status === 'T') {
                    return $duration == 15;
                } elseif ($this->status === 'OT') {
                    return $duration > 15;
                } elseif ($this->status === 'ADV') {
                    return $duration < 15;
                }

                return true;
            });
        }

        $this->histories = $records;

        return view('livewire.roomboy.cleaning-history', [
            'histories' => $this->histories
        ]);
    }


}
