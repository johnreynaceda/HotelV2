<div>
  <h1 class="font-bold text-2xl text-gray-700">MANAGE TYPE</h1>

  <div class="mt-5">
    <div class="px-4 sm:px-6 lg:px-8">
      <div class="sm:flex sm:items-center">
        <div class="sm:flex-auto">
          <div class="search flex items-center rounded-lg  px-3 py-1 w-72 border border-gray-200 shadow-sm">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="fill-gray-500" width="24" height="24">
              <path fill="none" d="M0 0h24v24H0z" />
              <path
                d="M11 2c4.968 0 9 4.032 9 9s-4.032 9-9 9-9-4.032-9-9 4.032-9 9-9zm0 16c3.867 0 7-3.133 7-7 0-3.868-3.133-7-7-7-3.868 0-7 3.132-7 7 0 3.867 3.132 7 7 7zm8.485.071l2.829 2.828-1.415 1.415-2.828-2.829 1.414-1.414z" />
            </svg>
            <input type="text" wire:model="search"
              class="outline:none  h-8 focus:ring-0 flex-1 border-0 focus:border-0" placeholder="Search">
          </div>
        </div>
        <div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">
          <x-button wire:click="$set('add_modal', true)" icon="plus" slate label="Add New" />
        </div>
      </div>
      <div class="mt-3 flex flex-col">
        <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
          <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
            <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">
              <table class="min-w-full divide-y divide-gray-300">
                <thead class="bg-gray-500">
                  <tr>
                    <th scope="col"
                      class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold uppercase text-white sm:pl-6">
                      Name</th>

                    <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                      <span class="sr-only">Edit</span>
                    </th>
                  </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 bg-white">
                  @forelse ($types as $key => $type)
                    <tr>
                      <td class="whitespace-nowrap py-3 pl-4 pr-3 text-sm uppercase font-medium text-gray-700 sm:pl-6">
                        {{ $type->name }}</td>

                      <td class="relative whitespace-nowrap py-3 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
                        <x-button spinner="editType({{ $type->id }})" wire:click="editType({{ $type->id }})"
                          icon="pencil-alt" label="Edit" xs />
                      </td>
                    </tr>
                  @empty
                    <td colspan="2" class="text-center py-2">
                      <span>No types available...</span>
                    </td>
                  @endforelse
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <x-modal wire:model.defer="add_modal" max-width="lg">
    <x-card title="Add New">
      <div>
        <x-input wire:model.defer="name" label="Name" placeholder="" />
      </div>
      <x-slot name="footer">
        <div class="flex justify-end gap-x-2">
          <x-button flat label="Cancel" x-on:click="close" />
          <x-button wire:click="saveType" positive label="Save" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>

  <x-modal wire:model.defer="edit_modal" max-width="lg">
    <x-card title="Update Type">
      <div>
        <x-input wire:model.defer="name" label="Name" placeholder="" />
      </div>
      <x-slot name="footer">
        <div class="flex justify-end gap-x-2">
          <x-button flat label="Cancel" x-on:click="close" />
          <x-button wire:click="updateType" positive label="Update" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>
</div>
