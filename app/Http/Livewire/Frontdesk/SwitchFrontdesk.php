<?php

namespace App\Http\Livewire\Frontdesk;

use Livewire\Component;
use App\Models\Floor;
use App\Models\Guest;

class SwitchFrontdesk extends Component
{
    public $switch_modal = false;
    public $frontdesks = [];
    public function render()
    {
        return view('livewire.frontdesk.switch-frontdesk', [
            'floors' => Floor::where(
                'branch_id',
                auth()->user()->branch_id
            )->get(),
            'new_guests' =>
                Guest::where('branch_id', auth()->user()->branch_id)
                    ->whereHas('checkInDetail', function ($query) {
                        $query
                            ->where('check_in_at', '!=', null)
                            ->where(
                                'check_in_at',
                                '>=',
                                auth()->user()->time_in
                            );
                    })
                    ->count() ?? 0,
        ]);
    }

    public function updatedSwitchModal()
    {
        $this->frontdesks = json_decode(auth()->user()->assigned_frontdesks);
        $this->emit('switchModalUpdated');
    }
}
