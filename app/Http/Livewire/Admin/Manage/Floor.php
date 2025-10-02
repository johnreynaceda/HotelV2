<?php

namespace App\Http\Livewire\Admin\Manage;

use App\Models\ActivityLog;
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
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Filters\Layout;

class Floor extends Component implements Tables\Contracts\HasTable
{
    use Tables\Concerns\InteractsWithTable;
    use Actions;
    public $add_modal = false;
    public $edit_modal = false;
    public $number, $floor_id;
    public $search;
    public $branch_id;
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
            'branches' => \App\Models\Branch::all(),
        ]);
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
                Tables\Columns\TextColumn::make('number')
                    ->formatStateUsing(function (string $state) {
                        $ends = ['th','st','nd','rd','th','th','th','th','th','th'];

                        if ($state % 100 >= 11 && $state % 100 <= 13) {
                            return $state . 'th Floor';
                        } else {
                            return $state . $ends[$state % 10] . ' Floor';
                        }
                    })
                    ->label('NUMBER')
                    ->sortable()
                    ->searchable(query: function ($query, string $search): void {
                        $query->where(function ($q) use ($search) {
                            // Remove "floor" word from search if user typed it
                            $cleanSearch = strtolower(str_replace('floor', '', $search));
                            $cleanSearch = trim($cleanSearch);

                            // Map ordinals to numbers
                            $map = [
                                '1st' => 1,
                                '2nd' => 2,
                                '3rd' => 3,
                                '4th' => 4,
                                '5th' => 5,
                                '6th' => 6,
                                '7th' => 7,
                                '8th' => 8,
                                '9th' => 9,
                                '10th' => 10,
                            ];

                            // Check if user typed "1st", "2nd", etc.
                            if (array_key_exists($cleanSearch, $map)) {
                                $q->orWhere('number', $map[$cleanSearch]);
                            }

                            // Also allow direct numeric search (already default)
                            if (is_numeric($cleanSearch)) {
                                $q->orWhere('number', $cleanSearch);
                            }
                        });
                    }),
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
                                ->numeric(),
                        ]),
                    ];
                })
                ->modalHeading('Update Floor')
                ->modalWidth('xl'),
        ];
    }

    protected function getTableQuery(): Builder
    {
         if(auth()->user()->hasRole('superadmin')){
            return floorModel::query()->orderBy('branch_id', 'asc')->orderBy('number', 'asc');
         }else{
            return floorModel::query()
                ->where('branch_id', auth()->user()->branch_id)
                ->orderBy('number', 'asc');
         }
    }

    public function saveFloor()
    {
        $this->validate([
            'number' => 'required|integer|regex:/^\d+$/',
        ]);
        floorModel::create([
            'branch_id' => auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id,
            'number' => $this->number,
        ]);

        ActivityLog::create([
            'branch_id' => auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id,
            'user_id' => auth()->user()->id,
            'activity' => 'Create Floor',
            'description' => 'Created floor ' . $this->number,
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

        ActivityLog::create([
            'branch_id' => auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id,
            'user_id' => auth()->user()->id,
            'activity' => 'Update Floor',
            'description' => 'Updated floor ' . $this->number,
        ]);

        $this->dialog()->success(
            $title = 'Floor updated',
            $description = 'The floor has been updated successfully.'
        );

        $this->edit_modal = false;
        $this->reset(['number']);
    }
}
