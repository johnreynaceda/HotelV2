<div>
  <div class="px-4 sm:px-6 lg:px-8">
    <div class="sm:flex sm:items-center">
      <div class="sm:flex-auto">
        <div class="flex border w-72 items-center rounded-md px-2">
          <div>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="fill-gray-300 h-5 w-5">
              <path fill="none" d="M0 0h24v24H0z" />
              <path
                d="M11 2c4.968 0 9 4.032 9 9s-4.032 9-9 9-9-4.032-9-9 4.032-9 9-9zm0 16c3.867 0 7-3.133 7-7 0-3.868-3.133-7-7-7-3.868 0-7 3.132-7 7 0 3.867 3.132 7 7 7zm8.485.071l2.829 2.828-1.415 1.415-2.828-2.829 1.414-1.414z" />
            </svg>
          </div>
          <div>
            <input type="text" placeholder="Search" class=" focus:outline-none focus:ring-0 border-none w-full">
          </div>
        </div>
      </div>
      <div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">
        <x-button label="Add New" icon="plus" dark wire:click="$set('add_modal', true)" />
      </div>
    </div>
    <div class="mt-5 flex flex-col">
      <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div class="inline-block min-w-full py-2 align-middle">
          <div class="overflow-hidden shadow-sm ring-1 ring-black ring-opacity-5">
            <table class="min-w-full divide-y divide-gray-300">
              <thead class="bg-gray-50">
                <tr>
                  <th scope="col"
                    class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6 lg:pl-8 uppercase">
                    Branch Name
                  </th>
                  <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6 lg:pr-8">
                    <span class="sr-only">Edit</span>
                  </th>
                </tr>
              </thead>
              <tbody class="divide-y divide-gray-200 bg-white">
                @forelse ($branches as $branch)
                  <tr>
                    <td
                      class="whitespace-nowrap py-3 uppercase pl-4 pr-3 text-sm font-medium text-gray-700 sm:pl-6 lg:pl-8">
                      {{ $branch->name }}
                    </td>
                    <td
                      class="relative whitespace-nowrap py-3 pl-3 pr-4 text-right text-sm font-medium sm:pr-6 lg:pr-8">
                      <div class="flex space-x-1 justify-end">
                        <x-button label="Credentials" slate icon="user"
                          wire:click="manageCredentials({{ $branch->id }})"
                          spinner="manageCredentials({{ $branch->id }})" />

                        <x-button label="Edit" icon="pencil-alt" wire:click="editBranch({{ $branch->id }})"
                          spinner="editBranch({{ $branch->id }})" sm positive />
                      </div>
                    </td>
                  </tr>
                @empty
                @endforelse
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>

  <x-modal wire:model.defer="add_modal" align="center" max-width="lg">
    <x-card title="ADD NEW BRANCH">
      <div>
        <x-input label="Branch Name" wire:model.defer="name" />
      </div>

      <x-slot name="footer">
        <div class="flex justify-end gap-x-4">
          <x-button flat label="Cancel" x-on:click="close" />
          <x-button positive label="Save" wire:click="saveBranch" spinner="saveBranch" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>

  <x-modal wire:model.defer="edit_modal" align="center" max-width="lg">
    <x-card title="UPDATE BRANCH">
      <div>
        <x-input label="Branch Name" wire:model.defer="name" />
      </div>

      <x-slot name="footer">
        <div class="flex justify-end gap-x-4">
          <x-button flat label="Cancel" x-on:click="close" />
          <x-button positive label="Save" wire:click="updateBranch" spinner="updateBranch" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>

  <x-modal.card wire:model.defer="credential_modal" fullscreen>
    @php
      $users = \App\Models\User::where('branch_id', $branch_id)->get();
    @endphp
    <div class="mx-auto max-w-7xl ">
      <div class="px-4 sm:px-6 lg:px-8">
        <div class="sm:flex sm:items-center">
          <div class="sm:flex-auto">
            <h1 class="text-xl font-semibold text-gray-900">{{ $users->first()->branch_name ?? null }}</h1>
          </div>
          <div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">
            <x-button label="Add New" slate wire:click="$set('add_user',true)" icon="plus" />
          </div>
        </div>

        <div class="-mx-4 mt-8 overflow-hidden shadow ring-1 ring-black ring-opacity-5 sm:-mx-6 md:mx-0 md:rounded-lg">
          <table class="min-w-full divide-y divide-gray-300">
            <thead class="bg-gray-50">
              <tr>
                <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">Name
                </th>
                <th scope="col"
                  class="hidden px-3 py-3.5 text-left text-sm font-semibold text-gray-900 lg:table-cell">Title</th>
                <th scope="col"
                  class="hidden px-3 py-3.5 text-left text-sm font-semibold text-gray-900 sm:table-cell">Email</th>
                <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Role</th>
                <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                  <span class="sr-only">Edit</span>
                </th>
              </tr>
            </thead>
            <tbody class="divide-y divide-gray-200 s bg-white">
              @forelse ($users as $user)
                <tr>
                  <td
                    class="w-full max-w-0 py-3 pl-4 pr-3 text-sm font-medium text-gray-900 sm:w-auto sm:max-w-none sm:pl-6">
                    {{ $user->name }}
                    <dl class="font-normal lg:hidden">
                      <dt class="sr-only">Title</dt>
                      <dd class="mt-1 truncate text-gray-700">Front-end Developer</dd>
                      <dt class="sr-only sm:hidden">Email</dt>
                      <dd class="mt-1 truncate text-gray-500 sm:hidden">lindsay.walton@example.com</dd>
                    </dl>
                  </td>
                  <td class="hidden px-3 py-3 text-sm text-gray-500 lg:table-cell">Front-end Developer</td>
                  <td class="hidden px-3 py-3 text-sm text-gray-500 sm:table-cell">lindsay.walton@example.com</td>
                  <td class="px-3 py-3 text-sm text-gray-500">
                    <x-badge class="uppercase" label="{{ $user->roles->first()->name ?? null }}" />
                  </td>
                  <td class="py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
                    <x-button label="Edit" wire:click="editUser({{ $user->id }})"
                      spinner="editUser({{ $user->id }})" icon="pencil-alt" sm positive />
                  </td>
                </tr>
              @empty
              @endforelse

              <!-- More people... -->
            </tbody>
          </table>
        </div>
      </div>


    </div>
  </x-modal.card>

  <x-modal wire:model.defer="add_user" max-width="lg">
    <x-card title="Add New">
      <div class="flex flex-col space-y-3">
        <x-input wire:model.defer="user_name" label="Name" placeholder="" />
        <x-input wire:model.defer="user_email" label="Email" placeholder="" />
        <x-inputs.password wire:model.defer="user_password" label="Password" placeholder="" />
        <x-native-select label="Role" wire:model="user_role">
          <option selected hidden>Select Role</option>
          <option value="admin">Admin</option>
          <option value="frontdesk">Frontdesk</option>
          <option value="kiosk">Kiosk</option>
          <option value="kitchen">Kitchen</option>
          <option value="roomboy">Roomboy</option>
          <option value="back_office">Back_Office</option>
        </x-native-select>
      </div>
      <x-slot name="footer">
        <div class="flex justify-end gap-x-2">
          <x-button flat label="Cancel" x-on:click="close" />
          <x-button wire:click="saveUser" spinner="saveUser" positive label="Save" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>

  <x-modal wire:model.defer="edit_user" max-width="lg">
    <x-card title="Update User">
      <div class="flex flex-col space-y-3">
        <x-input wire:model.defer="user_name" label="Name" placeholder="" />
        <x-input wire:model.defer="user_email" label="Email" placeholder="" />
        <x-inputs.password wire:model.defer="user_password" label="Password" placeholder="" />
        <x-native-select label="Role" wire:model="user_role">
          <option selected hidden>Select Role</option>
          <option value="admin">Admin</option>
          <option value="frontdesk">Frontdesk</option>
          <option value="kiosk">Kiosk</option>
          <option value="kitchen">Kitchen</option>
          <option value="roomboy">Roomboy</option>
          <option value="back_office">Back_Office</option>
        </x-native-select>
      </div>
      <x-slot name="footer">
        <div class="flex justify-end gap-x-2">
          <x-button flat label="Cancel" x-on:click="close" />
          <x-button wire:click="updateUser" spinner="updateUser" positive label="Update" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>
</div>
