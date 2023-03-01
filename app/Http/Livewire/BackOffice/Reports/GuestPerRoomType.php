<?php

namespace App\Http\Livewire\BackOffice\Reports;

use Livewire\Component;
use App\Models\CheckOutGuestReport;
use App\Models\Room;
use App\Models\Type;
use App\Models\Frontdesk;

class GuestPerRoomType extends Component
{
    public $only = [];
    public $frontdesks;
    public $room_types;
    public $frontdesk_id, $room_type_id, $shift, $date, $time;
    public $total_guest;

    public function mount()
    {
        $this->total_guest = CheckOutGuestReport::whereHas('room', function ($query) {
            $query->where('branch_id', auth()->user()->branch_id);
        })->count();
        $this->only = CheckOutGuestReport::pluck('room_id')->toArray();
        $this->frontdesks = Frontdesk::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();
        $this->room_types = Type::where('branch_id', auth()->user()->branch_id)->get();
    }

    public function render()
    {
        return view('livewire.back-office.reports.guest-per-room-type', [
            'rooms' => Room::whereIn('id', $this->only)
                ->where('branch_id', auth()->user()->branch_id)
                ->with('checkOutGuestReports')
                ->when($this->room_type_id, function ($query) {
                    $query->whereHas('type', function ($query) {
                        $query->where('type_id', $this->room_type_id);
                    });
                })
                ->when($this->frontdesk_id, function ($query) {
                    $query->whereHas('checkOutGuestReports', function ($query) {
                        $query->where('frontdesk_id', $this->frontdesk_id);
                    });
                })
                ->when($this->shift, function ($query) {
                    $query->whereHas('checkOutGuestReports', function ($query) {
                        $query->where('shift', $this->shift);
                    });
                })
                ->when($this->date, function ($query) {
                    $query->whereHas('checkOutGuestReports', function ($query) {
                        $query->whereDate('created_at', $this->date);
                    });
                })
                ->when($this->time, function ($query) {
                    $query->whereHas('checkOutGuestReports', function ($query) {
                        $query
                            ->whereTime('created_at', '>=', '08:00:00')
                            ->whereTime('created_at', '<=', $this->time);
                    });
                })
                ->orderBy('number', 'asc')
                ->get(),
        ]);
    }
}
