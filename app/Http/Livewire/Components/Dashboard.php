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

    public function mount()
    {
        $this->check_in_today = CheckinDetail::whereDate('check_in_at', Carbon::today())->count();
        $this->check_out_today = CheckinDetail::where('is_check_out', 1)->whereDate('check_out_at', Carbon::today())->count();
        $this->expected_check_out = CheckinDetail::where('is_check_out', 0)->whereDate('check_out_at', Carbon::today())->count();
        $this->total_check_in = CheckinDetail::where('is_check_out', 0)->count();
        $this->total_check_out = CheckinDetail::where('is_check_out', 1)->count();
        $this->total_available_rooms = Room::where('branch_id', auth()->user()->branch_id)->where('status', 'Available')->count();
        $this->total_cleaning_rooms = Room::where('branch_id', auth()->user()->branch_id)->where('status', 'Cleaning')->count();
    }


    public function render()
    {
        return view('livewire.components.dashboard');
    }
}
