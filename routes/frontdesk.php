<?php

Route::prefix('frontdesk')
    ->middleware(['auth', 'role:frontdesk'])
    ->group(function () {
        Route::get('/dashboard', function () {
            dd('frontdesk');
        })->name('frontdesk.dashboard');
    });
