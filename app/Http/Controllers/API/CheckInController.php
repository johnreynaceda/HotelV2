<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Models\Guest;
use App\Models\TemporaryCheckInKiosk;
use Illuminate\Support\Facades\Auth;

class CheckInController extends Controller
{
public function store(Request $request)
{
        $request->validate([
            'name' => 'required|string',
            'contact' => 'nullable|string',
            'room_id' => 'required|integer',
            'rate_id' => 'required|integer',
            'type_id' => 'required|integer',
            'room_pay' => 'required|numeric',
            'longstay' => 'nullable|integer',
        ]);

        $user = Auth::user();

        $transaction = Guest::whereYear('created_at', Carbon::today()->year)->count() + 1;

        $transaction_code = $user->branch_id . today()->format('y') . str_pad($transaction, 4, '0', STR_PAD_LEFT);

        $guest = Guest::create([
            'branch_id' => $user->branch_id,
            'name' => $request->name,
            'contact' => $request->contact == null ? 'N/A' : '09' . $request->contact,
            'qr_code' => $transaction_code,
            'room_id' => $request->room_id,
            'rate_id' => $request->rate_id,
            'type_id' => $request->type_id,
            'static_amount' => $request->room_pay,
            'is_long_stay' => $request->longstay != null,
            'number_of_days' => $request->longstay ?? 0,
        ]);

        TemporaryCheckInKiosk::create([
            'guest_id' => $guest->id,
            'room_id' => $request->room_id,
            'branch_id' => $user->branch_id,
            'terminated_at' => Carbon::now()->addMinutes(20),
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Guest successfully checked in.',
            'guest' => $guest,
        ], 201);
    }
}
