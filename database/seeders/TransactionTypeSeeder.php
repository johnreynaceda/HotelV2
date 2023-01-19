<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\TransactionType;

class TransactionTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $transaction_type = TransactionType::create([
            'name' => 'Check In',
            'position' => 1,
        ]);
        $transaction_type = TransactionType::create([
            'name' => 'Deposit',
            'position' => 2,
        ]);
        $transaction_type = TransactionType::create([
            'name' => 'Kitchen Order',
            'position' => 3,
        ]);
        $transaction_type = TransactionType::create([
            'name' => 'Damage Change',
            'position' => 4,
        ]);
        $transaction_type = TransactionType::create([
            'name' => 'Cashout',
            'position' => 5,
        ]);
        $transaction_type = TransactionType::create([
            'name' => 'Extend',
            'position' => 6,
        ]);
        $transaction_type = TransactionType::create([
            'name' => 'Transfer Room',
            'position' => 7,
        ]);
        $transaction_type = TransactionType::create([
            'name' => 'Amenities',
            'position' => 8,
        ]);
        $transaction_type = TransactionType::create([
            'name' => 'Food and Beverages',
            'position' => 9,
        ]);
    }
}
