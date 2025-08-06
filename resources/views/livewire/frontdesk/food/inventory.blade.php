<div>
    <div class="flex justify-between text-3xl text-gray-700 font-semibold">
        <div>
            Manage Inventory
        </div>
        <div>
            <a href="{{route('admin.food-inventory')}}">
            <x-button icon="arrow-left" slate label="Return" />
            </a>
        </div>
    </div>
    <div class="mt-5">
        {{-- <x-select label="Select Item from Menu" placeholder="Select one item" wire:model="selectedItem">
            @foreach ($category as $item)
            <x-select.option label="{{$item->name}}" value="{{$item->id}}" />
            @endforeach
            </x-select> --}}
            <div>
                <span class="text-2xl text-[#009ff4]">{{$record->name}}</span>
            </div>
            <div class="mt-4">
                <div class="px-4 sm:px-6 lg:px-8">
                    <div class="mt-8 flow-root">
                      <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                        <div class="inline-block min-w-full py-2 align-middle">
                          @if ($selectedItem != null || $menus != null)
                            <table class="min-w-full divide-y divide-gray-300">
                                <thead>
                                  <tr>
                                    <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6 lg:pl-8">Name</th>
                                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Price</th>
                                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Quantity (Number of Servings)</th>
                                    <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6 lg:pr-8">
                                      <span class="sr-only">Edit</span>
                                    </th>
                                  </tr>
                                </thead>
                                <tbody class="divide-y divide-gray-200 bg-white">
                                  @forelse ($menus as $item)
                                  <tr>
                                    <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-6 lg:pl-8">{{$item->name}}</td>
                                    <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">₱ {{number_format($item->price, 2)}}</td>
                                    <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-6 lg:pl-8">{{$item->frontdeskInventory === null ? '0' : $item->frontdeskInventory->number_of_serving}}</td>
                                    {{-- <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                        <input type="number" name="quantity" wire:model="quantities.{{ $loop->index }}" class="w-20 rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50">
                                    </td> --}}
                                    <td class="relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6 lg:pr-8">
                                        <button wire:click="addStock({{$item->id}})" class="text-indigo-600 hover:text-indigo-900">Add Stock<span class="sr-only">, Lindsay Walton</span></button>
                                      </td>
                                    {{-- <td class="relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6 lg:pr-8">
                                      <a href="#" class="text-red-600 hover:text-red-900">Remove<span class="sr-only">, Lindsay Walton</span></a>
                                    </td> --}}
                                  </tr>
                                  @empty
                                  <span class="text-center italic text-lg text-gray-700">No Record Yet</span>
                                  @endforelse
                                  <!-- More people... -->
                                </tbody>
                              </table>

                            {{-- <x-button emerald label="Save" wire:click="saveStock"/> --}}
                          @else
                            <span class="text-center italic text-lg text-gray-700">No Record Yet</span>
                          @endif
                        </div>
                      </div>

                      <x-modal wire:model.defer="add_stock_modal" max-width="xl">
                        <x-card title="Add Stock">
                          <div class="grid grid-cols-2 gap-4">
                            <x-input label="Name" wire:model="menu_name" disabled />
                            <x-input label="Price" wire:model="menu_price" disabled />
                          </div>
                          <div class="grid grid-cols-1 mt-4">
                            <x-inputs.maskable mask="####" label="Quantity" wire:model.defer="menu_quantity" numeric />
                          </div>
                          <x-slot name="footer">
                            <div class="flex justify-end gap-x-4">
                              <x-button flat label="Cancel" x-on:click="close" />
                              <x-button positive label="Save" wire:click="saveStock" spinner="saveStock" right-icon="arrow-narrow-right" />
                            </div>
                          </x-slot>
                        </x-card>
                      </x-modal>
                    </div>
                  </div>

            </div>
    </div>
</div>
