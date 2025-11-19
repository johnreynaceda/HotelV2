<?php

namespace App\Http\Livewire\Superadmin;

use App\Models\ActivityLog;
use Livewire\Component;
use WireUi\Traits\Actions;
use Filament\Tables;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Filters\Layout;
use Filament\Forms;
use Filament\Tables\Filters\Filter;
use Filament\Forms\Components\Grid;

class ActivityLogs extends Component implements Tables\Contracts\HasTable
{
     use Tables\Concerns\InteractsWithTable;
    use Actions;

    public function render()
    {
        return view('livewire.superadmin.activity-logs');
    }

    protected function getTableQuery(): Builder
    {
        if(auth()->user()->hasRole('superadmin')){
            return ActivityLog::query();
        }else{
            return ActivityLog::query()->where(
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
            Tables\Columns\TextColumn::make('user.name')
                ->label('USER')
                ->formatStateUsing(
                    fn(string $state): string => strtoupper("{$state}")
                )
                ->searchable()
                ->sortable(),
            Tables\Columns\TextColumn::make('activity')
                ->label('ACTIVITY')
                ->formatStateUsing(
                    fn(string $state): string => strtoupper("{$state}")
                )
                ->searchable()
                ->sortable(),
            Tables\Columns\TextColumn::make('description')
                ->label('DESCRIPTION')
                ->formatStateUsing(
                    fn(string $state): string => strtoupper("{$state}")
                )
                ->searchable()
                ->sortable(),
            Tables\Columns\TextColumn::make('created_at')
                ->label('DATE')
                ->formatStateUsing(
                    fn(string $state): string => strtoupper("{$state}")
                )
                ->datetime()
                ->sortable(),
        ];
    }

    protected function getTableFilters(): array
    {

        if(auth()->user()->hasRole('superadmin')){
            return [
                SelectFilter::make('branch')->relationship('branch', 'name'),
                Filter::make('created_at')
            ->form([
               Grid::make()
                    ->schema([
                        Forms\Components\DatePicker::make('created_from')->label('Date From')->columnSpan(1),
                        Forms\Components\DatePicker::make('created_until')->label('Date To')->columnSpan(1),
                    ])->columnSpanFull(),
            ])
            ->query(function (Builder $query, array $data): Builder {
                return $query
                    ->when(
                        $data['created_from'],
                        fn (Builder $query, $date): Builder => $query->whereDate('created_at', '>=', $date),
                    )
                    ->when(
                        $data['created_until'],
                        fn (Builder $query, $date): Builder => $query->whereDate('created_at', '<=', $date),
                    );
            })
            ];
        }else{
            return [
                Filter::make('created_at')
                ->form([
                    Grid::make()
                    ->schema([
                        Forms\Components\DatePicker::make('created_from')->label('Date From')->columnSpan(1),
                        Forms\Components\DatePicker::make('created_until')->label('Date To')->columnSpan(1),
                    ])->columnSpanFull(),
                ])
                ->query(function (Builder $query, array $data): Builder {
                    return $query
                        ->when(
                            $data['created_from'],
                            fn (Builder $query, $date): Builder => $query->whereDate('created_at', '>=', $date),
                        )
                        ->when(
                            $data['created_until'],
                            fn (Builder $query, $date): Builder => $query->whereDate('created_at', '<=', $date),
                        );
                })
            ];
        }
    }

    protected function getTableFiltersLayout(): ?string
    {
        return Layout::AboveContent;
    }
}
