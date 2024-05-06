<?php

Route::prefix('pub_kitchen')
    ->middleware(['auth', 'role:pub_kitchen'])
    ->group(function () {
        Route::get('/dashboard', function () {
            return view('pub_kitchen.index');
        })->name('pub_kitchen.dashboard');
        Route::get('/pub-category', function () {
            return view('pub_kitchen.pub-category');
        })->name('pub.pub-category');
        Route::get('/pub-menus', function () {
            return view('pub_kitchen.pub-menu');
        })->name('pub.pub-menu');
        Route::get('/pub-inventories', function () {
            return view('pub_kitchen.pub-inventory');
        })->name('pub.pub-inventory');
        Route::get('/pub-transactions', function () {
            return view('pub_kitchen.pub-transactions');
        })->name('pub.pub-transactions');
    });
