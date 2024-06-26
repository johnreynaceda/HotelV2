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
            'amount' => 224,
            'is_available' => 1,
        ]);
        Rate::create([
            'branch_id' => 1,
            'staying_hour_id' => 2,
            'type_id' => 1,
            'amount' => 336,
            'is_available' => 1,
        ]);
        Rate::create([
            'branch_id' => 1,
            'staying_hour_id' => 4,
            'type_id' => 1,
            'amount' => 560,
            'is_available' => 1,
        ]);

        Rate::create([
            'branch_id' => 1,
            'staying_hour_id' => 1,
            'type_id' => 2,
            'amount' => 280,
            'is_available' => 1,
        ]);
        Rate::create([
            'branch_id' => 1,
            'staying_hour_id' => 2,
            'type_id' => 2,
            'amount' => 392,
            'is_available' => 1,
        ]);
        Rate::create([
            'branch_id' => 1,
            'staying_hour_id' => 4,
            'type_id' => 2,
            'amount' => 616,
            'is_available' => 1,
        ]);

        Rate::create([
            'branch_id' => 1,
            'staying_hour_id' => 1,
            'type_id' => 3,
            'amount' => 336,
            'is_available' => 1,
        ]);
        Rate::create([
            'branch_id' => 1,
            'staying_hour_id' => 2,
            'type_id' => 3,
            'amount' => 448,
            'is_available' => 1,
        ]);
        Rate::create([
            'branch_id' => 1,
            'staying_hour_id' => 4,
            'type_id' => 3,
            'amount' => 672,
            'is_available' => 1,
        ]);

        ExtensionRate::create([
            'branch_id' => 1,
            'hour' => 6,
            'amount' => 100,
        ]);
        ExtensionRate::create([
            'branch_id' => 1,
            'hour' => 12,
            'amount' => 200,
        ]);
        ExtensionRate::create([
            'branch_id' => 1,
            'hour' => 18,
            'amount' => 400,
        ]);
        ExtensionRate::create([
            'branch_id' => 1,
            'hour' => 24,
            'amount' => 500,
        ]);
    }
}
