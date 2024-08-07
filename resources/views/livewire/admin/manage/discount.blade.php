<div>
  <div class="mt-5">
    <div class="flex items-end">
      <div class="sm:flex-auto">
        <div class="search flex items-center rounded-lg  px-3 py-1 w-72 border border-gray-300 bg-white shadow-sm">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="fill-gray-500" width="24" height="24">
            <path fill="none" d="M0 0h24v24H0z" />
            <path
              d="M11 2c4.968 0 9 4.032 9 9s-4.032 9-9 9-9-4.032-9-9 4.032-9 9-9zm0 16c3.867 0 7-3.133 7-7 0-3.868-3.133-7-7-7-3.868 0-7 3.132-7 7 0 3.867 3.132 7 7 7zm8.485.071l2.829 2.828-1.415 1.415-2.828-2.829 1.414-1.414z" />
          </svg>
          <input type="text" wire:model="search"
            class="outline:none  h-8 focus:ring-0 flex-1 border-0 focus:border-0 rounded-md" placeholder="Search">
        </div>
      </div>
      <div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">
        <x-button wire:click="$set('add_modal', true)" icon="plus" blue label="Add New" />
      </div>
    </div>


    <div class="mt-3 flex flex-col">
      <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
          <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">
            <table class="min-w-full divide-y divide-gray-300">
              <thead class="bg-blue-500">
                <tr>
                  <th scope="col"
                    class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold uppercase text-white sm:pl-6">
                    Name</th>
                  <th scope="col"
                    class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold uppercase text-white sm:pl-6">
                    DESCRIPTION</th>
                  <th scope="col"
                    class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold uppercase text-white sm:pl-6">
                    AMOUNT</th>
                  <th scope="col"
                    class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold uppercase text-white sm:pl-6">
                    AVAILABLE</th>
                  <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                    <span class="sr-only">Edit</span>
                  </th>
                </tr>
              </thead>
              <tbody class="divide-y divide-gray-200 bg-white">
                @forelse ($discounts as $discount)
                  <tr>
                    <td class="whitespace-nowrap py-3 pl-4 pr-3 text-sm   text-gray-700 sm:pl-6">
                      {{ $discount->name }}</td>
                    <td class="whitespace-nowrap py-3 pl-4 pr-3 text-sm   text-gray-700 sm:pl-6">
                      {{ $discount->description }}</td>
                    <td class="whitespace-nowrap py-3 pl-4 pr-3 text-sm uppercase font-medium text-gray-700 sm:pl-6">
                      {{ $discount->is_percentage ? $discount->amount . '%' : '₱' . number_format($discount->amount, 2) }}
                    </td>
                    <td class="whitespace-nowrap py-3 pl-4 pr-3 text-sm uppercase font-medium text-gray-700 sm:pl-6">
                      @switch($discount->is_available)
                        @case(1)
                          <x-button icon="check" sm positive label="Available" />
                        @break

                        @case(0)
                          <x-button icon="times" sm label="Not Available" />
                        @break

                        @default
                      @endswitch

                    </td>
                    <td class="relative whitespace-nowrap py-3 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
                      <div class="flex space-x-2 justify-end">
                        <x-button icon="pencil-alt" wire:click="editDiscount({{ $discount->id }})"
                          spinner="editDiscount({{ $discount->id }})" label="Edit" xs />
                        <x-button wire:click="deleteDiscount({{ $discount->id }})"
                          spinner="deleteDiscount({{ $discount->id }})" icon="trash" label="Delete" xs />
                      </div>
                    </td>
                  </tr>
                  @empty
                    <td colspan="5" class="py-3 pl-4 pr-3 text-sm text-gray-700 sm:pl-6">
                      <span class="flex justify-center text-lg italic"> No data found</span>
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
          <x-textarea wire:model="description" label="Description" placeholder="" />
          <x-input wire:model.defer="amount" label="Amount" placeholder="" />
          <x-native-select label="Type" wire:model="type">
            <option selected hidden>Select Type</option>
            <option value="1">&#8369; (Peso)</option>
            <option value="2">% (Percentage)</option>

          </x-native-select>
        </div>
        <x-slot name="footer">
          <div class="flex justify-end gap-x-2">
            <x-button flat label="Cancel" x-on:click="close" />
            <x-button wire:click="saveDiscount" spinner="saveDiscount" positive label="Save" />
          </div>
        </x-slot>
      </x-card>
    </x-modal>

    <x-modal wire:model.defer="edit_modal" max-width="lg">
      <x-card title="Update Discount">
        <div class="flex flex-col space-y-3">
          <x-input wire:model.defer="name" label="Name" placeholder="" />
          <x-textarea wire:model="description" label="Description" placeholder="" />
          <x-input wire:model.defer="amount" label="Amount" placeholder="" />
          <x-native-select label="Type" wire:model="type">
            <option selected hidden>Select Type</option>
            <option value="1">&#8369; (Peso)</option>
            <option value="2">% (Percentage)</option>

          </x-native-select>
        </div>
        <x-slot name="footer">
          <div class="flex justify-end gap-x-2">
            <x-button flat label="Cancel" x-on:click="close" />
            <x-button wire:click="updateDiscount" spinner="updateDiscount" positive label="Update" />
          </div>
        </x-slot>
      </x-card>
    </x-modal>
  </div>
