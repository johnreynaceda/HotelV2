<?php

namespace App\Http\Livewire\BackOffice\Reports;

use Livewire\Component;
use App\Models\RoomBoyReport as reportModel;
use App\Models\User;

class RoomBoyReport extends Component
{
    public $roomboys;

    public $roomboy_id, $shift, $date;
    public $total_cleaned;

    public function mount()
    {
        $this->roomboys = User::whereHas('roles', function ($query) {
            $query->where('name', 'roomboy');
        })->get();

        $this->total_cleaned = reportModel::where('is_cleaned', true)
            ->whereHas('room', function ($query) {
                $query->where('branch_id', auth()->user()->branch_id);
            })
            ->count();
    }
    public function render()
    {
        return view('livewire.back-office.reports.room-boy-report', [
            'reports' => reportModel::whereHas('room', function ($query) {
                $query->where('branch_id', auth()->user()->branch_id);
            })
                ->when($this->roomboy_id, function ($query) {
                    $query->where('roomboy_id', $this->roomboy_id);
                })
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
