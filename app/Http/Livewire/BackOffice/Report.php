<?php

namespace App\Http\Livewire\BackOffice;

use Livewire\Component;

class Report extends Component
{
    public $type;
    public function render()
    {
        return view('livewire.back-office.report');
    }
}
