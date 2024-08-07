<div>
  {{-- <div>
    <div class="mt-5">
      <div class="flex items-end">
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
      <div>
        <div class="mt-6">
          <div class="">
            <div class="mt-3 flex flex-col">
              <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
                <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
                  <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">
                    <table class="min-w-full divide-y divide-gray-300">
                      <thead class="bg-gray-500">
                        <tr>
                          <th scope="col"
                            class="py-3.5 pl-4 pr-3 w-64 text-left text-sm font-semibold uppercase text-white sm:pl-6">
                            NAME</th>
                          <th scope="col"
                            class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold uppercase text-white sm:pl-6">
                            number</th>

                          <th scope="col"
                            class="py-3.5 pl-4 pr-3 text-right text-sm font-semibold uppercase text-white sm:pl-6">
                          </th>

                        </tr>
                      </thead>
                      <tbody class="divide-y divide-gray-200 bg-white">
                        @forelse ($frontdesks as $frontdesk)
                          <tr>
                            <td class="whitespace-nowrap py-3 pl-4 pr-3 text-sm   text-gray-700 sm:pl-6">
                              {{ $frontdesk->name }}</td>
                            <td class="whitespace-nowrap py-3 pl-4 pr-3 text-sm   text-gray-700 sm:pl-6">
                              {{ $frontdesk->number }}
                            </td>

                            <td class="whitespace-nowrap py-3 pl-4 pr-3 text-sm   text-gray-700 sm:pl-6">
                              <div class="flex justify-end">
                                <x-button flat positive label="Edit" wire:click="editFrontdesk({{ $frontdesk->id }})"
                                  spinner="editFrontdesk({{ $frontdesk->id }})" sm icon="pencil-alt" />
                              </div>
                            </td>
                          </tr>
                        @empty
                          <tr>
                            <td colspan="3" class="py-3 pl-4 pr-3 text-sm text-gray-700 sm:pl-6">
                              No data found
                            </td>
                          </tr>
                        @endforelse
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
      <x-modal wire:model.defer="add_modal" max-width="lg">
        <x-card title="Add New Frontdesk">
          <div class="flex flex-col space-y-3">
            <x-input label="Name" wire:model.defer="name" />
            <x-input label="Number" wire:model.defer="number" />
          </div>

          <x-slot name="footer">
            <div class="flex justify-end gap-x-4">
              <x-button flat label="Cancel" x-on:click="close" />
              <x-button positive label="Save" wire:click="addFrontdesk" spinner="addFrontdesk" />
            </div>
          </x-slot>
        </x-card>
      </x-modal>
      <x-modal wire:model.defer="edit_modal" max-width="lg">
        <x-card title="Update Frontdesk">
          <div class="flex flex-col space-y-3">
            <x-input label="Name" wire:model.defer="name" />
            <x-input label="Number" wire:model.defer="number" />
          </div>

          <x-slot name="footer">
            <div class="flex justify-end gap-x-4">
              <x-button flat label="Cancel" x-on:click="close" />
              <x-button positive label="Update" wire:click="updateFrontdesk" spinner="updateFrontdesk" />
            </div>
          </x-slot>
        </x-card>
      </x-modal>
    </div>
  </div> --}}
  <div class="flex mb-5">
    <x-button wire:click="$set('add_modal', true)" icon="plus" blue label="Add New Frontdesk" />
  </div>
  {{ $this->table }}
  <x-modal wire:model.defer="add_modal" align="center" max-width="xl">
    <x-card>
      <div class="header flex space-x-2 items-center">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" class="fill-gray-600">
          <path fill="none" d="M0 0h24v24H0z" />
          <path
            d="M11 11V7h2v4h4v2h-4v4h-2v-4H7v-2h4zm1 11C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm0-2a8 8 0 1 0 0-16 8 8 0 0 0 0 16z" />
        </svg>
        <h1 class="text-lg font-semibold uppercase text-gray-600 ">Add New Frontdesk</h1>
      </div>
      <div class="mt-5 px-2 flex flex-col space-y-3 ">
        <x-input label="Name" wire:model.defer="name" />
        <x-input label="Number" wire:model.defer="number" />


      </div>
      <x-slot name="footer">
        <div class="flex justify-end gap-x-4">
          <x-button flat label="Cancel" x-on:click="close" />

          <x-button positive right-icon="save-as" wire:click="addFrontdesk" spinner="addFrontdesk" label="Save" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>
</div>
