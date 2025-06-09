<?php

namespace App\Http\Controllers\Api;

use App\Models\Room;
use App\Models\Floor;
use Illuminate\Http\Request;
use App\Models\TemporaryReserved;
use App\Http\Controllers\Controller;
use App\Models\TemporaryCheckInKiosk;

class FloorController extends Controller
{
    public function indexWithRooms(Request $request, $branchId)
    {
        return response()->json([
                'success' => true,
                'data' => $branchId,
            ]);
        try {

             return response()->json([
                'success' => true,
                'data' => $branchId,
            ]);
            $temporaryCheckInKiosk = TemporaryCheckInKiosk::where(
            'branch_id',
            $branchId
            )
            ->get()
            ->pluck('room_id')
            ->toArray();



            $temporaryReserved = TemporaryReserved::where(
            'branch_id',
            $branchId
            )
            ->pluck('room_id')
            ->toArray();

            $typeId = $request->query('type_id');

            $floorId = $request->query('floor_id'); // Optional single floor filter

            $floors = Floor::with(['rooms' => function ($query) use (
            $typeId,
            $temporaryCheckInKiosk,
            $temporaryReserved,
            $floorId
        ) {
            $query->where('status', 'Available')
                ->where('is_priority', true)
                ->when($typeId, fn($q) => $q->where('type_id', $typeId))
                ->when($floorId, fn($q) => $q->where('floor_id', $floorId))
                ->whereNotIn('id', $temporaryCheckInKiosk)
                ->whereNotIn('id', $temporaryReserved)
                ->with(['type.rates'])
                ->orderBy('number', 'asc');
        }])
        ->where('branch_id', $branchId)
        ->orderBy('number')
        ->get();





        // Then manually limit rooms in each floor (if needed)
        foreach ($floors as $floor) {
            $floor->setRelation('rooms', $floor->rooms->take(10));
        }

         return response()->json([
                'success' => true,
                'data' => $floors,
            ]);

        } catch (\Exception $e) {
            // return response()->json([
            // 'success' => false,
            // 'message' => 'An error occurred while fetching floors.',
            // 'error' => $e->getMessage(),
            // ], 500);
             return response()->json([
            'success' => false,
            'message' => 'Server error: ' . $e->getMessage(),
            'trace' => $e->getTrace(),
        ], 500);
        }
    }
}
