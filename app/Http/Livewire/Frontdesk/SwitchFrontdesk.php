<?php

namespace App\Http\Livewire\Frontdesk;

use Livewire\Component;
use App\Models\Floor;

class SwitchFrontdesk extends Component
{
    public $switch_modal = false;
    public function render()
    {
        return view('livewire.frontdesk.switch-frontdesk', [
            'floors' => Floor::where(
                'branch_id',
                auth()->user()->branch_id
            )->get(),
        ]);
    }
}