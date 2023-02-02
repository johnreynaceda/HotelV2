<?php

namespace App\Http\Livewire\Superadmin;

use Livewire\Component;
use App\Models\Branch;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class ManageBranch extends Component
{
    public $add_modal = false;
    public $edit_modal = false;
    public $name;
    public $branch_id;
    public $credential_modal = false;

    public $user_name, $user_email, $user_password, $user_role, $user_id;

    public $add_user = false;
    public $edit_user = false;

    public function render()
    {
        return view('livewire.superadmin.manage-branch', [
            'branches' => Branch::get(),
        ]);
    }

    public function saveBranch()
    {
        $this->validate([
            'name' => 'required',
        ]);
        Branch::create([
            'name' => $this->name,
        ]);
        $this->add_modal = false;
        $this->name = '';
    }

    public function editBranch($branch_id)
    {
        $branch = Branch::where('id', $branch_id)->first();
        $this->branch_id = $branch->id;
        $this->name = $branch->name;
        $this->edit_modal = true;
    }

    public function updateBranch()
    {
        $this->validate([
            'name' => 'required',
        ]);
        Branch::where('id', $this->branch_id)->update([
            'name' => $this->name,
        ]);
        $this->edit_modal = false;
        $this->name = '';
        $this->branch_id = null;
    }

    public function manageCredentials($branch_id)
    {
        $this->branch_id = $branch_id;
        $this->credential_modal = true;
    }

    public function saveUser()
    {
        $this->validate([
            'user_name' => 'required',
            'user_email' => 'required|email',
            'user_password' => 'required',
            'user_role' => 'required',
        ]);
        $user = User::create([
            'name' => $this->user_name,
            'email' => $this->user_email,
            'password' => Hash::make($this->user_password),
            'branch_id' => $this->branch_id,
            'branch_name' => Branch::where('id', $this->branch_id)->first()
                ->name,
        ]);
        $user->assignRole($this->user_role);
        $this->add_user = false;
        $this->user_name = '';
        $this->user_email = '';
        $this->user_password = '';
        $this->user_role = '';
    }

    public function editUser($user_id)
    {
        $this->user_id = $user_id;
        $user = User::where('id', $user_id)->first();
        $this->user_name = $user->name;
        $this->user_email = $user->email;
        $this->user_role = $user->roles->first()->name ?? null;

        $this->edit_user = true;
    }

    public function updateUser()
    {
        $this->validate([
            'user_name' => 'required',
            'user_email' => 'required|email',
            'user_role' => 'required',
            'user_password' => 'required',
        ]);

        $user = User::where('id', $this->user_id)->first();
        if ($this->user_role != $user->roles->first()->name) {
            $user->removeRole($user->roles->first()->name);
            $user->update([
                'name' => $this->user_name,
                'email' => $this->user_email,
                'password' => bcrypt($this->user_password),
                'role' => $this->user_role,
            ]);
            $user->assignRole($this->user_role);

            $this->edit_user = false;
            $this->reset([
                'user_name',
                'user_email',
                'user_password',
                'user_role',
            ]);
        } else {
            $user->update([
                'name' => $this->user_name,
                'email' => $this->user_email,
                'password' => bcrypt($this->user_password),
                'role' => $this->user_role,
            ]);

            $this->edit_user = false;
            $this->reset([
                'user_name',
                'user_email',
                'user_password',
                'user_role',
            ]);
        }
    }
}
