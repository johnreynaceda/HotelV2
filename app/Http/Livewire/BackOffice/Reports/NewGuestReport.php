<?php

namespace App\Http\Livewire\BackOffice\Reports;

use Livewire\Component;
use App\Models\NewGuestReport as guestReport;
use App\Models\Room;
use App\Models\Frontdesk;

class NewGuestReport extends Component
{
    public $only = [];
    public $frontdesks;
    public $frontdesk_id, $shift, $date, $time;
    public $total_guest;

    public function mount()
    {
        $this->total_guest = guestReport::where(
            'branch_id',
            auth()->user()->branch_id
        )->count();
        $this->only = guestReport::pluck('room_id')->toArray();
        $this->frontdesks = Frontdesk::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();
    }
    public function render()
    {
        return view('livewire.back-office.reports.new-guest-report', [
            'rooms' => Room::whereIn('id', $this->only)
                ->where('branch_id', auth()->user()->branch_id)
                ->with('newGuestReports')
                ->when($this->frontdesk_id, function ($query) {
                    $query->whereHas('newGuestReports', function ($query) {
                        $query->where('frontdesk_id', $this->frontdesk_id);
                    });
                })
                ->when($this->shift, function ($query) {
                    $query->whereHas('newGuestReports', function ($query) {
                        $query->where('shift', $this->shift);
                    });
                })
                ->when($this->date, function ($query) {
                    $query->whereHas('newGuestReports', function ($query) {
                        $query->whereDate('created_at', $this->date);
                    });
                })
                ->when($this->time, function ($query) {
                    $query->whereHas('newGuestReports', function ($query) {
                        $query
                            ->whereTime('created_at', '>=', '08:00:00')
                            ->whereTime('created_at', '<=', $this->time);
                    });
                })
                ->orderBy('number', 'asc')
                ->get(),
        ]);
    }

    // public function updatedTime()
    // {
    //     dd($this->time);
    // }
}
