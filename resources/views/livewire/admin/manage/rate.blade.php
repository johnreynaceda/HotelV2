<div>

  <div class="mt-5">

    <div class="">
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
      <div class="mt-5 flex flex-col">
        <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
          <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
            <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">
              <table class="min-w-full">
                <thead class="bg-gray-500">
                  <tr>
                    <th scope="col"
                      class=" w-64 py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-white sm:pl-6">

                    </th>
                    <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-white sm:pl-6">
                      STAYING HOUR
                    </th>
                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">AMOUNT</th>
                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">TYPE</th>
                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">STATUS</th>
                    <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                      <span class="sr-only">Edit</span>
                    </th>
                  </tr>
                </thead>
                <tbody class="bg-white">
                  @forelse ($types as $key => $type)
                    <tr class="border-y border-gray-200">
                      <th colspan="6" scope="colgroup"
                        class="bg-gray-50 px-4 py-2 text-left text-sm font-semibold uppercase text-gray-700 sm:px-6">
                        {{ $type->name }}
                      </th>
                    </tr>

                    @forelse ($type->rates as $rate)
                      <tr class="border-t border-gray-200">
                        <td class="whitespace-nowrap w-40 py-2 pl-4 pr-3 text-sm font-medium text-gray-700 sm:pl-6">

                        </td>
                        <td class="whitespace-nowrap py-2 pl-4 pr-3 text-sm font-medium text-gray-700 sm:pl-6">
                          {{ $rate->stayingHour->number }} HOURS</td>
                        </td>
                        <td class="whitespace-nowrap px-3 py-2 text-sm text-gray-700">
                          &#8369;{{ number_format($rate->amount, 2) }}</td>
                        <td class="whitespace-nowrap px-3 py-2 text-sm text-gray-700">{{ $rate->type->name }}</td>
                        <td class="whitespace-nowrap px-3 py-2 text-sm text-gray-700">
                          @switch($rate->is_available)
                            @case(1)
                              <x-button xs icon="users" positive label="Available" />
                            @break

                            @case(2)
                              <x-button xs icon="users" negative label="Unavailable" />
                            @break

                            @default
                          @endswitch
                        </td>
                        <td class="relative whitespace-nowrap py-2 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
                          <x-button icon="pencil-alt" spinner="editRate({{ $rate->id }})"
                            wire:click="editRate({{ $rate->id }})" label="Edit" xs />
                        </td>
                      </tr>
                      @empty
                        <td colspan="6" class="text-center py-2">
                          <span>No data available...</span>
                        </td>
                      @endforelse
                      @empty
                        <td colspan="6" class="text-center py-2">
                          <span>No data available...</span>
                        </td>
                      @endforelse

                      <!-- More people... -->
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
          <div class="flex flex-col space-y-2">
            <x-native-select label="Select Number of Hours" wire:model="hours_id">
              <option selected hidden>Select Number of Hours</option>
              @foreach ($stayingHours as $hour)
                <option value="{{ $hour->id }}">{{ $hour->number }} hours</option>
              @endforeach
            </x-native-select>
            <x-input wire:model.defer="amount" label="Amount" placeholder="" />

            <x-native-select label="Select Type" wire:model="type_id">
              <option selected hidden>Select Type</option>
              @foreach ($types as $type)
                <option value="{{ $type->id }}">{{ $type->name }} </option>
              @endforeach
            </x-native-select>
          </div>
          <x-slot name="footer">
            <div class="flex justify-end gap-x-2">
              <x-button flat label="Cancel" x-on:click="close" />
              <x-button spinner="saveRate" wire:click="saveRate" positive label="Save" />
            </div>
          </x-slot>
        </x-card>
      </x-modal>
      <x-modal wire:model.defer="edit_modal" max-width="lg">
        <x-card title="UpdateRate">
          <div class="flex flex-col space-y-2">
            <x-native-select label="Select Number of Hours" wire:model="hours_id">
              <option selected hidden>Select Number of Hours</option>
              @foreach ($stayingHours as $hour)
                <option value="{{ $hour->id }}">{{ $hour->number }} hours</option>
              @endforeach
            </x-native-select>
            <x-input wire:model.defer="amount" label="Amount" placeholder="" />

            <x-native-select label="Select Type" wire:model="type_id">
              <option selected hidden>Select Type</option>
              @foreach ($types as $type)
                <option value="{{ $type->id }}">{{ $type->name }} </option>
              @endforeach
            </x-native-select>
          </div>
          <x-slot name="footer">
            <div class="flex justify-end gap-x-2">
              <x-button flat label="Cancel" x-on:click="close" />
              <x-button spinner="saveRate" wire:click="updateRate" positive label="Update" />
            </div>
          </x-slot>
        </x-card>
      </x-modal>

    </div>
