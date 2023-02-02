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
            'name' => 'ALMA Admin',
            'email' => 'almaadmin@gmail.com',
            'password' => bcrypt('password'),
            'branch_id' => $branch->id,
            'branch_name' => $branch->name,
        ]);

        $admin->assignRole('admin');

        $frontdesk = User::create([
            'name' => 'ALMA Frontdesk',
            'email' => 'almafrontdesk@gmail.com',
            'password' => bcrypt('password'),
            'branch_id' => $branch->id,
            'branch_name' => $branch->name,
        ]);

        $frontdesk->assignRole('frontdesk');

        $kiosk = User::create([
            'name' => 'ALMA Kiosk',
            'email' => 'almakiosk@gmail.com',
            'password' => bcrypt('password'),
            'branch_id' => $branch->id,
            'branch_name' => $branch->name,
        ]);

        $kiosk->assignRole('kiosk');

        $kiosk = User::create([
            'name' => 'ALMA Kiosk 2',
            'email' => 'almakios2k@gmail.com',
            'password' => bcrypt('password'),
            'branch_id' => $branch->id,
            'branch_name' => $branch->name,
        ]);

        $kiosk->assignRole('kiosk');

        $kitchen = User::create([
            'name' => 'ALMA Kitchen',
            'email' => 'almakitchen@gmail.com',
            'password' => bcrypt('password'),
            'branch_id' => $branch->id,
            'branch_name' => $branch->name,
        ]);

        $kitchen->assignRole('kitchen');

        $back_office = User::create([
            'name' => 'ALMA Back Office',
            'email' => 'almaback-office@gmail.com',
            'password' => bcrypt('password'),
            'branch_id' => $branch->id,
            'branch_name' => $branch->name,
        ]);

        $back_office->assignRole('back_office');

        $roomboy = User::create([
            'name' => 'ALMA Roomboy',
            'email' => 'almaroomboy@gmail.com',
            'password' => bcrypt('password'),
            'branch_id' => $branch->id,
            'branch_name' => $branch->name,
        ]);

        $roomboy->assignRole('roomboy');
    }
}
