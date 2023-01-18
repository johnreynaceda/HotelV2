<?php

Route::prefix('frontdesk')
    ->middleware(['auth', 'role:frontdesk'])
    ->group(function () {
        Route::get('/dashboard', function () {
            return view('frontdesk.index');
        })->name('frontdesk.dashboard');
        Route::get('/room-monitoring', function () {
            return view('frontdesk.monitoring.room-monitorings');
        })->name('frontdesk.room-monitoring');
        Route::get('/priority-room', function () {
            return view('frontdesk.priority-room');
        })->name('frontdesk.priority-room');
        Route::get('/manage-guest/{id}', function () {
            return view('frontdesk.monitoring.manage-guest');
        })->name('frontdesk.manage-guest');
    });
