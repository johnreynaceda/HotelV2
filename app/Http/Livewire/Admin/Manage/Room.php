<?php

namespace App\Http\Livewire\Admin\Manage;

use Livewire\Component;
use App\Models\Room as roomModel;
use App\Models\Type;
use App\Models\Floor;

class Room extends Component
{
    public $add_modal = false;
    public $types;
    public $floors;

    public function mount()
    {
        $this->types = Type::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();

        $this->floors = Floor::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();
    }

    public function render()
    {
        return view('livewire.admin.manage.room');
    }
}
