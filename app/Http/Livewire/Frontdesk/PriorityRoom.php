<?php

namespace App\Http\Livewire\Frontdesk;

use Livewire\Component;
use App\Models\Room;
use Livewire\WithPagination;
use WireUi\Traits\Actions;

class PriorityRoom extends Component
{
    use Actions;
    use WithPagination;
    public $search;

    public function render()
    {
        return view('livewire.frontdesk.priority-room', [
            'available_rooms' => Room::whereIn('status', [
                'Available',
                'Cleaned ',
            ])
                ->where('is_priority', false)
                ->orderBy('number', 'asc')
                ->when($this->search, function ($query) {
                    $query->where('number', $this->search);
                })
                ->with('floor')
                ->paginate(12),

            'priority_rooms' => Room::where('is_priority', true)
                ->orderBy('number', 'asc')
                ->with('floor')
                ->paginate(10),
        ]);
    }

    public function setPriority($room_id)
    {
        $room = Room::where('id', $room_id)->first();

        if ($room->is_priority == false) {
            $room->update([
                'is_priority' => true,
            ]);
            $this->notification()->success(
                $title = 'Priority saved',
                $description =
                    'Room ' . $room->number . ' is now a priority room'
            );
        }
    }

    public function removePriority($room_id)
    {
        $room = Room::where('id', $room_id)->first();

        if ($room->is_priority == true) {
            $room->update([
                'is_priority' => false,
            ]);
            $this->notification()->success(
                $title = 'Priority removed',
                $description =
                    'Room ' . $room->number . ' is no longer a priority room'
            );
        }
    }
}
