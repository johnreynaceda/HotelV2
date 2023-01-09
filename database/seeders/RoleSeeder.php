<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $role = Role::create(['name' => 'superadmin']);
        $role = Role::create(['name' => 'admin']);
        $role = Role::create(['name' => 'frontdesk']);
        $role = Role::create(['name' => 'roomboy']);
        $role = Role::create(['name' => 'kitchen']);
        $role = Role::create(['name' => 'kiosk']);
        $role = Role::create(['name' => 'back_office']);
    }
}
