<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\User;
use App\Models\Floor;
use WireUi\Traits\Actions;
use Filament\Tables;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Actions\Action;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Tables\Columns\BadgeColumn;

class RoomboyDesignation extends Component implements Tables\Contracts\HasTable
{
    use Tables\Concerns\InteractsWithTable;
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

    protected function getTableQuery(): Builder
    {
        return User::query()->whereHas('roles', function ($q) {
            $q->where('name', 'roomboy');
        });
    }

    protected function getTableColumns(): array
    {
        return [
            Tables\Columns\TextColumn::make('name')
                ->label('FRONTDESK NAME')
                ->searchable()
                ->sortable(),
            Tables\Columns\TextColumn::make('status')
                ->label('NUMBER')
                ->searchable()
                ->sortable(),
        ];
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
