<?php

namespace App\Http\Livewire\Components;

use Carbon\Carbon;
use Livewire\Component;
use App\Models\CheckinDetail;
use App\Models\Guest;

class Chart extends Component
{
    public $date_from;
    public $date_to;
    public $check_in_today;
    public $check_out_today;
    public $expected_check_out;
    public $total_check_in;
    public $total_check_out;

    public $total_guests;
    public $guests_by_month = [];

    public $chartFilter = 'year'; // default

    public function mount()
    {
        $this->check_in_today = CheckinDetail::whereDate('check_in_at', Carbon::today())->count();
        $this->check_out_today = CheckinDetail::where('is_check_out', 1)->whereDate('check_out_at', Carbon::today())->count();
        $this->expected_check_out = CheckinDetail::where('is_check_out', 0)->whereDate('check_out_at', Carbon::today())->count();
        $this->total_check_in = CheckinDetail::where('is_check_out', 0)->count();
        $this->total_check_out = CheckinDetail::where('is_check_out', 1)->count();

        $this->generateGuestDataYear();
    }


    public function updatedChartFilter($value)
    {
        switch($value)
        {
            case 'year':
                $this->generateGuestDataYear();
                break;
            case 'month':
                $this->generateGuestDataMonth();
                break;
            case 'week':
                $this->generateGuestDataWeek();
                break;
            default:
                $this->generateGuestDataYear();
                break;
        }

          $this->emit('chartUpdated', array_keys($this->guests_by_month), array_values($this->guests_by_month));
    }

    public function generateGuestDataYear()
    {

        $now = Carbon::now();
        $guests = Guest::whereHas('checkInDetail')
            ->selectRaw('MONTH(created_at) as month, COUNT(*) as total')
            ->whereYear('created_at', $now->year)
            ->groupBy('month')
            ->pluck('total', 'month')
            ->toArray();

            $this->guests_by_month = [];
            for ($m = 1; $m <= 12; $m++) {
                $monthName = Carbon::create()->month($m)->format('M');
                $this->guests_by_month[$monthName] = $guests[$m] ?? 0;
            }

    }

    public function generateGuestDataMonth()
    {
        $now = Carbon::now();
        $guests = Guest::whereHas('checkInDetail')
            ->selectRaw('DAY(created_at) as day, COUNT(*) as total')
            ->whereYear('created_at', $now->year)
            ->whereMonth('created_at', $now->month)
            ->groupBy('day')
            ->pluck('total', 'day')
            ->toArray();

        $daysInMonth = $now->daysInMonth;
        $this->guests_by_month = [];

        for ($d = 1; $d <= $daysInMonth; $d++) {
            $this->guests_by_month[$d] = $guests[$d] ?? 0;
        }
    }

    public function generateGuestDataWeek()
    {
        $now = Carbon::now();
        $startOfWeek = $now->copy()->startOfWeek();
        $endOfWeek = $now->copy()->endOfWeek();

        $guests = Guest::whereHas('checkInDetail')
            ->selectRaw('DAYNAME(created_at) as day, COUNT(*) as total')
            ->whereBetween('created_at', [$startOfWeek, $endOfWeek])
            ->groupBy('day')
            ->pluck('total', 'day')
            ->toArray();

        $weekDays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

        $this->guests_by_month = [];
        foreach ($weekDays as $day) {
            $this->guests_by_month[$day] = $guests[$day] ?? 0;
        }
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
