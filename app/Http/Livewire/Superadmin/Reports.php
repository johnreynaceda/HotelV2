<?php

namespace App\Http\Livewire\Superadmin;

use Livewire\Component;

class Reports extends Component
{
    public function render()
    {
        return view('livewire.superadmin.reports');
    }

    public function openReport($type)
    {
        switch ($type) {
            case '1':
                return redirect()->route('superadmin.report.rooms');
                break;
            case '2':
                return redirect()->route('superadmin.report.expenses');
                break;
            case '3':
                return redirect()->route('superadmin.report.sales');
                break;
        }
    }
}
