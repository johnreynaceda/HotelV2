<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;

class Settings extends Component
{
    public $code_modal = false;
    public function render()
    {
        return view('livewire.admin.settings');
    }
}
