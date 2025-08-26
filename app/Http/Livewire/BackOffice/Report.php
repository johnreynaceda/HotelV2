<?php

namespace App\Http\Livewire\BackOffice;

use Livewire\Component;

class Report extends Component
{
    public $report_type;
    public $report_modal = false;
    public function render()
    {
        return view('livewire.back-office.report');
    }

    public function redirectSalesReport()
    {
        return redirect()->route('back-office.sales-report');
    }

    public function openReport($id)
    {
        $this->report_type = $id;
        $this->report_modal = true;
    }
}
