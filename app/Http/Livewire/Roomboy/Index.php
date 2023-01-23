<?php

namespace App\Http\Livewire\Roomboy;

use Livewire\Component;
use App\Models\Room;

class Index extends Component
{
    public function render()
    {
        return view('livewire.roomboy.index', [
            'assignedRooms' => Room::whereBranchId(auth()->user()->branch_id)
                ->where('status', 'Uncleaned')
                ->whereFloorId(auth()->user()->roomboy_assigned_floor_id)
                ->orderBy('last_checkout_at', 'asc')
                ->get(),

            'unassignedRooms' => Room::whereBranchId(auth()->user()->branch_id)
                ->where('status', 'Uncleaned')
                ->where(
                    'floor_id',
                    '!=',
                    auth()->user()->roomboy_assigned_floor_id
                )
                ->get(),
        ]);
    }
}
