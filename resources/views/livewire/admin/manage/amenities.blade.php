<div>
  {{-- <div class="mt-5">
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

    <div class="mt-3 flex flex-col">
      <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
          <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">
            <table class="min-w-full divide-y divide-gray-300">
              <thead class="bg-gray-500">
                <tr>
                  <th scope="col"
                    class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold uppercase text-white sm:pl-6">
                    NAME</th>
                  <th scope="col"
                    class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold uppercase text-white sm:pl-6">
                    AMOUNT</th>

                  <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                    <span class="sr-only">Edit</span>
                  </th>
                </tr>
              </thead>
              <tbody class="divide-y divide-gray-200 bg-white">
                @forelse ($requestable_items as $item)
                  <tr>
                    <td class="whitespace-nowrap py-3 pl-4 pr-3 text-sm   text-gray-700 sm:pl-6">
                      {{ $item->name }} </td>
                    <td class="whitespace-nowrap py-3 pl-4 pr-3 text-sm   text-gray-700 sm:pl-6">
                      &#8369;{{ number_format($item->price, 2) }}</td>

                    <td class="relative whitespace-nowrap py-3 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
                      <div class="flex space-x-2 justify-end">
                        <x-button icon="pencil-alt" wire:click="editItem({{ $item->id }})"
                          spinner="editItem({{ $item->id }})" label="Edit" xs />
                        <x-button wire:click="deleteItem({{ $item->id }})" spinner="deleteItem({{ $item->id }})"
                          icon="trash" label="Delete" xs />
                      </div>
                    </td>
                  </tr>
                @empty
                  <td colspan="3" class="py-3 pl-4 pr-3 text-sm flex justify-center w-full  text-gray-700 sm:pl-6">
                    <div class="">
                      <span class="text-center"> No data found</span>
                    </div>
                  </td>
                @endforelse
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>

  <x-modal wire:model.defer="add_modal" max-width="lg">
    <x-card title="Add New">
      <div class="flex flex-col space-y-3">
        <x-input wire:model.defer="name" label="Name" placeholder="" />
        <x-input wire:model.defer="amount" label="Amount" placeholder="" />
      </div>
      <x-slot name="footer">
        <div class="flex justify-end gap-x-2">
          <x-button flat label="Cancel" x-on:click="close" />
          <x-button wire:click="saveRequest" spinner="saveRequest" positive label="Save" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>

  <x-modal wire:model.defer="edit_modal" max-width="lg">
    <x-card title="Update Requestable Item">
      <div class="flex flex-col space-y-3">
        <x-input wire:model.defer="name" label="Name" placeholder="" />
        <x-input wire:model.defer="amount" label="Amount" placeholder="" />
      </div>
      <x-slot name="footer">
        <div class="flex justify-end gap-x-2">
          <x-button flat label="Cancel" x-on:click="close" />
          <x-button wire:click="updateItems" spinner="updateItems" positive label="Update" />
        </div>
      </x-slot>
    </x-card>
  </x-modal> --}}

  <div class="bg-white p-4 rounded-xl">
    <div class="flex mb-5">
      <x-button wire:click="$set('add_modal', true)" icon="plus" blue label="Add New Amenities" />
    </div>
    {{ $this->table }}
  </div>

  <x-modal wire:model.defer="add_modal" align="center" max-width="lg">
    <x-card>
      <div class="header flex space-x-2 items-center">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" class="fill-gray-600">
          <path fill="none" d="M0 0h24v24H0z" />
          <path
            d="M11 11V7h2v4h4v2h-4v4h-2v-4H7v-2h4zm1 11C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm0-2a8 8 0 1 0 0-16 8 8 0 0 0 0 16z" />
        </svg>
        <h1 class="text-lg font-semibold uppercase text-gray-600 ">Add New Amenities</h1>
      </div>
      <div class="mt-5 px-2 flex flex-col space-y-3 ">
         @if(auth()->user()->hasRole('superadmin'))
          <x-native-select label="Branch" wire:model="branch_id">
              <option selected hidden>Select Branch</option>
                @foreach ($branches as $item)
                    <option value="{{ $item->id }}">{{ $item->name }}</option>
                @endforeach
          </x-native-select>
          @endif
        <x-input label="Name" wire:model.defer="name" />
        <x-input label="Amount" wire:model.defer="amount" />
      </div>
      <x-slot name="footer">
        <div class="flex justify-end gap-x-4">
          <x-button flat label="Cancel" x-on:click="close" />

          <x-button positive right-icon="save-as" wire:click="saveRequest" spinner="saveRequest" label="Save" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>
</div>
