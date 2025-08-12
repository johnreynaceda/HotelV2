<?php

namespace App\Http\Livewire\Components;

use Carbon\Carbon;
use App\Models\Room;
use Livewire\Component;
use App\Models\CheckinDetail;

class Dashboard extends Component
{
    public $check_in_today;
    public $check_out_today;
    public $expected_check_out;
    public $total_check_in;
    public $total_check_out;

    public $total_available_rooms;
    public $total_cleaning_rooms;

    public $cardFilter = 'today';
    public $cardLabel = "Daily";

    public function mount()
    {
        $this->check_in_today = CheckinDetail::whereDate('check_in_at', Carbon::today())->count();
        $this->check_out_today = CheckinDetail::where('is_check_out', 1)->whereDate('check_out_at', Carbon::today())->count();
        $this->expected_check_out = CheckinDetail::where('is_check_out', 0)->whereDate('check_out_at', Carbon::today())->count();
        $date = Carbon::today();
        $queryCheckin = CheckinDetail::query();
        $queryCheckout = CheckinDetail::query();

        switch ($this->cardFilter) {
            case 'week':
            $start = Carbon::now()->startOfWeek();
            $end = Carbon::now()->endOfWeek();
            $this->cardLabel = "Weekly";
            break;
            case 'month':
            $start = Carbon::now()->startOfMonth();
            $end = Carbon::now()->endOfMonth();
            $this->cardLabel = "Monthly";
            break;
            case 'year':
            $start = Carbon::now()->startOfYear();
            $end = Carbon::now()->endOfYear();
            $this->cardLabel = "Yearly";
            break;
            case 'overall':
            $start = null;
            $end = null;
            $this->cardLabel = "Overall";
            break;
            default: // today
            $start = $date;
            $end = $date;
            $this->cardLabel = "Daily";
            break;
        }

        if ($start && $end) {
            $queryCheckin->whereBetween('check_in_at', [$start, $end]);
            $queryCheckout->whereBetween('check_out_at', [$start, $end]);
        }

        $this->total_check_in = $queryCheckin->where('is_check_out', 0)->count();
        $this->total_check_out = $queryCheckout->where('is_check_out', 1)->count();

        $roomQuery = Room::where('branch_id', auth()->user()->branch_id);
        if ($start && $end) {
            $roomQueryAvailable = (clone $roomQuery)->where('status', 'Available')->whereBetween('updated_at', [$start, $end]);
            $roomQueryCleaning = (clone $roomQuery)->where('status', 'Cleaning')->whereBetween('updated_at', [$start, $end]);
        } else {
            $roomQueryAvailable = (clone $roomQuery)->where('status', 'Available');
            $roomQueryCleaning = (clone $roomQuery)->where('status', 'Cleaning');
        }
  
        $this->total_available_rooms = $roomQueryAvailable->count();
        $this->total_cleaning_rooms = $roomQueryCleaning->count();
    }

    public function updatedCardFilter()
    {
        $this->mount();
    }


    public function render()
    {
        return view('livewire.components.dashboard');
    }
}
