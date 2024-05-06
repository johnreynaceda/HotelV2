<div>
    <div class="flex justify-between text-3xl text-gray-700 font-semibold">
        <div>
            Manage Category
        </div>
        <div>
            <a href="{{route('frontdesk.food-inventory')}}">
            <x-button icon="arrow-left" slate label="Return" />
            </a>
        </div>
    </div>
    <div class="mt-5">
        <div class="mt-4 sm:mt-0">
            <x-button wire:click="$set('add_modal', true)" icon="plus" emerald label="Add New" />
          </div>
          <div class="mt-5">
              {{$this->table}}
          </div>
    </div>
    <x-modal wire:model.defer="add_modal" max-width="lg">
        <x-card title="Add New Category">
          <div>
            <x-input label="Name" wire:model="name" />
          </div>
          @error('name')@enderror
          <x-slot name="footer">
            <div class="flex justify-end gap-x-4">
              <x-button flat label="Cancel" x-on:click="close" />
              <x-button positive label="Save" wire:click="saveCategory" spinner="saveCategory"/>
            </div>
          </x-slot>
        </x-card>
      </x-modal>

      <x-modal wire:model.defer="edit_modal" max-width="lg">
        <x-card title="Update Category">
          <div>
            <x-input label="Name" wire:model="name" />
          </div>
          @error('name')@enderror
          <x-slot name="footer">
            <div class="flex justify-end gap-x-4">
              <x-button flat label="Cancel" x-on:click="close" />
              <x-button positive label="Update" wire:click="updateCategory" spinner="updateCategory"/>
            </div>
          </x-slot>
        </x-card>
      </x-modal>
</div>
