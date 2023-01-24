<?php

namespace App\Http\Livewire\Roomboy;

use Livewire\Component;
use App\Models\Room;
use WireUi\Traits\Actions;
use App\Models\CleaningHistory;
use DB;

class Index extends Component
{
    use Actions;
    public function render()
    {
        return view('livewire.roomboy.index', [
            'assignedRooms' => Room::whereBranchId(auth()->user()->branch_id)
                ->where('status', 'Uncleaned')
                ->whereFloorId(auth()->user()->roomboy_assigned_floor_id)
                ->orderBy('time_to_clean', 'asc')
                ->get(),

            'unassignedRooms' => Room::whereBranchId(auth()->user()->branch_id)
                ->where('status', 'Uncleaned')
                ->where(
                    'floor_id',
                    '!=',
                    auth()->user()->roomboy_assigned_floor_id
                )
                ->get(),
        ]);
    }

    public function startCleaning($room_id)
    {
        $room = Room::where('id', $room_id)->first();
        if (auth()->user()->roomboy_cleaning_room_id != null) {
            $this->dialog()->error(
                $title = 'Error',
                $message = 'You are already cleaning a room'
            );
        } else {
            $room->update([
                'status' => 'Cleaning',
                'started_cleaning_at' => \Carbon\Carbon::now(),
            ]);

            auth()
                ->user()
                ->update([
                    'roomboy_cleaning_room_id' => $room_id,
                ]);
        }
    }

    public function finishCleaning()
    {
        $room = Room::where(
            'id',
            auth()->user()->roomboy_cleaning_room_id
        )->first();

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

            DB::commit();

            $this->dialog()->success(
                $title = 'Success',
                $message = 'Room cleaned successfully'
            );
        }
    }
}
