<?php

namespace App\Http\Livewire\Frontdesk\Monitoring;

use Livewire\Component;
use App\Models\Guest;

class ManageGuestTransaction extends Component
{
    public $id;
    public $guest;
    public function mount($guest_id)
    {
        
    }

    public function render()
    {
        return view('livewire.frontdesk.monitoring.manage-guest-transaction'); 
    }
}
