<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use WireUi\Traits\Actions;
use App\Models\ExtensionRate;

class Settings extends Component
{
    use Actions;
    public $code_modal = false;
    public $extension_modal = false;
    public $initial_deposit_modal = false;

    public $code, $old_code, $old;
    public $reset_time;

    public $initial_deposit = 0;
    public $editMode = false;
    public function render()
    {
        return view('livewire.admin.settings', [
            'extensions' => ExtensionRate::where(
                'branch_id',
                auth()->user()->branch_id
            )->get(),
        ]);
    }

    public function openModal($modal_type)
    {
        switch ($modal_type) {
            case 'code':
                if (auth()->user()->branch->autorization_code == null) {
                    $this->code_modal = true;
                } else {
                    $this->old = auth()->user()->branch->autorization_code;
                    $this->editMode = true;
                    $this->code_modal = true;
                }
                break;

            case 'extension':
                if (auth()->user()->branch->extension_time_reset == null) {
                    $this->extension_modal = true;
                } else {
                    $this->reset_time = auth()->user()->branch->extension_time_reset;
                    $this->editMode = true;
                    $this->extension_modal = true;
                }
                break;
            case 'initial_deposit':
                    $this->initial_deposit = auth()->user()->branch->initial_deposit;
                    $this->editMode = true;
                    $this->initial_deposit_modal = true;
                break;

            default:
                # code...
                break;
        }
    }

    public function saveCode()
    {
        if ($this->editMode == false) {
            $this->validate([
                'code' => 'required|max:5',
            ]);

            auth()
                ->user()
                ->branch->update([
                    'autorization_code' => $this->code,
                ]);
            $this->dialog()->success(
                $title = 'Success',
                $description = 'Authorization code has been saved.'
            );
            $this->code_modal = false;
            $this->code = null;
        } else {
            $this->validate([
                'code' => 'required|max:5',
                'old_code' => 'required|same:old',
            ]);

            if ($this->old_code == $this->code) {
                $this->dialog()->error(
                    $title = 'Sorry',
                    $description =
                        'New code cannot be the same as the old code.'
                );
            } else {
                auth()
                    ->user()
                    ->branch->update([
                        'old_autorization' => $this->old,
                        'autorization_code' => $this->code,
                    ]);
                $this->dialog()->success(
                    $title = 'Success',
                    $description = 'Authorization code has been updated.'
                );
                $this->code_modal = false;
                $this->code = null;
                $this->old_code = null;
                $this->editMode = false;
            }
        }
    }

    public function saveExtension()
    {
        if ($this->editMode == false) {
            $this->validate([
                'reset_time' => 'required|numeric',
            ]);

            auth()
                ->user()
                ->branch->update([
                    'extension_time_reset' => $this->reset_time,
                ]);
            $this->dialog()->success(
                $title = 'Success',
                $description = 'Extension time has been saved.'
            );
            $this->extension_modal = false;
            $this->reset_time = null;
        } else {
            $this->validate([
                'reset_time' => 'required|numeric',
            ]);

            auth()
                ->user()
                ->branch->update([
                    'extension_time_reset' => $this->reset_time,
                ]);

            $this->dialog()->success(
                $title = 'Success',
                $description = 'Extension time has been updated.'
            );
            $this->extension_modal = false;
            $this->reset_time = null;
        }
    }

    public function saveInitialDeposit()
    {
        $this->validate([
            'initial_deposit' => 'required|numeric',
        ]);

        auth()
            ->user()
            ->branch->update([
                'initial_deposit' => $this->initial_deposit,
            ]);
        $this->dialog()->success(
            $title = 'Success',
            $description = 'Initial deposit has been updated.'
        );
        $this->initial_deposit_modal = false;
        $this->initial_deposit = 0;
    }
}
