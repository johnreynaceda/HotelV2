<?php

Route::prefix('roomboy')
    ->middleware(['auth', 'role:roomboy'])
    ->group(function () {
        Route::get('/dashboard', function () {
            return view('roomboy.index');
        })->name('roomboy.dashboard');
         Route::get('/cleaning-history', function () {
            return view('roomboy.cleaning-history');
        })->name('roomboy.cleaning-history');

    });
