<?php

Route::prefix('pub_kitchen')
    ->middleware(['auth', 'role:pub_kitchen'])
    ->group(function () {
        Route::get('/dashboard', function () {
            return view('pub_kitchen.index');
        })->name('pub_kitchen.dashboard');
        // Route::get('/category', function () {
        //     return view('kitchen.category');
        // })->name('kitchen.category');
        // Route::get('/menus', function () {
        //     return view('kitchen.menu');
        // })->name('kitchen.menu');
        // Route::get('/inventories', function () {
        //     return view('kitchen.inventory');
        // })->name('kitchen.inventories');
        // Route::get('/transactions', function () {
        //     return view('kitchen.transactions');
        // })->name('kitchen.transactions');
    });
