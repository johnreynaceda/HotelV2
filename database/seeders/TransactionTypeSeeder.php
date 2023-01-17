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
            'name' => 'Available',
            'position' => 1,
        ]);
        $transaction_type = TransactionType::create([
            'name' => 'Occupied',
            'position' => 2,
        ]);
        $transaction_type = TransactionType::create([
            'name' => 'Reserved',
            'position' => 3,
        ]);
        $transaction_type = TransactionType::create([
            'name' => 'Maintenance',
            'position' => 4,
        ]);
        $transaction_type = TransactionType::create([
            'name' => 'Unavailable',
            'position' => 5,
        ]);
        $transaction_type = TransactionType::create([
            'name' => 'Uncleaned',
            'position' => 6,
        ]);
        $transaction_type = TransactionType::create([
            'name' => 'Cleaning',
            'position' => 7,
        ]);
        $transaction_type = TransactionType::create([
            'name' => 'Cleaned',
            'position' => 8,
        ]);
    }
}
