<?php

Route::prefix('superadmin')
    ->middleware(['auth', 'role:superadmin'])
    ->group(function () {
        Route::get('/dashboard', function () {
            return view('superadmin.index');
        })->name('superadmin.dashboard');
        Route::get('/branches', function () {
            return view('superadmin.branches');
        })->name('superadmin.branches');
    });
