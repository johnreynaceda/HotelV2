<?php

namespace App\Http\Livewire\Admin\Manage;

use Livewire\Component;
use App\Models\ExtensionRate as extensionRateModel;
use WireUi\Traits\Actions;
use Livewire\WithPagination;

class ExtensionRate extends Component
{
    use Actions;
    use WithPagination;

    public $add_modal = false;
    public $edit_modal = false;
    public $hour, $amount, $extension_id;
    public function render()
    {
        return view('livewire.admin.manage.extension-rate', [
            'extensionRates' => extensionRateModel::where(
                'branch_id',
                auth()->user()->branch_id
            )->get(),
        ]);
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
