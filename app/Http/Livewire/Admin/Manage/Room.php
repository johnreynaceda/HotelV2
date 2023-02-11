<?php

namespace App\Http\Livewire\Admin\Manage;

use Livewire\Component;
use App\Models\Room as roomModel;
use App\Models\Type;
use App\Models\Floor;
use WireUi\Traits\Actions;
use Livewire\WithPagination;
use Filament\Tables;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Actions\Action;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Tables\Columns\BadgeColumn;

class Room extends Component implements Tables\Contracts\HasTable
{
    use Tables\Concerns\InteractsWithTable;
    use Actions;
    public $add_modal = false;
    public $edit_modal = false;
    public $types;
    public $number, $floor, $type, $status, $room_id;
    public $floors;
    public $filter_status, $filter_floor;
    public $search;

    public function mount()
    {
        $this->types = Type::where(
            'branch_id',
            auth()->user()->branch_id
        )->get();

        $this->floors = Floor::where('branch_id', auth()->user()->branch_id)
            ->orderBy('number', 'asc')
            ->get();
    }

    protected function getTableQuery(): Builder
    {
        return roomModel::query()
            ->where('branch_id', auth()->user()->branch_id)
            ->with('type', 'floor')
            ->orderBy('number', 'asc');
    }

    public function render()
    {
        return view('livewire.admin.manage.room', [
            'rooms' => roomModel::where('branch_id', auth()->user()->branch_id)
                ->with('type', 'floor')
                ->when($this->filter_status, function ($query) {
                    return $query->where('status', $this->filter_status);
                })
                ->when($this->filter_floor, function ($query) {
                    return $query->where('floor_id', $this->filter_floor);
                })
                ->orderBy('number', 'asc')
                ->paginate(10),
        ]);
    }

    protected function getTableColumns(): array
    {
        return [
            Tables\Columns\TextColumn::make('number')
                ->formatStateUsing(
                    fn(string $state): string => __("ROOM #{$state}")
                )
                ->label('NAME')
                ->searchable()
                ->sortable(),
            Tables\Columns\TextColumn::make('type.name')
                ->formatStateUsing(function (string $state) {
                    return strtoupper($state);
                })
                ->label('TYPE')
                ->searchable(),
            BadgeColumn::make('status')
                ->label('STATUS')
                ->enum([
                    'available' => 'Available',
                    'reviewing' => 'Reviewing',
                    'published' => 'Published',
                ])
                ->colors([
                    'available' => 'available',
                ]),
            Tables\Columns\TextColumn::make('floor.number')
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

                ->label('FLOOR')
                ->searchable(),
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
                })
                ->form(function ($record) {
                    return [
                        Grid::make(1)->schema([
                            TextInput::make('name')->default($record->name),
                        ]),
                    ];
                })
                ->modalHeading('Update Type')
                ->modalWidth('lg'),
        ];
    }

    public function clearFilter()
    {
        $this->filter_status = null;
        $this->filter_floor = null;
    }

    public function saveRoom()
    {
        $this->validate([
            'number' => 'required|integer|regex:/^\d+$/|unique:rooms,number',
            'type' => 'required',
            'floor' => 'required',
            'status' => 'required',
        ]);

        roomModel::create([
            'branch_id' => auth()->user()->branch_id,
            'number' => $this->number,
            'type_id' => $this->type,
            'floor_id' => $this->floor,
            'status' => $this->status,
        ]);

        $this->dialog()->success(
            $title = 'Room saved',
            $description = 'The room has been saved successfully.'
        );

        $this->add_modal = false;
        $this->reset(['number', 'type', 'floor', 'status']);
    }

    public function editRoom($room_id)
    {
        $room = roomModel::where('id', $room_id)->first();
        $this->room_id = $room->id;
        $this->number = $room->number;
        $this->type = $room->type_id;
        $this->floor = $room->floor_id;
        $this->status = $room->status;
        $this->edit_modal = true;
    }

    public function updateRoom()
    {
        $this->validate([
            'number' =>
                'required|integer|regex:/^\d+$/|unique:rooms,number,' .
                $this->room_id,
            'type' =>
                'required|exists:types,id,branch_id,' .
                auth()->user()->branch_id,
            'floor' =>
                'required|exists:floors,id,branch_id,' .
                auth()->user()->branch_id,
        ]);

        $room = roomModel::where('id', $this->room_id)->first();
        $room->update([
            'number' => $this->number,
            'type_id' => $this->type,
            'floor_id' => $this->floor,
            'status' => $this->status,
        ]);

        $this->dialog()->success(
            $title = 'Room Updated',
            $description = 'The room has been updated successfully.'
        );
        $this->reset(['number', 'type', 'floor', 'status', 'room_id']);

        $this->edit_modal = false;
    }
}
