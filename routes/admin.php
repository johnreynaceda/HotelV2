<?php

Route::prefix('admin')
    ->middleware(['auth', 'role:admin'])
    ->group(function () {
        Route::get('/dashboard', function () {
            return view('admin.index');
        })->name('admin.dashboard');
        Route::get('/types', function () {
            return view('admin.manage.type');
        })->name('admin.type');
        Route::get('/rates', function () {
            return view('admin.manage.rate');
        })->name('admin.rate');
        Route::get('/floors', function () {
            return view('admin.manage.floor');
        })->name('admin.floor');
        Route::get('/rooms', function () {
            return view('admin.manage.room');
        })->name('admin.room');
    });
