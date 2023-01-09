<?php

namespace App\Http\Livewire\Admin\Manage;

use Livewire\Component;
use App\Models\Type as typeModel;
use WireUi\Traits\Actions;
use Livewire\WithPagination;

class Type extends Component
{
    use WithPagination;
    use Actions;
    public $add_modal = false;
    public $edit_modal = false;
    public $name;
    public $search;
    public $type_id;
    public function render()
    {
        return view('livewire.admin.manage.type', [
            'types' => typeModel::where('branch_id', auth()->user()->branch_id)
                ->where('name', 'like', '%' . $this->search . '%')
                ->paginate(10),
        ]);
    }

    public function saveType()
    {
        $this->validate([
            'name' => 'required',
        ]);

        typeModel::create([
            'branch_id' => auth()->user()->branch_id,
            'name' => $this->name,
        ]);
        $this->reset(['name']);
        $this->dialog()->success(
            $title = 'Type Saved',
            $description = 'Type was successfully saved'
        );
        $this->add_modal = false;
    }

    public function editType($id)
    {
        $type = typeModel::where('id', $id)->first();
        $this->type_id = $type->id;
        $this->name = $type->name;
        $this->edit_modal = true;
    }

    public function updateType()
    {
        $this->validate([
            'name' => 'required',
        ]);
        typeModel::where('id', $this->type_id)->update([
            'name' => $this->name,
        ]);
        $this->reset(['name']);
        $this->dialog()->success(
            $title = 'Type Updated',
            $description = 'Type was successfully updated'
        );
        $this->edit_modal = false;
    }
}
