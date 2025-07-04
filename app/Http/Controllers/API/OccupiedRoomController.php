<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Room;
use App\Models\Floor;
use App\Models\CheckInDetail;
use App\Models\Guest;
use App\Helpers\ApiResponse;
use Illuminate\Support\Facades\Log;

class OccupiedRoomController extends Controller
{
     public function occupiedRooms(Request $request, $branchId)
    {
        try {
            $floorId = $request->query('floor_id');

            $floors = Floor::with(['rooms' => function ($query) use ($branchId, $floorId) {
                $query->where('status', 'Occupied')
                    ->where('branch_id', $branchId)
                    ->when($floorId, fn($q) => $q->where('floor_id', $floorId))
                    ->with([
                        'type',
                        'guestRel'
                    ])
                    ->orderBy('number', 'asc');
            }])
            ->where('branch_id', $branchId)
            ->orderBy('number')
            ->get();

            return ApiResponse::success(['data' => $floors], 200);
        } catch (\Exception $e) {
            Log::error('Occupied Rooms API Error: ' . $e->getMessage(), [
                'trace' => $e->getTrace()
            ]);
            return ApiResponse::error($e->getMessage());
        }
    }
}
