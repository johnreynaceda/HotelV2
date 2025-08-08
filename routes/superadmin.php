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
        Route::get('/reports', function () {
            return view('superadmin.reports');
        })->name('superadmin.reports');
        //reports
         Route::get('/report/rooms', function () {
            return view('superadmin.report.rooms');
        })->name('superadmin.report.rooms');
         Route::get('/report/expenses', function () {
            return view('superadmin.report.expenses');
        })->name('superadmin.report.expenses');
         Route::get('/report/sales', function () {
            return view('superadmin.report.sales');
        })->name('superadmin.report.sales');
    });
