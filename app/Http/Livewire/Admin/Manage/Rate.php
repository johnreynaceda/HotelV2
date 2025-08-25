<?php

namespace App\Http\Livewire\Admin\Manage;

use App\Models\Type;
use Filament\Tables;
use Livewire\Component;
use WireUi\Traits\Actions;
use App\Models\StayingHour;
use Livewire\WithPagination;
use App\Models\Rate as rateModel;
use Filament\Forms\Components\Grid;
use Filament\Tables\Actions\Action;
use Illuminate\Contracts\View\View;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Illuminate\Database\Eloquent\Builder;

class Rate extends Component implements Tables\Contracts\HasTable
{
    use Tables\Concerns\InteractsWithTable;
    use Actions;
    public $add_modal = false;
    public $edit_modal = false;
    public $amount, $hours_id, $type_id, $rate_id;
    public $search;
    public $has_discount = false;
    public $branch_id;
    public $branch_name;

    public function render()
    {
        return view('livewire.admin.manage.rate', [
            // 'stayingHours' => StayingHour::where(
            //     'branch_id',
            //     auth()->user()->branch_id
            // )->get(),
            'stayingHours' => StayingHour::all(),
            'branches' => \App\Models\Branch::all(),
        ]);
    }
    protected function getTableQuery(): Builder
    {
        if(auth()->user()->hasRole('superadmin'))
        {
            return Type::query()
            ->where('branch_id', $this->branch_id)
            ->with(['rates.stayingHour', 'rates.type']);
        }else{
            return Type::query()
            ->where('branch_id', auth()->user()->branch_id)
            ->with(['rates.stayingHour', 'rates.type']);
        }
    }

    public function updatedBranchId()
    {
        $this->branch_name = \App\Models\Branch::where('id', $this->branch_id)->value('name');
        $this->resetPage();
    }

    public function getTableContent()
    {
        return view('custom-table', [
            'types' => Type::query()
                ->where('branch_id', auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id)
                ->get(),
        ]);
    }

    public function toggleDiscount($id)
    {
        $this->dialog()->confirm([
            'title'       => 'Are you Sure?',
            'description' => 'Do you want to update the discount status of this rate?',
            'acceptLabel' => 'Yes, update it',
            'method'      => 'saveDiscount',
            'params'      => $id,
        ]);
    }

    public function saveDiscount($id)
    {
        $rate = rateModel::find($id);
        $rate->has_discount = !$rate->has_discount;
        $rate->save();

        $this->dialog()->success(
            $title = 'Discount Updated',
            $description = 'Discount status has been updated successfully.'
        );
    }


    protected function getTableColumns(): array
    {
        return [
            // Tables\Columns\TextColumn::make('rates.stayingHour.number')
            //     ->label('HOURS')
            //     ->searchable()
            //     ->sortable(),
            // Tables\Columns\TextColumn::make('rates.amount')
            //     ->label('AMOUNT')
            //     ->searchable()
            //     ->sortable(),
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
            ->where('branch_id', auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id)
            ->exists();

        if ($rate_exists) {
            $this->dialog()->error(
                $title = 'Rate Exists',
                $description = 'The rate you are trying to add already exists.'
            );
        } elseif (
            rateModel::where('staying_hour_id', $this->hours_id)
                ->where('amount', $this->amount)
                ->where('branch_id', auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id)
                ->exists()
        ) {
            $this->dialog()->error(
                $title = 'Rate Exists',
                $description = 'The rate you are trying to add already exists.'
            );
        } elseif (
            rateModel::where('type_id', $this->type_id)
                ->where('amount', $this->amount)
                ->where('branch_id', auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id)
                ->exists()
        ) {
            $this->dialog()->error(
                $title = 'Rate Exists',
                $description = 'The rate you are trying to add already exists.'
            );
        } elseif (
            rateModel::where('staying_hour_id', $this->hours_id)
                ->where('branch_id', auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id)
                ->where('type_id', $this->type_id)
                ->exists()
        ) {
            $this->dialog()->error(
                $title = 'Rate Exists',
                $description = 'The rate you are trying to add already exists.'
            );
        } else {
            rateModel::create([
                'branch_id' => auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id,
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

    public function updateRates()
    {
        $this->validate([
            'amount' => 'required|regex:/^\d+$/',
            'hours_id' => 'required',
            'type_id' => 'required',
        ]);

        $rate_exists = rateModel::where('staying_hour_id', $this->hours_id)
            ->where('type_id', $this->type_id)
            ->where('amount', $this->amount)
            ->where('branch_id', auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_idbranch_id)
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
                ->where('branch_id', auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id)
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
                ->where('branch_id', auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id)
                ->where('id', '!=', $this->rate_id)
                ->exists()
        ) {
            $this->dialog()->error(
                $title = 'Rate Exists',
                $description = 'The rate you are trying to add already exists.'
            );
        } elseif (
            rateModel::where('staying_hour_id', $this->hours_id)
                ->where('branch_id', auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id)
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
            $this->edit_modal = false;
        }
    }
}
