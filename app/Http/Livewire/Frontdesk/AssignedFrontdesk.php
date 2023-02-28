<?php

namespace App\Http\Livewire\Frontdesk;

use Livewire\Component;
use App\Models\Frontdesk;
use App\Models\AssignedFrontdesk as assignFrontdeskModel;
use App\Models\ShiftLog;
use WireUi\Traits\Actions;
use DB;
class AssignedFrontdesk extends Component
{
    use Actions;
    public $get_frontdesk = [];
    public $partner_modal = false;
    public $name;
    public function render()
    {
        return view('livewire.frontdesk.assigned-frontdesk', [
            'frontdesks' => Frontdesk::where(
                'branch_id',
                auth()->user()->branch_id
            )
                ->WhereNotIn('id', $this->get_frontdesk)
                ->get(),
        ]);
    }

    public function assignFrontdesk($frontdesk_id)
    {
        if (count($this->get_frontdesk) >= 1) {
            $this->dialog()->error(
                $title = 'Sorry',
                $description = 'you have already assigned a frontdesk'
            );
        } else {
            array_push($this->get_frontdesk, $frontdesk_id);
        }
    }

    public function removeFrontdesk($frontdesk_id)
    {
        $this->get_frontdesk = array_diff($this->get_frontdesk, [
            $frontdesk_id,
        ]);
    }

    public function saveFrontdesk()
    {
        $this->partner_modal = true;
    }

    public function savePartner()
    {
        $this->validate([
            'name' => 'required',
        ]);
        array_push($this->get_frontdesk, $this->name);
        $haha = json_encode($this->get_frontdesk);
        DB::beginTransaction();
        ShiftLog::create([
            'time_in' => \Carbon\Carbon::now(),
            'frontdesk_ids' => json_encode($this->get_frontdesk),
        ]);

        auth()
            ->user()
            ->update([
                'time_in' => \Carbon\Carbon::now(),
                'assigned_frontdesks' => $haha,
            ]);

        DB::commit();
        $this->dialog()->success(
            $title = 'Success',
            $description = 'Frontdesk assigned successfully'
        );
        return redirect()->route('frontdesk.dashboard');
    }
}
