<?php

Route::prefix('roomboy')
    ->middleware(['auth', 'role:roomboy'])
    ->group(function () {
        Route::get('/dashboard', function () {
            return view('roomboy.index');
        })->name('roomboy.dashboard');
    });
