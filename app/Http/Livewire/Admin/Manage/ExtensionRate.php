<?php

namespace App\Http\Livewire\Admin\Manage;

use Livewire\Component;
use App\Models\ExtensionRate as extensionRateModel;
use WireUi\Traits\Actions;
use Livewire\WithPagination;
use Filament\Tables;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Actions\Action;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;

class ExtensionRate extends Component implements Tables\Contracts\HasTable
{
    use Tables\Concerns\InteractsWithTable;
    use Actions;

    public $add_modal = false;
    public $edit_modal = false;
    public $hour, $amount, $extension_id;
    public $search;
    public function render()
    {
        return view('livewire.admin.manage.extension-rate', [
            'extensionRates' => extensionRateModel::where(
                'branch_id',
                auth()->user()->branch_id
            )->where('hour', 'like', '%' . $this->search . '%')
             ->orWhere('amount', 'like', '%' . $this->search . '%')->get(),
        ]);
    }

    protected function getTableQuery(): Builder
    {
        return extensionRateModel::query()->where(
            'branch_id',
            auth()->user()->branch_id
        );
    }

    protected function getTableColumns(): array
    {
        return [
            Tables\Columns\TextColumn::make('hour')
                ->label('HOUR')
                ->searchable()
                ->sortable(),
            Tables\Columns\TextColumn::make('amount')
                ->formatStateUsing(function (string $state) {
                    return '₱' . number_format($state, 2) . '';
                })
                ->label('AMOUNT')
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
                        $title = 'Update Successfully',
                        $description =
                            'Extension rate has been updated successfully'
                    );
                })
                ->form(function ($record) {
                    return [
                        Grid::make(1)->schema([
                            TextInput::make('hour')->default($record->hour),
                            TextInput::make('amount')->default($record->amount),
                        ]),
                    ];
                })
                ->modalHeading('Update Extension Rate')
                ->modalWidth('lg'),
            Tables\Actions\DeleteAction::make('user.destroy'),
        ];
    }

    public function saveExtension()
    {
        $this->validate([
            'hour' =>
                'required|unique:extension_rates,hour,branch_id' .
                auth()->user()->branch_id,
            'amount' => 'required',
        ]);

        extensionRateModel::create([
            'hour' => $this->hour,
            'amount' => $this->amount,
            'branch_id' => auth()->user()->branch_id,
        ]);

        $this->add_modal = false;
        $this->reset(['hour', 'amount']);

        $this->dialog()->success(
            $title = 'Extension Saved',
            $description = 'Extension rate has been saved successfully'
        );
    }

    public function editExtension($extension_id)
    {
        $extension = extensionRateModel::where('id', $extension_id)->first();
        $this->extension_id = $extension->id;
        $this->hour = $extension->hour;
        $this->amount = $extension->amount;
        $this->edit_modal = true;
    }

    public function updateExtension()
    {
        $this->validate([
            'hour' =>
                'required|unique:extension_rates,hour,' . $this->extension_id,
            'amount' => 'required',
        ]);

        extensionRateModel::where('id', $this->extension_id)->update([
            'hour' => $this->hour,
            'amount' => $this->amount,
        ]);

        $this->edit_modal = false;
        $this->reset(['hour', 'amount']);

        $this->dialog()->success(
            $title = 'Extension Updated',
            $description = 'Extension has been updated successfully'
        );
    }

    public function deleteExtension($extension_id)
    {
        $this->dialog()->confirm([
            'title' => 'Are you Sure?',
            'description' => 'delete this extension?',
            'icon' => 'question',
            'accept' => [
                'label' => 'Yes, delete it',
                'method' => 'confirmDeleteExtension',
                'params' => [$extension_id],
            ],
            'reject' => [
                'label' => 'No, cancel',
            ],
        ]);
    }

    public function confirmDeleteExtension($extension_id)
    {
        extensionRateModel::where('id', $extension_id)->delete();
        $this->dialog()->success(
            $title = 'Extension Deleted',
            $description = 'Extension has been deleted successfully'
        );
    }
}
