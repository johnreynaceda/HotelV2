<?php

namespace App\Http\Livewire\Roomboy;

use App\Models\Room;
use App\Models\Floor;
use Livewire\Component;
use App\Models\RoomBoyReport;
use App\Models\CleaningHistory;
use Illuminate\Support\Facades\DB;
use WireUi\Traits\Actions;

class Main extends Component
{
    use Actions;
    public $user;
    public $floors;
    public $rooms;

    public function mount()
    {
        $this->user = auth()->user();
        $this->floors = $this->user->floors()->orderBy('id')->get();
        $this->rooms = Room::whereBranchId($this->user->branch_id)
            ->where('status', 'Uncleaned')
            ->whereFloorId($this->floors->first()->id)
            ->orderBy('time_to_clean', 'asc')
            ->get();
    }

    public function getSelectedFloor($floorId)
    {
        $this->rooms = Room::whereBranchId(auth()->user()->branch_id)
                ->where('status', 'Uncleaned')
                ->whereFloorId($floorId)
                ->orderBy('time_to_clean', 'asc')
                ->get();
    }
    public function finishCleaning($id)
    {
        $room = Room::where(
            'id',
            $id
        )->first();

        $record_count = RoomBoyReport::where('roomboy_id', auth()->user()->id)
            ->whereDate('created_at', now())
            ->count();

        $getlastRecord = RoomBoyReport::where('room_id', $room->id)
            ->where('roomboy_id', auth()->user()->id)
            ->orderBy('id', 'desc')
            ->first();

        if (now()->diffInMinutes($room->started_cleaning_at) < 15) {
            $this->dialog()->error(
                $title = 'Error',
                $message = 'You need to clean for at least 15 minutes'
            );
        } else {
            DB::beginTransaction();

            CleaningHistory::create([
                'user_id' => auth()->user()->id,
                'room_id' => $room->id,
                'floor_id' => $room->floor_id,
                'branch_id' => $room->branch_id,
                'current_assigned_floor_id' =>
                    auth()->user()->roomboy_assigned_floor_id == $room->floor_id
                        ? true
                        : false,
                'start_time' => $room->started_cleaning_at,
                'end_time' => \Carbon\Carbon::now(),
                'expected_end_time' => $room->time_to_clean,
                'cleaning_duration' => now()->diffInMinutes(
                    $room->started_cleaning_at
                ),
                'delayed_cleaning' => \Carbon\Carbon::parse(
                    $room->time_to_clean
                )->isPast()
                    ? true
                    : false,
            ]);

            auth()
                ->user()
                ->update([
                    'roomboy_cleaning_room_id' => null,
                ]);

            $room->update([
                'status' => 'Available',
                'started_cleaning_at' => null,
                'time_to_clean' => null,
            ]);

            // if ($record_count > 0) {

            // } else {
            //     dd('getlastrecord');
            // }

            $getlastRecord->update([
                'cleaning_end' => \Carbon\Carbon::now(),
                'total_hours_spent' => \Carbon\Carbon::parse(
                    $getlastRecord->cleaning_start
                )->diffInMinutes(\Carbon\Carbon::now()),
                'is_cleaned' => true,
            ]);

            DB::commit();

            $this->dialog()->success(
                $title = 'Success',
                $message = 'Room cleaned successfully'
            );
        }
    }


    public function render()
    {
        return view('livewire.roomboy.main');
    }
}
