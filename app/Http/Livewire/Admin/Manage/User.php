<?php

namespace App\Http\Livewire\Admin\Manage;

use Livewire\Component;
use App\Models\User as userModel;
use Livewire\WithPagination;
use WireUi\Traits\Actions;
use Filament\Tables;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Actions\Action;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Tables\Columns\BadgeColumn;

class User extends Component implements Tables\Contracts\HasTable
{
    use Tables\Concerns\InteractsWithTable;
    use Actions;

    public $type = 1;
    public $add_modal = false;
    public $edit_modal = false;
    public $search;
    public $name, $email, $password, $role, $user_id;

    public function render()
    {
        return view('livewire.admin.manage.user', [
            'users' => userModel::where('branch_id', auth()->user()->branch_id)

                ->whereHas('roles', function ($role) {
                    $role->where('name', '!=', 'superadmin');
                })
                ->with('roles')
                ->paginate(10),
        ]);
    }

    protected function getTableQuery(): Builder
    {
        return userModel::query()
            ->where('branch_id', auth()->user()->branch_id)
            ->where('id', '!=', 1)
            ->with('roles');
    }

    protected function getTableColumns(): array
    {
        return [
            Tables\Columns\TextColumn::make('name')
                ->label('NAME')
                ->searchable()
                ->sortable(),
            Tables\Columns\TextColumn::make('email')
                ->label('EMAIL')
                ->searchable()
                ->sortable(),
            // Tables\Columns\TextColumn::make('roles.name')
            //     ->formatStateUsing(fn (string $state): string => strtoupper($state))
            //     ->label('ROLES')
            //     ->searchable()
            //     ->sortable(),
        ];
    }

    protected function getTableActions(): array
    {
        return [
            Tables\Actions\EditAction::make('user.edit')
                ->icon('heroicon-o-pencil-alt')
                ->color('success')
                ->action(function ($record, $data) {
                    if ($data['role'] != $record->roles->first()->name) {
                        $record->removeRole($record->roles->first()->name);
                        $record->update([
                            'name' => $data['name'],
                            'email' => $data['email'],
                            'password' => bcrypt($data['password']),
                            'role' => $data['role'],
                        ]);
                        $record->assignRole($data['role']);

                        $this->dialog()->success(
                            $title = 'User Updated',
                            $description =
                                'The user has been updated successfully.'
                        );
                    } else {
                        $record->update([
                            'name' => $data['name'],
                            'email' => $data['email'],
                            'password' => bcrypt($data['password']),
                            'role' => $data['role'],
                        ]);

                        $this->dialog()->success(
                            $title = 'User Updated',
                            $description =
                                'The user has been updated successfully.'
                        );
                    }
                })
                ->form(function ($record) {
                    return [
                        Grid::make(2)->schema([
                            TextInput::make('name')->default($record->name),
                            TextInput::make('email')->default($record->email),
                            TextInput::make('password')
                                ->password()
                                ->default($record->password),
                            Select::make('role')
                                ->options([
                                    'admin' => 'Admin',
                                    'Occupied' => 'Occupied',
                                    'frontdesk' => 'Frontdesk',
                                    'kiosk' => 'Kiosk',
                                    'kitchen' => 'Kitchen',
                                    'roomboy' => 'Roomboy',
                                    'Cleaned' => 'Back_Office',
                                ])
                                ->default($record->roles->first()->name),
                        ]),
                    ];
                })
                ->modalHeading('Update User')
                ->modalWidth('xl'),
            Tables\Actions\DeleteAction::make('user.destroy')->action(function (
                $record
            ) {
                $record->removeRole($record->roles->first()->name);
                $record->delete();
                $this->dialog()->success(
                    $title = 'User Deleted',
                    $description = 'The user has been deleted successfully.'
                );
            }),
        ];
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
