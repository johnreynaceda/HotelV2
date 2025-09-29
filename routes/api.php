<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\RateController;
use App\Http\Controllers\API\TypeController;
use App\Http\Controllers\API\FloorController;
use App\Http\Controllers\API\QrRoomController;
use App\Http\Controllers\API\CheckInController;
use App\Http\Controllers\API\OccupiedRoomController;
use App\Http\Controllers\API\ConfirmCheckOut;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->get('/room-types', [TypeController::class, 'index']);
Route::get('/branch/{branch}/floors-with-rooms', [FloorController::class, 'index']);
Route::get('/rates', [RateController::class, 'index']);
Route::middleware('auth:sanctum')->post('/kiosk/check-in', [CheckInController::class, 'store']);
Route::get('/occupied-rooms/{branchId}', [OccupiedRoomController::class, 'occupiedRooms']);
Route::get('/guest-room-by-qr/{qr_code}', [QrRoomController::class, 'getRoomByQr']);
Route::post('/guest-kiosk-checkout/{guest}', [ConfirmCheckOut::class, 'kioskCheckOut']);
