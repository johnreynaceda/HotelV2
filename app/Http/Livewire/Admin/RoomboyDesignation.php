<?php

namespace App\Http\Livewire\Admin;

use App\Models\ActivityLog;
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
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Filters\Layout;

class RoomboyDesignation extends Component implements Tables\Contracts\HasTable
{
    use Tables\Concerns\InteractsWithTable;
    use Actions;
    public $assign_modal = false;
    public $roomboy_id;
    public $floor;
    public $branch_id;

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
            'branches' => \App\Models\Branch::all(),
        ]);
    }

    protected function getTableQuery(): Builder
    {
        if(auth()->user()->hasRole('superadmin'))
        {
            return User::query()->whereHas('roles', function ($q) {
            $q->where('name', 'roomboy');
        });
        }else{
            return User::query()->where(
                'branch_id',
                auth()->user()->branch_id
            )->whereHas('roles', function ($q) {
                $q->where('name', 'roomboy');
            });
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
                ->label('ROOMBOY NAME')
                ->searchable()
                ->sortable(),
            Tables\Columns\TextColumn::make('roomboy_cleaning_room_id')
                ->label('STATUS')
                ->formatStateUsing(
                    fn($record) => $record->roomboy_cleaning_room_id == null
                        ? 'Not Cleaning'
                        : 'Cleaning'
                )
                ->sortable(),
            Tables\Columns\TextColumn::make('current_team_id')
                ->label('CLEANING')
                ->formatStateUsing(
                    fn($record) => $record->roomboy_cleaning_room_id == null
                        ? 'Not Cleaning'
                        : 'Currently Cleaning in Room #' .
                            \App\Models\Room::where(
                                'id',
                                $record->roomboy_cleaning_room_id
                            )
                                ->first()
                                ->numberWithFormat()
                )
                ->sortable(),
            Tables\Columns\ViewColumn::make('floors')->view('tables.columns.roomboy-assigned-floors')
                ->label('FLOOR DESIGNATIONS'),
            // Tables\Columns\TextColumn::make('floors')
            //     ->label('FLOOR DESIGNATIONS')
            //     ->formatStateUsing(
            //         function ($record) {
            //             if (!$record->floors || $record->floors->isEmpty()) {
            //                 return 'Not Assigned';
            //             }
            //             return $record->floors
            //                 ->map(function ($floor) {
            //                     return $floor->numberWithFormat();
            //                 })
            //                 ->implode(', ');
            //         }
            //     )
            //     ->sortable(),
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

    protected function getTableActions(): array
    {
        return [
            Action::make('Manage Designation')
                ->icon('heroicon-o-pencil-alt')
                ->button()
                ->action(function ($record, $data) {
                    $record->floors()->sync($data['floors']); // floor IDs
                    $record->update([
                        'roomboy_assigned_floor_id' => $data['floors'][0],
                    ]);

                    ActivityLog::create([
                        'branch_id' => auth()->user()->hasRole('superadmin') ? $record->branch_id : auth()->user()->branch_id,
                        'user_id' => auth()->user()->id,
                        'activity' => 'Update Roomboy Designation',
                        'description' => 'Updated roomboy designation for ' . $record->name,
                    ]);

                    $this->dialog()->success(
                        $title = 'Room Updated',
                        $description = 'The room has been updated successfully.'
                    );
                })
                ->form(function ($record) {
                    return [
                        Grid::make(1)->schema([
                            Select::make('floors')
                                ->multiple()
                                ->default($record->roomboy_assigned_floor_id)
                                ->options(
                                    Floor::where(
                                        'branch_id',
                                        auth()->user()->hasRole('superadmin') ? $record->branch_id : auth()->user()->branch_id
                                    )
                                        ->get()
                                        ->mapWithKeys(function ($floor) {
                                            return [
                                                $floor->id => $floor->numberWithFormat(),
                                            ];
                                        })
                                ),
                        ]),
                    ];
                })
                ->modalHeading('Manage Designation')
                ->modalWidth('lg'),
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

        ActivityLog::create([
            'branch_id' => auth()->user()->hasRole('superadmin') ? $roomboy->branch_id : auth()->user()->branch_id,
            'user_id' => auth()->user()->id,
            'activity' => 'Update Roomboy Designation',
            'description' => 'Updated roomboy designation for ' . $roomboy->name,
        ]);

        $this->dialog()->success(
            $title = 'Success',
            $description = 'Roomboy Designation Updated Successfully'
        );
        $this->assign_modal = false;
    }
}
