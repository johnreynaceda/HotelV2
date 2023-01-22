<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Rate;
use App\Models\ExtensionRate;

class RateSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Rate::create([
            'branch_id' => 1,
            'staying_hour_id' => 1,
            'type_id' => 1,
            'amount' => 200,
            'is_available' => 1,
        ]);
        Rate::create([
            'branch_id' => 1,
            'staying_hour_id' => 2,
            'type_id' => 1,
            'amount' => 300,
            'is_available' => 1,
        ]);
        Rate::create([
            'branch_id' => 1,
            'staying_hour_id' => 3,
            'type_id' => 1,
            'amount' => 500,
            'is_available' => 1,
        ]);

        ExtensionRate::create([
            'branch_id' => 1,
            'hour' => 3,
            'amount' => 100,
        ]);
        ExtensionRate::create([
            'branch_id' => 1,
            'hour' => 6,
            'amount' => 200,
        ]);
        ExtensionRate::create([
            'branch_id' => 1,
            'hour' => 18,
            'amount' => 600,
        ]);
    }
}
