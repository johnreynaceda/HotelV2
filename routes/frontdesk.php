<?php

Route::prefix('frontdesk')
    ->middleware(['auth', 'role:frontdesk'])
    ->group(function () {
        Route::get('/dashboard', function () {
            if (auth()->user()->assigned_frontdesks != null) {
                return view('frontdesk.index');
            } else {
                return view('frontdesk.select-frontdesk');
            }
        })->name('frontdesk.dashboard');
        Route::get('/room-monitoring', function () {
            if (auth()->user()->assigned_frontdesks != null) {
                return view('frontdesk.monitoring.room-monitorings');
            } else {
                return view('frontdesk.select-frontdesk');
            }
        })->name('frontdesk.room-monitoring');
        Route::get('/check-in-from-kiosk/{record}', function ($record) {
            if (auth()->user()->assigned_frontdesks != null) {
            return view('frontdesk.monitoring.check-in-from-kiosk', ['record' => $record]);
            } else {
            return view('frontdesk.select-frontdesk');
            }
        })->name('frontdesk.check-in-from-kiosk');
         Route::get('/scan-qr', function () {
            if (auth()->user()->assigned_frontdesks != null) {
                return view('frontdesk.monitoring.scan-qr-code');
            } else {
                return view('frontdesk.select-frontdesk');
            }
        })->name('frontdesk.scan-qr-code');
        // Route::get('/food-inventory', function () {
        //     if (auth()->user()->assigned_frontdesks != null) {
        //         return view('frontdesk.food-inventory');
        //     } else {
        //         return view('frontdesk.select-frontdesk');
        //     }
        // })->name('frontdesk.food-inventory');
        // Route::get('/food/category', function () {
        //     if (auth()->user()->assigned_frontdesks != null) {
        //         return view('frontdesk.food.category');
        //     } else {
        //         return view('frontdesk.select-frontdesk');
        //     }
        // })->name('frontdesk.food-category');
        // Route::get('/food/menu', function () {
        //     if (auth()->user()->assigned_frontdesks != null) {
        //         return view('frontdesk.food.menu');
        //     } else {
        //         return view('frontdesk.select-frontdesk');
        //     }
        // })->name('frontdesk.food-menu');
        // Route::get('/food/inventory', function () {
        //     if (auth()->user()->assigned_frontdesks != null) {
        //         return view('frontdesk.food.inventory');
        //     } else {
        //         return view('frontdesk.select-frontdesk');
        //     }
        // })->name('frontdesk.food-inventories');
        Route::get('/priority-room', function () {
            return view('frontdesk.priority-room');
        })->name('frontdesk.priority-room');
        Route::get('/manage-guest/{id}', function () {
            if (auth()->user()->assigned_frontdesks != null) {
                return view('frontdesk.monitoring.manage-guest');
            } else {
                return view('frontdesk.select-frontdesk');
            }
        })->name('frontdesk.manage-guest');

        Route::get('/guest-transaction/{id}', function () {
            return view('frontdesk.monitoring.guest-transaction');
        })->name('frontdesk.guest-transaction');
    });
