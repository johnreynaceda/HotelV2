<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;

class AdditionalUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $pub_kitchen = User::create([
            'name' => 'PUB Kitchen',
            'email' => 'pub-kitchen@gmail.com',
            'password' => bcrypt('password'),
            'branch_id' => 1,
            'branch_name' => 'ALMA RESIDENCES GENSAN',
        ]);

        $pub_kitchen->assignRole('pub_kitchen');
    }
}
