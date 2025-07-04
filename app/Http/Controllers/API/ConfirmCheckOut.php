<?php

namespace App\Http\Controllers\API;

use App\Models\Guest;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;

class ConfirmCheckOut extends Controller
{
    public function kioskCheckOut($guestId)
{
    try {
        $guest = Guest::findOrFail($guestId);
        $guest->has_kiosk_check_out = 1;
        $guest->save();

        return response()->json([
            'status' => true,
            'message' => 'Guest kiosk checkout updated successfully.',
            'data' => $guest
        ], 200);
    } catch (\Exception $e) {
        Log::error('Kiosk checkout failed: ' . $e->getMessage());

        return response()->json([
            'status' => false,
            'message' => 'Failed to update kiosk checkout.',
            'error' => $e->getMessage()
        ], 500);
    }
}
}
