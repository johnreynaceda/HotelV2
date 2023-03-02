<?php

namespace App\Http\Livewire\BackOffice\Reports;

use Livewire\Component;
use App\Models\UnoccupiedRoomReport;

class UnccupiedRoomReport extends Component
{
    public $shift, $date;
    public function render()
    {
        return view('livewire.back-office.reports.unccupied-room-report', [
            'unoccupied_rooms' => UnoccupiedRoomReport::where(
                'branch_id',
                auth()->user()->branch_id
            )
                ->when($this->shift, function ($query) {
                    $query->where('shift', $this->shift);
                })
                ->when($this->date, function ($query) {
                    $query->whereDate('created_at', $this->date);
                })
                ->get(),
        ]);
    }
}
