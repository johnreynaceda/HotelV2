<?php

namespace App\Http\Controllers\Api;

use App\Models\Room;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Helpers\ApiResponse;
use Illuminate\Support\Facades\Log;

class QrRoomController extends Controller
{
    public function getRoomByQr($qrCode)
    {
        try {
            $room = Room::where('status', 'Occupied')
                ->whereHas('checkInDetail.guest', function ($query) use ($qrCode) {
                    $query->where('qr_code', $qrCode);
                })
                ->with([
                    'latestCheckInDetail.guest.type',
                    'floor' // Optional: Include floor info if needed
                ])
                ->first();

            if (!$room) {
                return ApiResponse::error('Room not found for this QR code', 404);
            }

            return ApiResponse::success(['data' => $room], 200);
        } catch (\Exception $e) {
            Log::error('QR Room Lookup Error: ' . $e->getMessage());
            return ApiResponse::error($e->getMessage());
        }
    }
}
