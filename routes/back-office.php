<?php

Route::prefix('back-office')
    ->middleware(['auth', 'role:back_office'])
    ->group(function () {
        Route::get('/dashboard', function () {
            return view('back-office.index');
        })->name('back-office.dashboard');
        Route::get('/sales', function () {
            return view('back-office.sales');
        })->name('back-office.sales');
        Route::get('/expenses', function () {
            return view('back-office.expenses');
        })->name('back-office.expenses');
    });
