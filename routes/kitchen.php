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
        Route::get('/inventories', function () {
            return view('kitchen.inventory');
        })->name('kitchen.inventories');
        Route::get('/transactions', function () {
            return view('kitchen.transactions');
        })->name('kitchen.transactions');
    });
