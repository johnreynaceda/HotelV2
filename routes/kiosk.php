<?php

Route::prefix('kiosk')
    ->middleware(['auth', 'role:kiosk'])
    ->group(function () {
        Route::get('/dashboard', function () {
            return view('kiosk.index');
        })->name('kiosk.dashboard');
        Route::get('/check-in', function () {
            return view('kiosk.check-in');
        })->name('kiosk.check-in');
    });
