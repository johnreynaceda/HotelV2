<?php

namespace App\Http\Livewire\Admin\Manage;

use Livewire\Component;
use App\Models\Room as roomModel;
use App\Models\Type;
use App\Models\Floor;
use WireUi\Traits\Actions;
use Livewire\WithPagination;

class Room extends Component
{
    use Actions;
    use WithPagination;
    public $add_modal = false;
    public $edit_modal = false;
    public $types;
    public $number, $floor, $type, $status, $room_id;
    public $floors;
    public $filter_status, $filter_floor;
    public $search;

    public function mount()
    {
        $this->types = Type::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();

        $this->floors = Floor::where('branch_id', auth()->user()->branch_id)
            ->orderBy('number', 'asc')
            ->get();
    }

    public function render()
    {
        return view('livewire.admin.manage.room', [
            'rooms' => roomModel::where('branch_id', auth()->user()->branch_id)
                ->with('type', 'floor')
                ->when($this->filter_status, function ($query) {
                    return $query->where('status', $this->filter_status);
                })
                ->when($this->filter_floor, function ($query) {
                    return $query->where('floor_id', $this->filter_floor);
                })
                ->orderBy('number', 'asc')
                ->paginate(10),
        ]);
    }

    public function clearFilter()
    {
        $this->filter_status = null;
        $this->filter_floor = null;
    }

    public function saveRoom()
    {
        $this->validate([
            'number' => 'required|integer|regex:/^\d+$/|unique:rooms,number',
            'type' => 'required',
            'floor' => 'required',
            'status' => 'required',
        ]);

        roomModel::create([
            'branch_id' => auth()->user()->branch_id,
            'number' => $this->number,
            'type_id' => $this->type,
            'floor_id' => $this->floor,
            'status' => $this->status,
        ]);

        $this->dialog()->success(
            $title = 'Room saved',
            $description = 'The room has been saved successfully.'
        );

        $this->add_modal = false;
        $this->reset(['number', 'type', 'floor', 'status']);
    }

    public function editRoom($room_id)
    {
        $room = roomModel::where('id', $room_id)->first();
        $this->room_id = $room->id;
        $this->number = $room->number;
        $this->type = $room->type_id;
        $this->floor = $room->floor_id;
        $this->status = $room->status;
        $this->edit_modal = true;
    }

    public function updateRoom()
    {
        $this->validate([
            'number' =>
                'required|integer|regex:/^\d+$/|unique:rooms,number,' .
                $this->room_id,
            'type' =>
                'required|exists:types,id,branch_id,' .
                auth()->user()->branch_id,
            'floor' =>
                'required|exists:floors,id,branch_id,' .
                auth()->user()->branch_id,
        ]);

        $room = roomModel::where('id', $this->room_id)->first();
        $room->update([
            'number' => $this->number,
            'type_id' => $this->type,
            'floor_id' => $this->floor,
            'status' => $this->status,
        ]);

        $this->dialog()->success(
            $title = 'Room Updated',
            $description = 'The room has been updated successfully.'
        );
        $this->reset(['number', 'type', 'floor', 'status', 'room_id']);

        $this->edit_modal = false;
    }
}
