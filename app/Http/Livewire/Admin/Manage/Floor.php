<?php

namespace App\Http\Livewire\Admin\Manage;

use Livewire\Component;
use App\Models\Floor as floorModel;
use WireUi\Traits\Actions;
use Filament\Tables;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Actions\Action;
use Filament\Forms\Components\Grid;
// use Filament\Tables\Columns\Layout\Grid;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;

class Floor extends Component implements Tables\Contracts\HasTable
{
    use Tables\Concerns\InteractsWithTable;
    use Actions;
    public $add_modal = false;
    public $edit_modal = false;
    public $number, $floor_id;
    public $search;
    public function render()
    {
        return view('livewire.admin.manage.floor', [
            'floors' => floorModel::where(
                'branch_id',
                auth()->user()->branch_id
            )
                ->where('number', 'like', '%' . $this->search . '%')
                ->orderBy('number', 'asc')
                ->get(),
        ]);
    }

    protected function getTableColumns(): array
    {
        return [
            Tables\Columns\TextColumn::make('number')
                ->formatStateUsing(function (string $state) {
                    $ends = [
                        'th',
                        'st',
                        'nd',
                        'rd',
                        'th',
                        'th',
                        'th',
                        'th',
                        'th',
                        'th',
                    ];
                    if ($state % 100 >= 11 && $state % 100 <= 13) {
                        return $state . 'th' . ' Floor';
                    } else {
                        return $state . $ends[$state % 10] . ' Floor';
                    }
                })
                ->label('NUMBER')
                ->searchable()
                ->sortable(),
        ];
    }

    protected function getTableActions(): array
    {
        return [
            Tables\Actions\EditAction::make('floor.edit')
                ->icon('heroicon-o-pencil-alt')
                ->color('success')
                ->action(function ($record, $data) {
                    $record->update($data);
                    $this->dialog()->success(
                        $title = 'Floor Updated',
                        $description = 'The room has been updated successfully.'
                    );
                })
                ->form(function ($record) {
                    return [
                        Grid::make(1)->schema([
                            TextInput::make('number')
                                ->default($record->number)
                                ->rules(
                                    'required|integer|regex:/^\d+$/' .
                                        $record->id
                                ),
                        ]),
                    ];
                })
                ->modalHeading('Update Floor')
                ->modalWidth('xl'),
        ];
    }

    protected function getTableQuery(): Builder
    {
        return floorModel::query()
            ->where('branch_id', auth()->user()->branch_id)
            ->orderBy('number', 'asc');
    }

    public function saveFloor()
    {
        $this->validate([
            'number' => 'required|integer|regex:/^\d+$/',
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
                'required|integer|regex:/^\d+$/' .
                $this->floor_id,
        ]);

        floorModel::where('id', $this->floor_id)
            ->first()
            ->update([
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
