<?php

namespace App\Http\Livewire\Components;

use Carbon\Carbon;
use Livewire\Component;
use App\Models\CheckinDetail;

class Chart extends Component
{
    public $date_from;
    public $date_to;
    public $check_in_today;
    public $check_out_today;
    public $expected_check_out;
    public $total_check_in;
    public $total_check_out;

    public function mount()
    {
        $this->check_in_today = CheckinDetail::whereDate('check_in_at', Carbon::today())->count();
        $this->check_out_today = CheckinDetail::where('is_check_out', 1)->whereDate('check_out_at', Carbon::today())->count();
        $this->expected_check_out = CheckinDetail::where('is_check_out', 0)->whereDate('check_out_at', Carbon::today())->count();
        $this->total_check_in = CheckinDetail::where('is_check_out', 0)->count();
        $this->total_check_out = CheckinDetail::where('is_check_out', 1)->count();
    }

    public function generateChartData()
    {
      $this->check_in_today = CheckinDetail::where('is_check_out', 0)
        ->whereBetween('check_in_at', [$this->date_from, $this->date_to])
        ->count();

      $this->check_out_today = CheckinDetail::where('is_check_out', 1)
        ->whereBetween('check_out_at', [$this->date_from, $this->date_to])
        ->count();

      $this->expected_check_out = CheckinDetail::where('is_check_out', 0)
        ->whereBetween('check_out_at', [$this->date_from, $this->date_to])
        ->count();

      $this->total_check_in = CheckinDetail::where('is_check_out', 0)
        ->whereBetween('check_in_at', [$this->date_from, $this->date_to])
        ->count();

      $this->total_check_out = CheckinDetail::where('is_check_out', 1)
        ->whereBetween('check_out_at', [$this->date_from, $this->date_to])
        ->count();
    }

    public function render()
    {
        return view('livewire.components.chart');
    }
}
