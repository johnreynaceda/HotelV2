<?php

Route::prefix('kitchen')
    ->middleware(['auth', 'role:kitchen'])
    ->group(function () {
        Route::get('/dashboard', function () {
            return view('kitchen.index');
        })->name('kitchen.dashboard');
        Route::get('/category', function () {
            return view('kitchen.category');
        })->name('kitchen.category');
        Route::get('/menus', function () {
            return view('kitchen.menu');
        })->name('kitchen.menu');
    });
