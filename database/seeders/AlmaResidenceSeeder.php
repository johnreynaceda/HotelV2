<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\StayingHour;

class AlmaResidenceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        StayingHour::create([
            'branch_id' => 1,
            'number' => 6,
        ]);
        StayingHour::create([
            'branch_id' => 1,
            'number' => 12,
        ]);
        StayingHour::create([
            'branch_id' => 1,
            'number' => 24,
        ]);
    }
}
