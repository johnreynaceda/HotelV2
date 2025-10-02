<?php

namespace App\Http\Livewire\Admin\Manage;

use App\Models\ActivityLog;
use Livewire\Component;
use App\Models\RequestableItem;
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

class Amenities extends Component implements Tables\Contracts\HasTable
{
    use Tables\Concerns\InteractsWithTable;
    use Actions;
    public $name, $amount, $request_id;
    public $add_modal = false;
    public $edit_modal = false;
    public $search;
    public $branch_id;

    public function render()
    {
        return view('livewire.admin.manage.amenities', [
            'requestable_items' => RequestableItem::where(
                'branch_id',
                auth()->user()->hasRole('superadmin')
                    ? $this->branch_id
                    : auth()->user()->branch_id
            )->where('name', 'like', '%' . $this->search . '%')->get(),
            'branches' => \App\Models\Branch::all(),
        ]);
    }

    protected function getTableQuery(): Builder
    {
        if(auth()->user()->hasRole('superadmin'))
        {
            return RequestableItem::query();
        }else{
            return RequestableItem::query()->where(
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
                ->searchable()
                ->sortable(),
            Tables\Columns\TextColumn::make('price')
                ->formatStateUsing(function (string $state) {
                    return '₱' . number_format($state, 2) . '';
                })
                ->label('AMOUNT')
                ->searchable()
                ->sortable(),
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
            Tables\Actions\EditAction::make('type.edit')
                ->icon('heroicon-o-pencil-alt')
                ->color('success')
                ->action(function ($record, $data) {
                    $record->update($data);

                    ActivityLog::create([
                        'branch_id' => auth()->user()->hasRole('superadmin') ? $record->branch_id : auth()->user()->branch_id,
                        'user_id' => auth()->user()->id,
                        'activity' => 'Update Extension Rate',
                        'description' => 'Updated extension rate for ' . $record->hour . ' hour',
                    ]);

                    $this->dialog()->success(
                        $title = 'Update Successfully',
                        $description =
                            'Extension rate has been updated successfully'
                    );
                })
                ->form(function ($record) {
                    return [
                        Grid::make(1)->schema([
                            TextInput::make('name')
                                ->default($record->name)
                                ->rules(
                                    'required|unique:requestable_items,name,' .
                                        $record->id
                                ),
                            TextInput::make('price')
                                ->default($record->price)
                                ->rules('required|numeric|regex:/^\d+$/'),
                        ]),
                    ];
                })
                ->modalHeading('Update Extension Rate')
                ->modalWidth('lg'),
            Tables\Actions\DeleteAction::make('user.destroy'),
        ];
    }

    public function saveRequest()
    {
        $this->validate([
            'name' => 'required|unique:requestable_items,name,NULL,id,branch_id,' . (auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id),
            'amount' => 'required|numeric|regex:/^\d+$/',
        ]);

        RequestableItem::create([
            'name' => $this->name,
            'price' => $this->amount,
            'branch_id' => auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id,
        ]);

        ActivityLog::create([
            'branch_id' => auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id,
            'user_id' => auth()->user()->id,
            'activity' => 'Create Requestable Item',
            'description' => 'Created requestable item for ' . $this->name,
        ]);

        $this->dialog()->success(
            $title = 'Requestable Item Saved',
            $description = 'Item has been saved successfully'
        );
        $this->add_modal = false;
        $this->name = null;
        $this->amount = null;
    }

    public function editItem($item_id)
    {
        $item = RequestableItem::where('id', $item_id)->first();
        $this->item_id = $item->id;
        $this->name = $item->name;
        $this->amount = $item->price;
        $this->edit_modal = true;
    }

    public function updateItems()
    {
        $this->validate([
            'name' =>
                'required|unique:requestable_items,name,' . $this->item_id,
            'amount' => 'required|numeric|regex:/^\d+$/',
        ]);

        RequestableItem::where('id', $this->item_id)->update([
            'name' => $this->name,
            'price' => $this->amount,
        ]);

        ActivityLog::create([
            'branch_id' => auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id,
            'user_id' => auth()->user()->id,
            'activity' => 'Update Damage Charges',
            'description' => 'Updated damage charges for ' . $this->name,
        ]);

        $this->dialog()->success(
            $title = 'Item Updated',
            $description = 'item has been updated successfully'
        );
        $this->edit_modal = false;
        $this->name = null;
        $this->amount = null;
    }

    public function deleteItem($item_id)
    {
        $this->dialog()->confirm([
            'title' => 'Are you Sure?',
            'description' => 'delete Damage Charges',
            'icon' => 'question',
            'accept' => [
                'label' => 'Yes, delete it',
                'method' => 'confirmDelete',
                'params' => [$item_id],
            ],
            'reject' => [
                'label' => 'No, cancel',
            ],
        ]);
    }

    public function confirmDelete($item_id)
    {
        RequestableItem::where('id', $item_id)->delete();
        ActivityLog::create([
            'branch_id' => auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id,
            'user_id' => auth()->user()->id,
            'activity' => 'Delete Damage Charges',
            'description' => 'Deleted damage charges ID ' . $item_id,
        ]);

        $this->dialog()->success(
            $title = 'Item Deleted',
            $description = 'item has been deleted successfully'
        );
    }
}
