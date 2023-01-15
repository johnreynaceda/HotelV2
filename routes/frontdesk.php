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
    });
