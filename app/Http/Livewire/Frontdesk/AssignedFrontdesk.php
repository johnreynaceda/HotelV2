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
        array_push($this->get_frontdesk, $frontdesk_id);
    }

    public function removeFrontdesk($frontdesk_id)
    {
        $this->get_frontdesk = array_diff($this->get_frontdesk, [
            $frontdesk_id,
        ]);
    }

    public function saveFrontdesk()
    {
        DB::beginTransaction();
        ShiftLog::create([
            'time_in' => \Carbon\Carbon::now(),
            'frontdesk_ids' => json_encode($this->get_frontdesk),
        ]);

        auth()->user()->update([
                'time_in' => \Carbon\Carbon::now(),
                'assigned_frontdesks' => json_encode($this->get_frontdesk),
            ]);

        DB::commit();    
        $this->dialog()->success(
            $title = 'Success',
            $description = 'Frontdesk assigned successfully'
        );
        return redirect()->route('frontdesk.dashboard');
    }
}
