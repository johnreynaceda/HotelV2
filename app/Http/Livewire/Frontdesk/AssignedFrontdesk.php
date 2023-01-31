<?php

namespace App\Http\Livewire\Frontdesk;

use Livewire\Component;
use App\Models\Frontdesk;
use App\Models\AssignedFrontdesk as assignFrontdeskModel;

class AssignedFrontdesk extends Component
{
    public function render()
    {
        return view('livewire.frontdesk.assigned-frontdesk', [
            'frontdesks' => Frontdesk::where(
                'branch_id',
                auth()->user()->branch_id
            )->get(),
        ]);
    }

    public function assignFrontdesk($frontdesk_id)
    {
        assignFrontdeskModel::create([
            'branch_id' => auth()->user()->branch_id,
            'user_id' => auth()->user()->id,
            'frontdesk_id' => $frontdesk_id,
        ]);
    }
}
