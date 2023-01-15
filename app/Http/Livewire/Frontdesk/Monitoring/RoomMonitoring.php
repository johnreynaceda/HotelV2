<?php

namespace App\Http\Livewire\Frontdesk\Monitoring;

use Livewire\Component;
use App\Models\Floor;
use App\Models\Room;
use App\Models\TemporaryCheckInKiosk;

class RoomMonitoring extends Component
{
    public $search;
    public $filter_floor, $filter_status;
    public function mount()
    {
        $this->floors = Floor::where('branch_id', auth()->user()->branch_id)
            ->orderBy('number', 'asc')
            ->get();
    }

    public function render()
    {
        return view('livewire.frontdesk.monitoring.room-monitoring', [
            'rooms' => $this->searchRooms(),
            'kiosks' => TemporaryCheckInKiosk::orderBy(
                'created_at',
                'desc'
            )->get(),
        ]);
    }

    public function searchRooms()
    {
        return Room::where('branch_id', auth()->user()->branch_id)
            ->when($this->filter_status, function ($query) {
                return $query->where('status', $this->filter_status);
            })
            ->when($this->filter_floor, function ($query) {
                return $query->where('floor_id', $this->filter_floor);
            })
            ->when($this->search, function ($query) {
                return $query->where(
                    'number',
                    'like',
                    '%' . $this->search . '%'
                );
            })
            ->with('floor')
            ->orderBy('number', 'asc')
            ->paginate(15);
    }
}
