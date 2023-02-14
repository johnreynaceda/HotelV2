<div>
  {{-- <div class="mt-5">
    <div class="sm:flex sm:items-center ">
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
    <div class="grid grid-cols-5 gap-4 mt-5">
      @forelse ($floors as $floor)
        <div class="border rounded-xl h-40 grid place-content-center relative shadow">
          <div class="absolute top-2 right-2">
            <x-button.circle wire:click="editFloor({{ $floor->id }})" spinner="editFloor({{ $floor->id }})"
              warning icon="pencil-alt" />
          </div>
          <svg class="w-20 h-20 text-gray-700" xmlns="http://www.w3.org/2000/svg"
            xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 16 16" fill="currentColor">
            <path fill="currentColor" d="M2 0v16h12v-16h-12zM13 15h-4v-3h-2v3h-4v-14h10v14z"></path>
            <path fill="currentColor" d="M4 9h2v2h-2v-2z"></path>
            <path fill="currentColor" d="M7 9h2v2h-2v-2z"></path>
            <path fill="currentColor" d="M10 9h2v2h-2v-2z"></path>
            <path fill="currentColor" d="M4 6h2v2h-2v-2z"></path>
            <path fill="currentColor" d="M7 6h2v2h-2v-2z"></path>
            <path fill="currentColor" d="M10 6h2v2h-2v-2z"></path>
            <path fill="currentColor" d="M4 3h2v2h-2v-2z"></path>
            <path fill="currentColor" d="M7 3h2v2h-2v-2z"></path>
            <path fill="currentColor" d="M10 3h2v2h-2v-2z"></path>
          </svg>
          <span class=" mt-2 text-center font-medium">{{ $floor->numberWithFormat() }}</span>
        </div>
      @empty
        <div class="text-center col-span-5 mt-5 text-gray-500">
          No Floor Found
        </div>
      @endforelse
    </div>
  </div>

  <x-modal wire:model.defer="add_modal" max-width="lg">
    <x-card title="Add New">
      <div class="flex flex-col space-y-2">
        <x-input wire:model.defer="number" label="Floor Number" placeholder="" />
      </div>
      <x-slot name="footer">
        <div class="flex justify-end gap-x-2">
          <x-button flat label="Cancel" x-on:click="close" />
          <x-button spinner="saveFloor" wire:click="saveFloor" positive label="Save" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>

  <x-modal wire:model.defer="edit_modal" max-width="lg">
    <x-card title="Update Floor">
      <div class="flex flex-col space-y-2">
        <x-input wire:model.defer="number" label="Floor Number" placeholder="" />
      </div>
      <x-slot name="footer">
        <div class="flex justify-end gap-x-2">
          <x-button flat label="Cancel" x-on:click="close" />
          <x-button spinner="updateFloor" wire:click="updateFloor" positive label="Update" />
        </div>
      </x-slot>
    </x-card>
  </x-modal> --}}
  <div class="bg-white p-4 rounded-xl">
    <div class="flex mb-5">
      <x-button wire:click="$set('add_modal', true)" icon="plus" slate label="Add New Floor" />
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
        <h1 class="text-lg font-semibold uppercase text-gray-600 ">Add New Floor</h1>
      </div>
      <div class="mt-5 px-4 ">
        <x-input label="Number" wire:model.defer="number" />

      </div>
      <x-slot name="footer">
        <div class="flex justify-end gap-x-4">
          <x-button flat label="Cancel" x-on:click="close" />

          <x-button positive right-icon="save-as" spinner="saveFloor" wire:click="saveFloor" label="Save" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>
</div>
