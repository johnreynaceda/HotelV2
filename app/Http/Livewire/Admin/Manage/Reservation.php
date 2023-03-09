<?php

namespace App\Http\Livewire\Admin\Manage;

use Livewire\Component;
use Filament\Tables;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use App\Models\TemporaryReserved;
use Illuminate\Database\Eloquent\Collection;
use Filament\Tables\Columns\TextColumn;
use App\Models\Type;
use App\Models\Rate;
use App\Models\Room;

class Reservation extends Component implements Tables\Contracts\HasTable
{
    use Tables\Concerns\InteractsWithTable;

    public $add_modal = false;
    public $type_id;
    public $room_id;
    public $rate_id;
    public $is_longStay;
    public $number_of_days;

    protected function getTableQuery(): Builder
    {
        return TemporaryReserved::query()->where(
            'branch_id',
            auth()->user()->branch_id
        );
    }

    protected function getTableColumns(): array
    {
        return [
            TextColumn::make('title')
                ->label('Title')
                ->searchable()
                ->sortable(),
        ];
    }

    public function render()
    {
        return view('livewire.admin.manage.reservation', [
            'types' => Type::where(
                'branch_id',
                auth()->user()->branch_id
            )->get(),
            'rooms' => Room::where('branch_id', auth()->user()->branch_id)
                ->when($this->type_id, function ($query) {
                    $query->where('type_id', $this->type_id);
                })
                ->get(),
            'rates' => Rate::where('branch_id', auth()->user()->branch_id)
                ->when($this->type_id, function ($query) {
                    $query->where('type_id', $this->type_id);
                })
                ->get(),
        ]);
    }

    public function updatedIsLongStay()
    {
        if ($this->is_longStay == true) {
            $this->rate_id = null;
        } else {
            $this->number_of_days = null;
        }
    }
}
