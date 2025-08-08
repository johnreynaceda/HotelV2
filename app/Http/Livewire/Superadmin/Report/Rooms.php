<?php

namespace App\Http\Livewire\Superadmin\Report;

use App\Models\User;
use App\Models\Branch;
use Livewire\Component;
use App\Models\RoomBoyReport;

class Rooms extends Component
{
    public $branch_id = '';
    public $roomboys;

    public $roomboy_id, $shift, $date;
    public $total_cleaned;

    public function mount()
    {
        if ($this->branch_id) {
            $this->roomboys = User::where('branch_id', $this->branch_id)
            ->whereHas('roles', function ($query) {
                $query->where('name', 'roomboy');
            })->get();
        } else {
            $this->roomboys = User::whereHas('roles', function ($query) {
            $query->where('name', 'roomboy');
            })->get();
        }

        $this->total_cleaned = RoomBoyReport::where('is_cleaned', true)
            ->whereHas('room', function ($query) {
                $query->where('branch_id', auth()->user()->branch_id);
            })
            ->count();
    }

    public function render()
    {
        return view('livewire.superadmin.report.rooms', [
            'branches' => Branch::all(),
            'reports' => RoomBoyReport::whereHas('room', function ($query) {
                if ($this->branch_id) {
                    $query->where('branch_id', $this->branch_id);
                }
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
