<div>
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

    <div class="mt-3 flex flex-col">
      <div class="">

        <div class="flex flex-col">
          <div class=" overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
              <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">
                <table class="min-w-full">
                  <thead class="bg-gray-500">
                    <tr>
                      <th scope="col"
                        class="py-3.5 pl-4 pr-3 w-56 text-left text-sm font-semibold text-white uppercase sm:pl-6">
                      </th>
                      <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white uppercase">Name
                      </th>
                      <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white uppercase">price
                      </th>
                      <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white uppercase">STOCKS
                      </th>
                      <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white uppercase">NO. OF
                        SERVINGS
                      </th>
                      <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                        <span class="sr-only">Edit</span>
                      </th>
                    </tr>
                  </thead>
                  <tbody class="bg-white">
                    @foreach ($menuCategories as $category)
                      <tr class="border-t border-gray-200">
                        <th colspan="6 " scope="colgroup"
                          class="bg-gray-100 px-4 py-2 text-left  font-semibold text-gray-700 uppercase sm:px-6">
                          {{ $category->name }}
                        </th>
                      </tr>
                      @forelse ($category->menus as $item)
                        <tr class="border-t border-gray-300">
                          <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-6"></td>
                          <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-700 uppercase">{{ $item->name }}
                          </td>
                          <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-700">
                            &#8369;{{ number_format($item->price, 2) }}</td>
                          <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-700">{{ $item->inventory->stock }}
                          </td>
                          <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-700">
                            {{ $item->inventory->number_of_serving }}</td>
                          <td class="relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
                            <div class="flex justify-end space-x-2">
                              <x-button label="Edit" wire:click="editItem({{ $item->id }})"
                                spinner="editItem({{ $item->id }})" xs default icon="pencil-alt" />
                              <x-button label="Delete"
                                x-on:confirm="{
        title: 'Sure Delete?',
        description: 'Are you sure you want to delete this menu?',
        icon: 'question',
        method: 'deleteMenu',
        params: {{ $item->id }}
    }"
                                xs default icon="trash" />
                          </td>
                        </tr>
                      @empty
                      @endforelse
                    @endforeach
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>

  <x-modal wire:model.defer="add_modal" max-width="xl">
    <x-card title="Add New Menu">
      <div class="grid grid-cols-2 gap-4">
        <x-input label="Name" wire:model="name" />
        <x-input label="Price" wire:model="price" />
        <div class="col-span-2">
          <x-native-select label="Category" wire:model="category_id">
            <option>Select Category</option>
            @foreach ($menuCategories as $item)
              <option value="{{ $item->id }}" class="uppercase">{{ $item->name }}</option>
            @endforeach

          </x-native-select>
        </div>
      </div>
      <div class="mt-4  border-t ">
        <h1 class="py-2 bg-gray-50">Inventory</h1>
        <div class="grid pt-2 grid-cols-2 border-t gap-4">
          <x-input label="Stock" wire:model="stock" />
          <x-input label="default serving" wire:model="default_serving" />
        </div>


      </div>
      <x-slot name="footer">
        <div class="flex justify-end gap-x-4">
          <x-button flat label="Cancel" x-on:click="close" />
          <x-button positive label="Save" wire:click="saveMenu" spinner="saveMenu" right-icon="arrow-narrow-right" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>

  <x-modal wire:model.defer="edit_modal" max-width="xl">
    <x-card title="Add New Menu">
      <div class="grid grid-cols-2 gap-4">
        <x-input label="Name" wire:model="name" />
        <x-input label="Price" wire:model="price" />
        <div class="col-span-2">
          <x-native-select label="Category" wire:model="category_id">
            <option>Select Category</option>
            @foreach ($menuCategories as $item)
              <option value="{{ $item->id }}" class="uppercase">{{ $item->name }}</option>
            @endforeach

          </x-native-select>
        </div>
      </div>
      <div class="mt-4  border-t ">
        <h1 class="py-2 bg-gray-50">Inventory</h1>
        <div class="grid pt-2 grid-cols-2 border-t gap-4">
          <x-input label="Stock" wire:model="stock" />
          <x-input label="default serving" wire:model="default_serving" />
        </div>


      </div>
      <x-slot name="footer">
        <div class="flex justify-end gap-x-4">
          <x-button flat label="Cancel" x-on:click="close" />
          <x-button positive label="Update" wire:click="updateMenu" spinner="updateMenu"
            right-icon="arrow-narrow-right" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>
</div>
