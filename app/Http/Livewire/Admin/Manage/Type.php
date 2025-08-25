<?php

namespace App\Http\Livewire\Admin\Manage;

use Livewire\Component;
use App\Models\Type as typeModel;
use WireUi\Traits\Actions;
use Livewire\WithPagination;
use Filament\Tables;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Actions\Action;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Filters\Layout;

class Type extends Component implements Tables\Contracts\HasTable
{
    // use WithPagination;
    use Tables\Concerns\InteractsWithTable;
    use Actions;
    public $add_modal = false;
    public $edit_modal = false;
    public $name;
    public $type_id;
    public $branch_id;
    public function render()
    {
        return view(
            'livewire.admin.manage.type', 
            [
                'branches' => \App\Models\Branch::all(),
            ]
            // , [
            //     'types' => typeModel::where('branch_id', auth()->user()->branch_id)
            //         ->where('name', 'like', '%' . $this->search . '%')
            //         ->paginate(10),
            // ]
        );
    }

    protected function getTableQuery(): Builder
    {
        if(auth()->user()->hasRole('superadmin')){
            return typeModel::query();
        }else{
            return typeModel::query()->where(
                'branch_id',
                auth()->user()->branch_id
            );
        }
    }

    protected function getTableColumns(): array
    {
        return [
             Tables\Columns\TextColumn::make('branch.name')
                 ->label('BRANCH')
                 ->formatStateUsing(
                     fn(string $state): string => strtoupper("{$state}")
                 )
                 ->sortable()
                 ->visible(fn () => auth()->user()->hasRole('superadmin')),
            Tables\Columns\TextColumn::make('name')
                ->label('NAME')
                ->formatStateUsing(
                    fn(string $state): string => strtoupper("{$state}")
                ) 
                ->searchable('search name')
                ->sortable(),
            Tables\Columns\TextColumn::make('name')
                ->label('NAME')
                ->formatStateUsing(
                    fn(string $state): string => strtoupper("{$state}")
                ) 
                ->searchable('search name')
                ->sortable(),
        ];
    }

    protected function getTableActions(): array
    {
        return [
            Tables\Actions\EditAction::make('type.edit')
                ->icon('heroicon-o-pencil-alt')
                ->color('success')
                ->action(function ($record, $data) {
                    $record->update($data);
                    $this->dialog()->success(
                        $title = 'Type Updated',
                        $description = 'Type was successfully updated'
                    );
                })
                ->form(function ($record) {
                    return [
                        Grid::make(1)->schema([
                            TextInput::make('name')
                                ->default($record->name)
                                ->rules(['required']),
                        ]),
                    ];
                })
                ->modalHeading('Update Type')
                ->modalWidth('lg'),
                Tables\Actions\DeleteAction::make('delete')
                ->requiresConfirmation()
                ->visible(fn ($record) => $record->rooms->count() === 0)
        ];
    }

    protected function getTableFilters(): array
    {
        if(auth()->user()->hasRole('superadmin')){
            return [
                SelectFilter::make('branch')->relationship('branch', 'name')
            ];
        }else{
            return [];
        }
    }

    protected function getTableFiltersLayout(): ?string
    {
        return Layout::AboveContent;
    }

    public function saveType()
    {
        $this->validate([
            'name' => 'required|unique:types,name',
        ]);

        typeModel::create([
            'branch_id' => auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id,
            'name' => $this->name . ' size bed',
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
