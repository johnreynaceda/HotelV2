<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\Branch;
use Filament\Tables;
use Filament\Tables\Actions\Action;
use WireUi\Traits\Actions;
use Illuminate\Database\Eloquent\Builder;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Select;

class SuperadminSettings extends Component implements Tables\Contracts\HasTable
{
    use Tables\Concerns\InteractsWithTable;
    use Actions;

     protected function getTableQuery(): Builder
    {
        return Branch::query();
    }

    protected function getTableColumns(): array
    {
        return [
            Tables\Columns\TextColumn::make('name')
                ->label('NAME')
                ->searchable()
                ->sortable(),
            Tables\Columns\TextColumn::make('address')
                ->label('ADDRESS')
                ->searchable()
                ->sortable(),
            Tables\Columns\TextColumn::make('extension_time_reset')
                ->label('EXTENSION TIME RESET (IN HOURS)')
                ->searchable()
                ->sortable(),
            Tables\Columns\TextColumn::make('initial_deposit')
                ->label('INITIAL DEPOSIT (IN PESOS)')
                ->searchable()
                ->sortable(),
            Tables\Columns\TextColumn::make('discount_amount')
                ->label('DISCOUNT (IN PESOS)')
                ->searchable()
                ->sortable(),
            // Tables\Columns\TextColumn::make('price')
            //     ->formatStateUsing(function (string $state) {
            //         return '₱' . number_format($state, 2) . '';
            //     })
            //     ->label('AMOUNT')
            //     ->searchable()
            //     ->sortable(),
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
                            'Branch Settings has been updated successfully'
                    );
                })
                ->form(function ($record) {
                    return [
                        Grid::make(1)->schema([
                            TextInput::make('name')
                                ->default($record->name)
                                ->required(),
                            Textarea::make('address')
                                ->default($record->address)
                                ->required(),
                            TextInput::make('extension_time_reset')
                                ->default($record->extension_time_reset)
                                ->numeric()
                                ->required(),
                            TextInput::make('initial_deposit')
                                ->default($record->initial_deposit)
                                ->numeric()
                                ->required(),
                            TextInput::make('discount_amount')
                                ->default($record->discount_amount)
                                ->numeric()
                                ->required(),
                        ]),
                    ];
                })
                ->modalHeading('Update Branch Settings')
                ->modalWidth('lg'),
        ];
    }

    public function render()
    {
        return view('livewire.admin.superadmin-settings');
    }
}
