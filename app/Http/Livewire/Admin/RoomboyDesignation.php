<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\User;
use App\Models\Floor;
use WireUi\Traits\Actions;

class RoomboyDesignation extends Component
{
    use Actions;
    public $assign_modal = false;
    public $roomboy_id;
    public $floor;
    public function render()
    {
        return view('livewire.admin.roomboy-designation', [
            'roomboys' => User::whereHas('roles', function ($q) {
                $q->where('name', 'roomboy');
            })->get(),
            'floors' => Floor::where(
                'branch_id',
                auth()->user()->branch_id
            )->get(),
        ]);
    }

    public function manageDesignation($roomboy_id)
    {
        $this->assign_modal = true;
        $this->roomboy_id = $roomboy_id;
    }

    public function saveDesignation()
    {
        $this->Validate([
            'floor' => 'required',
        ]);

        $roomboy = User::where('id', $this->roomboy_id)->first();
        $roomboy->update([
            'roomboy_assigned_floor_id' => $this->floor,
        ]);

        $this->dialog()->success(
            $title = 'Success',
            $description = 'Roomboy Designation Updated Successfully'
        );
        $this->assign_modal = false;
    }
}
