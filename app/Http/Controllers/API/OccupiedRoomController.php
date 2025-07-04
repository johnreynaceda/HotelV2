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
    // public function occupiedRooms()
    // {
    //     try {
    //         $floors = Floor::with(['rooms' => function ($query) {
    //                 $query->where('status', 'Occupied')->with(['checkInDetail.guest.type']);
    //             }])
    //             ->orderBy('number')
    //             ->get();

    //         return ApiResponse::success(['data' => $floors], 200);
    //     } catch (\Exception $e) {
    //         Log::error('Occupied Rooms API Error: ' . $e->getMessage(), [
    //             'trace' => $e->getTrace()
    //         ]);
    //         return ApiResponse::error($e->getMessage());
    //     }
    // }

    public function occupiedRooms(Request $request)
    {
        try {
            $qrCode = $request->query('qr_code'); // Get the qr_code query param

            $floors = Floor::with(['rooms' => function ($query) use ($qrCode) {
                $query->where('status', 'Occupied')
                    ->with(['checkInDetail.guest.type']);

                if ($qrCode) {
                    $query->whereHas('checkInDetail.guest', function ($guestQuery) use ($qrCode) {
                        $guestQuery->where('qr_code', $qrCode);
                    });
                }
            }])
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
