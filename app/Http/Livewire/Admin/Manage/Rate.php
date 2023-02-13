<?php

namespace App\Http\Livewire\Admin\Manage;

use Livewire\Component;
use App\Models\Rate as rateModel;
use App\Models\StayingHour;
use App\Models\Type;
use WireUi\Traits\Actions;
use Livewire\WithPagination;
use Filament\Tables;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Actions\Action;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;

class Rate extends Component implements Tables\Contracts\HasTable
{
    use Tables\Concerns\InteractsWithTable;
    use Actions;
    public $add_modal = false;
    public $edit_modal = false;
    public $amount, $hours_id, $type_id, $rate_id;
    public $search;
    public function render()
    {
        return view('livewire.admin.manage.rate', [
            'stayingHours' => StayingHour::where(
                'branch_id',
                auth()->user()->branch_id
            )->get(),
        ]);
    }
    protected function getTableQuery(): Builder
    {
        return Type::query()
            ->where('branch_id', auth()->user()->branch_id)
            ->with(['rates.stayingHour', 'rates.type']);
    }

    public function getTableContent()
    {
        return view('custom-table', [
            'types' => Type::query()
                ->where('branch_id', auth()->user()->branch_id)
                ->get(),
        ]);
    }

    protected function getTableColumns(): array
    {
        return [
            Tables\Columns\TextColumn::make('rates.stayingHour.number')
                ->label('HOURS')
                ->searchable()
                ->sortable(),
            Tables\Columns\TextColumn::make('rates.amount')
                ->label('AMOUNT')
                ->searchable()
                ->sortable(),
        ];
    }

    public function saveRate()
    {
        $this->validate([
            'amount' => 'required|regex:/^\d+$/',
            'hours_id' => 'required',
            'type_id' => 'required',
        ]);

        $rate_exists = rateModel::where('staying_hour_id', $this->hours_id)
            ->where('type_id', $this->type_id)
            ->where('amount', $this->amount)
            ->where('branch_id', auth()->user()->branch_id)
            ->exists();

        if ($rate_exists) {
            $this->dialog()->error(
                $title = 'Rate Exists',
                $description = 'The rate you are trying to add already exists.'
            );
        } elseif (
            rateModel::where('staying_hour_id', $this->hours_id)
                ->where('amount', $this->amount)
                ->where('branch_id', auth()->user()->branch_id)
                ->exists()
        ) {
            $this->dialog()->error(
                $title = 'Rate Exists',
                $description = 'The rate you are trying to add already exists.'
            );
        } elseif (
            rateModel::where('type_id', $this->type_id)
                ->where('amount', $this->amount)
                ->where('branch_id', auth()->user()->branch_id)
                ->exists()
        ) {
            $this->dialog()->error(
                $title = 'Rate Exists',
                $description = 'The rate you are trying to add already exists.'
            );
        } elseif (
            rateModel::where('staying_hour_id', $this->hours_id)
                ->where('branch_id', auth()->user()->branch_id)
                ->where('type_id', $this->type_id)
                ->exists()
        ) {
            $this->dialog()->error(
                $title = 'Rate Exists',
                $description = 'The rate you are trying to add already exists.'
            );
        } else {
            rateModel::create([
                'branch_id' => auth()->user()->branch_id,
                'amount' => $this->amount,
                'staying_hour_id' => $this->hours_id,
                'type_id' => $this->type_id,
            ]);

            $this->reset(['amount', 'hours_id', 'type_id']);
            $this->dialog()->success(
                $title = 'Rate Saved',
                $description = 'Rate was successfully saved'
            );
            $this->add_modal = false;
        }
    }

    public function editRate($rate_id)
    {
        $rate = rateModel::where('id', $rate_id)->first();
        $this->amount = $rate->amount;
        $this->hours_id = $rate->staying_hour_id;
        $this->type_id = $rate->type_id;
        $this->rate_id = $rate->id;
        $this->edit_modal = true;
    }

    public function updateRate()
    {
        $this->validate([
            'amount' => 'required|regex:/^\d+$/',
            'hours_id' => 'required',
            'type_id' => 'required',
        ]);

        $rate_exists = rateModel::where('staying_hour_id', $this->hours_id)
            ->where('type_id', $this->type_id)
            ->where('amount', $this->amount)
            ->where('branch_id', auth()->user()->branch_id)
            ->where('id', '!=', $this->rate_id)
            ->exists();

        if ($rate_exists) {
            $this->dialog()->error(
                $title = 'Rate Exists',
                $description = 'The rate you are trying to add already exists.'
            );
        } elseif (
            rateModel::where('staying_hour_id', $this->hours_id)
                ->where('amount', $this->amount)
                ->where('branch_id', auth()->user()->branch_id)
                ->where('id', '!=', $this->rate_id)
                ->exists()
        ) {
            $this->dialog()->error(
                $title = 'Rate Exists',
                $description = 'The rate you are trying to add already exists.'
            );
        } elseif (
            rateModel::where('type_id', $this->type_id)
                ->where('amount', $this->amount)
                ->where('branch_id', auth()->user()->branch_id)
                ->where('id', '!=', $this->rate_id)
                ->exists()
        ) {
            $this->dialog()->error(
                $title = 'Rate Exists',
                $description = 'The rate you are trying to add already exists.'
            );
        } elseif (
            rateModel::where('staying_hour_id', $this->hours_id)
                ->where('branch_id', auth()->user()->branch_id)
                ->where('type_id', $this->type_id)
                ->where('id', '!=', $this->rate_id)
                ->exists()
        ) {
            $this->dialog()->error(
                $title = 'Rate Exists',
                $description = 'The rate you are trying to add already exists.'
            );
        } else {
            rateModel::where('id', $this->rate_id)->update([
                'amount' => $this->amount,
                'staying_hour_id' => $this->hours_id,
                'type_id' => $this->type_id,
            ]);

            $this->reset(['amount', 'hours_id', 'type_id']);
            $this->dialog()->success(
                $title = 'Rate Saved',
                $description = 'Rate was successfully saved'
            );
            $this->add_modal = false;
        }
    }
}
