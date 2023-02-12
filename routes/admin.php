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
        Route::get('/manage-frontdesk', function () {
            return view('admin.manage-frontdesk');
        })->name('admin.manage-frontdesk');
        Route::get('/rates', function () {
            return view('admin.manage.rate');
        })->name('admin.rate');
        Route::get('/floors', function () {
            return view('admin.manage.floor');
        })->name('admin.floor');
        Route::get('/rooms', function () {
            return view('admin.manage.room');
        })->name('admin.room');
        Route::get('/users', function () {
            return view('admin.manage.user');
        })->name('admin.user');
        Route::get('/discounts', function () {
            return view('admin.manage.discount');
        })->name('admin.discount');
        Route::get('/extension-rates', function () {
            return view('admin.manage.extension-rate');
        })->name('admin.extension-rate');
        Route::get('/damage-charges', function () {
            return view('admin.manage.charges');
        })->name('admin.charges');
        Route::get('/amenities', function () {
            return view('admin.manage.amenities');
        })->name('admin.amenities');
        Route::get('/manage-settings', function () {
            return view('admin.settings');
        })->name('admin.settings');

        Route::get('/roomboy-designation', function () {
            return view('admin.roomboy-designation');
        })->name('admin.roomboy-designation');

        Route::get('/priority-room', function () {
            return view('admin.priority-room');
        })->name('admin.priority-room');
    });
