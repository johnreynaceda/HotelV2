<?php

namespace App\Http\Livewire\Admin\Manage;

use Livewire\Component;
use App\Models\Floor as floorModel;
use WireUi\Traits\Actions;
class Floor extends Component
{
    use Actions;
    public $add_modal = false;
    public $edit_modal = false;
    public $number, $floor_id;
    public function render()
    {
        return view('livewire.admin.manage.floor', [
            'floors' => floorModel::where(
                'branch_id',
                auth()->user()->id
            )->orderBy('number', 'asc')->get(),
        ]);
    }

    public function saveFloor()
    {
        $this->validate([
            'number' => 'required|integer|regex:/^\d+$/|unique:floors,number',
        ]);
        floorModel::create([
            'branch_id' => auth()->user()->branch_id,
            'number' => $this->number,
        ]);
        $this->dialog()->success(
            $title = 'Floor saved',
            $description = 'The floor has been saved successfully.'
        );

        $this->add_modal = false;
        $this->reset(['number']);
    }

    public function editFloor($floor_id)
    {
        $floor = floorModel::where('id', $floor_id)->first();
        $this->floor_id = $floor_id;
        $this->number = $floor->number;
        $this->edit_modal = true;
    }

    public function updateFloor()
    {
        $this->validate([
            'number' =>
                'required|integer|regex:/^\d+$/|unique:floors,number,' .
                $this->floor_id,
        ]);
        
        floorModel::where('id', $this->floor_id)->first()->update([
            'number' => $this->number,
        ]);

        $this->dialog()->success(
            $title = 'Floor updated',
            $description = 'The floor has been updated successfully.'
        );

        $this->edit_modal = false;
        $this->reset(['number']);
    }
}
