<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Branch;
use App\Models\User;

class BranchSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $branch = Branch::create([
            'name' => 'ALMA RESIDENCES GENSAN',
            'address' => 'Brgy. 1, Gensan, South Cotabato',
            'autorization_code' => 12345,
            'extension_time_reset' => 24
        ]);

        $superadmin = User::create([
            'name' => 'Superadmin',
            'email' => 'superadmin@gmail.com',
            'password' => bcrypt('password'),
            'branch_id' => $branch->id,
            'branch_name' => $branch->name,
        ]);

        $superadmin->assignRole('superadmin');

        $admin = User::create([
            'name' => 'Admin',
            'email' => 'admin@gmail.com',
            'password' => bcrypt('password'),
            'branch_id' => $branch->id,
            'branch_name' => $branch->name,
        ]);

        $admin->assignRole('admin');

        $frontdesk = User::create([
            'name' => 'Frontdesk',
            'email' => 'frontdesk@gmail.com',
            'password' => bcrypt('password'),
            'branch_id' => $branch->id,
            'branch_name' => $branch->name,
        ]);

        $frontdesk->assignRole('frontdesk');

        $kiosk = User::create([
            'name' => 'Kiosk',
            'email' => 'kiosk@gmail.com',
            'password' => bcrypt('password'),
            'branch_id' => $branch->id,
            'branch_name' => $branch->name,
        ]);

        $kiosk->assignRole('kiosk');

        $kitchen = User::create([
            'name' => 'Kitchen',
            'email' => 'kitchen@gmail.com',
            'password' => bcrypt('password'),
            'branch_id' => $branch->id,
            'branch_name' => $branch->name,
        ]);

        $kitchen->assignRole('kitchen');

        $back_office = User::create([
            'name' => 'Back Office',
            'email' => 'back-office@gmail.com',
            'password' => bcrypt('password'),
            'branch_id' => $branch->id,
            'branch_name' => $branch->name,
        ]);

        $back_office->assignRole('back_office');

        $roomboy = User::create([
            'name' => 'Roomboy',
            'email' => 'roomboy@gmail.com',
            'password' => bcrypt('password'),
            'branch_id' => $branch->id,
            'branch_name' => $branch->name,
        ]);

        $roomboy->assignRole('roomboy');
    }
}
