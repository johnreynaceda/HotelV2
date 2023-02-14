<?php

namespace App\Http\Livewire\Frontdesk;

use Livewire\Component;
use App\Models\Room;
use App\Models\Type;
use Livewire\WithPagination;
use WireUi\Traits\Actions;

class PriorityRoom extends Component
{
    use Actions;
    use WithPagination;
    public $search;
    public $filter = 1;

    public function render()
    {
        return view('livewire.frontdesk.priority-room', [
            'types' => Type::where(
                'branch_id',
                auth()->user()->branch_id
            )->get(),

            'available_rooms' => Room::whereIn('status', [
                'Available',
                'Cleaned ',
            ])
                ->where('is_priority', false)
                ->orderBy('number', 'asc')
                ->when($this->search, function ($query) {
                    $query->where('number', $this->search);
                })
                ->when($this->filter, function ($query) {
                    $query->where('type_id', $this->filter);
                })
                ->with('floor')
                ->paginate(12),
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
