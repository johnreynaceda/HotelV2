<?php

namespace App\Http\Livewire\Frontdesk\Food;

use Livewire\Component;
use App\Models\FrontdeskCategory;
use WireUi\Traits\Actions;
use Filament\Tables;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\TextInput;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Filters\Layout;


class Category extends Component implements Tables\Contracts\HasTable
{
    use Tables\Concerns\InteractsWithTable;
    use Actions;
    public $name;
    public $category_id;
    public $add_modal = false;
    public $edit_modal = false;
    public $branch_id;

    protected function getTableQuery(): Builder
    {
        if(auth()->user()->hasRole('superadmin'))
        {
            return FrontdeskCategory::query();
        }else{
            return FrontdeskCategory::query()->where(
                'branch_id',
                auth()->user()->branch_id
            );
        }
    }

    protected function getTableColumns(): array
    {
        return [
            TextColumn::make('branch.name')
                ->label('BRANCH')
                ->formatStateUsing(
                    fn(string $state): string => strtoupper("{$state}")
                )
                ->sortable()
                ->visible(fn () => auth()->user()->hasRole('superadmin')),
            TextColumn::make('name')
                ->label('CATEGORY NAME')
                ->searchable()
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
                        $title = 'Category Updated',
                        $description = 'Category was successfully updated'
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
                ->modalHeading('Update Category')
                ->modalWidth('lg'),
            Tables\Actions\DeleteAction::make('user.destroy'),
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

    public function saveCategory()
    {
        $this->validate([
            'name' => 'required',
        ]);

        FrontdeskCategory::create([
            'name' => $this->name,
            'branch_id' => auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id,
        ]);
        $this->name = '';
        $this->add_modal = false;
        $this->dialog()->success(
            $title = 'Success',
            $description = 'Category Added Successfully'
        );
    }

    public function render()
    {
        return view('livewire.frontdesk.food.category',
        [
            'branches' => \App\Models\Branch::all(),
        ]
);
    }
}
