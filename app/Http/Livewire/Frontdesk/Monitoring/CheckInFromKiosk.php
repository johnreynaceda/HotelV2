<?php

namespace App\Http\Livewire\Frontdesk\Monitoring;

use App\Models\TemporaryCheckInKiosk;
use Livewire\Component;

class CheckInFromKiosk extends Component
{

    public $record;
    public function mount($record)
    {
        $this->record = TemporaryCheckInKiosk::findOrFail($record);
    }
    public function render()
    {
        return view('livewire.frontdesk.monitoring.check-in-from-kiosk');
    }
}
