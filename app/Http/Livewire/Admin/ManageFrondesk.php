<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\Frontdesk;
use WireUi\Traits\Actions;

class ManageFrondesk extends Component
{
    use Actions;
    public $add_modal = false;
    public $edit_modal = false;
    public $name, $number, $frontdesk_id;
    public $search;
    public function render()
    {
        return view('livewire.admin.manage-frondesk', [
            'frontdesks' => Frontdesk::where(
                'branch_id',
                auth()->user()->branch_id
            )->get(),
        ]);
    }

    public function addFrontdesk()
    {
        $this->validate([
            'name' => 'required',
            'number' => 'required',
        ]);
        Frontdesk::create([
            'branch_id' => auth()->user()->branch_id,
            'name' => $this->name,
            'number' => $this->number,
        ]);
        $this->add_modal = false;
        $this->name = '';
        $this->number = '';

        $this->dialog()->success(
            $title = 'Success',
            $description = 'Frontdesk added successfully'
        );
    }

    public function editFrontdesk($id)
    {
        $frontdesk = Frontdesk::where('id', $id)->first();
        $this->frontdesk_id = $frontdesk->id;
        $this->name = $frontdesk->name;
        $this->number = $frontdesk->number;

        $this->edit_modal = true;
    }

    public function updateFrontdesk()
    {
        $this->validate([
            'name' => 'required',
            'number' => 'required',
        ]);
        Frontdesk::where('id', $this->frontdesk_id)
            ->first()
            ->update([
                'name' => $this->name,
                'number' => $this->number,
            ]);
        $this->edit_modal = false;
        $this->name = '';
        $this->number = '';

        $this->dialog()->success(
            $title = 'Success',
            $description = 'Frontdesk updated successfully'
        );
    }
}
