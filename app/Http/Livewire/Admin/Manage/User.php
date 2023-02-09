<?php

namespace App\Http\Livewire\Admin\Manage;

use Livewire\Component;
use App\Models\User as userModel;
use Livewire\WithPagination;
use WireUi\Traits\Actions;

class User extends Component
{
    use WithPagination;
    use Actions;

    public $add_modal = false;
    public $edit_modal = false;
    public $search;
    public $name, $email, $password, $role, $user_id;

    public function render()
    {
        return view('livewire.admin.manage.user', [
            'users' => userModel::where('branch_id', auth()->user()->branch_id)
                ->with('roles')
                ->whereHas('roles', function ($role) {
                    $role->where('name', '!=', 'superadmin');
                })
                ->paginate(10),
        ]);
    }

    public function saveUser()
    {
        $this->validate([
            'name' => 'required|unique:users,name,',
            'email' => 'required|email|unique:users,email,',
            'password' => 'required',
            'role' => 'required',
        ]);

        $user = userModel::create([
            'name' => $this->name,
            'email' => $this->email,
            'password' => bcrypt($this->password),
            'branch_id' => auth()->user()->branch_id,
            'branch_name' => auth()->user()->branch_name,
        ]);

        $user->assignRole($this->role);

        $this->dialog()->success(
            $title = 'User Saved',
            $description = 'The user has been saved successfully.'
        );
        $this->add_modal = false;

        $this->reset(['name', 'email', 'password', 'role']);
    }

    public function editUser($user_id)
    {
        $user = userModel::where('id', $user_id)->first();

        $this->user_id = $user->id;
        $this->name = $user->name;
        $this->email = $user->email;
        $this->role = $user->roles->first()->name;

        $this->edit_modal = true;
    }

    public function updateUser()
    {
        $user = userModel::where('id', $this->user_id)->first();

        $this->validate([
            'name' => 'required|unique:users,name,' . $user->id,
            'email' => 'required|email|unique:users,email,' . $user->id,
            'password' => 'required',
            'role' => 'required',
        ]);

        if ($this->role != $user->roles->first()->name) {
            $user->removeRole($user->roles->first()->name);
            $user->update([
                'name' => $this->name,
                'email' => $this->email,
                'password' => bcrypt($this->password),
                'role' => $this->role,
            ]);
            $user->assignRole($this->role);

            $this->dialog()->success(
                $title = 'User Updated',
                $description = 'The user has been updated successfully.'
            );
            $this->edit_modal = false;
            $this->reset(['name', 'email', 'password', 'role']);
        } else {
            $user->update([
                'name' => $this->name,
                'email' => $this->email,
                'password' => bcrypt($this->password),
                'role' => $this->role,
            ]);

            $this->dialog()->success(
                $title = 'User Updated',
                $description = 'The user has been updated successfully.'
            );
            $this->edit_modal = false;
            $this->reset(['name', 'email', 'password', 'role']);
        }
    }
    public function deleteUser($user_id)
    {
        $this->dialog()->confirm([
            'title' => 'Are you Sure?',
            'description' => 'delete this user?',
            'icon' => 'question',
            'accept' => [
                'label' => 'Yes, delete this user',
                'method' => 'confirmDelete',
                'params' => [$user_id],
            ],
            'reject' => [
                'label' => 'No, cancel',
            ],
        ]);
    }

    public function confirmDelete($user_id)
    {
        $user = userModel::where('id', $user_id)->first();
        $user->removeRole($user->roles->first()->name);
        $user->delete();

        $this->dialog()->success(
            $title = 'User Deleted',
            $description = 'The user has been deleted successfully.'
        );
    }
}
