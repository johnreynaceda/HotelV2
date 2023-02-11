<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\Frontdesk;
use WireUi\Traits\Actions;
use Filament\Tables;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Actions\Action;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Tables\Columns\BadgeColumn;

class ManageFrondesk extends Component implements Tables\Contracts\HasTable
{
    use Tables\Concerns\InteractsWithTable;
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

    protected function getTableQuery(): Builder
    {
        return Frontdesk::query()->where(
            'branch_id',
            auth()->user()->branch_id
        );
    }

    protected function getTableColumns(): array
    {
        return [
            Tables\Columns\TextColumn::make('name')
                ->label('FRONTDESK NAME')
                ->searchable()
                ->sortable(),
            Tables\Columns\TextColumn::make('number')
                ->label('NUMBER')
                ->searchable()
                ->sortable(),
        ];
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
