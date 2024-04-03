<div>
    <div class="px-4 sm:px-6 lg:px-8">
        <div class="sm:flex sm:items-center">
          <div class="sm:flex-auto">
            <h1 class="text-base font-semibold leading-6 text-gray-900">Guests</h1>
            <p class="mt-2 text-sm text-gray-700">Here is the list of all guests.</p>
          </div>
          {{-- <div class="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
            <button type="button" class="block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Add user</button>
          </div> --}}
        </div>
        <div class="mt-8 flow-root">
          <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
              <table class="min-w-full divide-y divide-gray-300">
                <thead>
                  <tr>
                    <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-3">Name</th>
                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Contact Number</th>
                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Floor</th>
                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Room</th>
                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Rate</th>
                    <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-3">
                      <span class="sr-only">Edit</span>
                    </th>
                  </tr>
                </thead>
                <tbody class="bg-white">
                    @forelse ($guests as $item)
                    <tr class="even:bg-gray-50">
                        <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-3">{{$item->name}}</td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{{$item->contact}}</td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{{$item->room->floor->numberWithFormat()}}</td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{{$item->room->numberWithFormat()}}</td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{{$item->rates->stayingHour->number}} Hours</td>
                        <td class="relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-3">
                          <button wire:click="addTransaction({{$item->id}})" class="text-indigo-600 hover:text-indigo-900">Add Transaction<span class="sr-only">, Lindsay Walton</span></button>
                        </td>
                      </tr>
                    @empty
                    <span class="text-center italic text-lg text-gray-700">No Guest Yet</span>
                    @endforelse


                  <!-- More people... -->
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <x-modal wire:model.defer="food_beverages_modal" align="center">
        <x-card>
          <div>
            <div class="header flex space-x-1 border-b items-end justify-between py-0.5">
              <h2 class="text-lg uppercase text-gray-600 font-bold">Food and Beverages</h2>
              <x-button.circle icon="plus" xs positive />
            </div>
            <div class="mt-3">
              <div class="space-y-4">
                <x-native-select label="Item" wire:model="food_id">
                  <option>Select Item</option>
                  @forelse($foods as $food)
                    <option value="{{ $food->id }}">{{ $food->name }}</option>
                  @empty
                    <option>No Items Yet</option>
                  @endforelse
                </x-native-select>
                <x-input label="Price" disabled type="number" min="0" placeholder=""
                  wire:model="food_price" />
                <x-input label="Quantity" type="number" min="1" value="1" placeholder=""
                  wire:model="food_quantity" />

                <dl class="mt-8 bg-gray-300 rounded-md p-2 divide-y divide-gray-400 text-sm lg:col-span-5 lg:mt-0">
                  <div class="flex items-center justify-between pb-4">
                    <dt class="text-gray-600">Subtotal</dt>
                    <dd class="font-medium text-gray-800">₱ {{ number_format($food_price, 2, '.', ',') }}</dd>
                  </div>
                  <div class="flex items-center justify-between pt-4">
                    <dt class="font-medium text-lg text-gray-800">Total Payable Amount</dt>
                    <dd class="font-medium text-lg text-gray-900">₱ {{ number_format($food_total_amount, 2, '.', ',') }}
                    </dd>
                  </div>
                </dl>
              </div>
            </div>
          </div>

          <x-slot name="footer">
            <div class="flex justify-end gap-x-2">
              <x-button flat negative label="Cancel" wire:click="closeModal" />
              <x-button positive label="Save" wire:click="addFood" right-icon="arrow-narrow-right" />
            </div>
          </x-slot>
        </x-card>
      </x-modal>

</div>
