<div>
  <div class="mt-5">
    <div class="flex items-center justify-between  ">
      <div class="flex  space-x-2 items-center">
        <div class="search flex items-center rounded-lg  px-3 py-1 w-72 border border-gray-200 shadow-sm">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="fill-gray-500" width="24" height="24">
            <path fill="none" d="M0 0h24v24H0z" />
            <path
              d="M11 2c4.968 0 9 4.032 9 9s-4.032 9-9 9-9-4.032-9-9 4.032-9 9-9zm0 16c3.867 0 7-3.133 7-7 0-3.868-3.133-7-7-7-3.868 0-7 3.132-7 7 0 3.867 3.132 7 7 7zm8.485.071l2.829 2.828-1.415 1.415-2.828-2.829 1.414-1.414z" />
          </svg>
          <input type="text" wire:model="search"
            class="outline:none  h-8 focus:ring-0 flex-1 border-0 focus:border-0" placeholder="Search">
        </div>
        <div class="border-l flex space-x-2 items-center px-2">
          <svg class="w-7 h-7 text-gray-600" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
            stroke="none">
            <path
              d="M19,2H5A3,3,0,0,0,2,5V6.17a3,3,0,0,0,.25,1.2l0,.06a2.81,2.81,0,0,0,.59.86L9,14.41V21a1,1,0,0,0,.47.85A1,1,0,0,0,10,22a1,1,0,0,0,.45-.11l4-2A1,1,0,0,0,15,19V14.41l6.12-6.12a2.81,2.81,0,0,0,.59-.86l0-.06A3,3,0,0,0,22,6.17V5A3,3,0,0,0,19,2ZM13.29,13.29A1,1,0,0,0,13,14v4.38l-2,1V14a1,1,0,0,0-.29-.71L5.41,8H18.59ZM20,6H4V5A1,1,0,0,1,5,4H19a1,1,0,0,1,1,1Z">
            </path>
          </svg>
          <x-native-select wire:model="filter_status">
            <option selected hidden>Select Status</option>
            <option value="Available">Available</option>
            <option value="Occupied">Occupied</option>
            <option value="Reserved">Reserved</option>
            <option value="Maintenance">Maintenance</option>
            <option value="Unavailable">Unavailable</option>
            <option value="Selected in Kiok">Selected in Kiok</option>
            <option value="Uncleaned">Uncleaned</option>
            <option value="Cleaning">Cleaning</option>
            <option value="Cleaned">Cleaned</option>
          </x-native-select>

          <x-native-select wire:model="filter_floor">
            <option selected hidden>Select Floors</option>
            @foreach ($floors as $floor)
              <option value="{{ $floor->id }}" class="uppercase">{{ $floor->numberWithFormat() }}</option>
            @endforeach
          </x-native-select>
          <div wire:key="animate" x-animate>
            @if ($filter_floor || $filter_status)
              <x-button wire:click="clearFilter" negative icon="x" sm label="Clear Filter" />
            @endif
          </div>

        </div>
      </div>
      <div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">
        <x-button wire:click="$set('add_modal', true)" icon="plus" slate label="Add New" />
      </div>
    </div>

    <div class="mt-5 flex space-x-2">
      <x-badge class="font-normal" positive md label="Available" />
      <x-badge class="font-normal" flat positive md label="Occupied" />
      <x-badge class="font-normal" dark flat md label="Reserved" />
      <x-badge class="font-normal" flat violet md label="Maintenance" />
      <x-badge class="font-normal" dark md label="Unavailable" />
      <x-badge class="font-normal" flat warning md label="Selected in Kiok" />
      <x-badge class="font-normal" flat negative md label="Uncleaned" />
      <x-badge class="font-normal" flat red md label="Cleaning" />
      <x-badge class="font-normal" flat blue md label="Cleaned" />
    </div>

    <div class="mt-3">
      <div class="mt-5 flex flex-col">
        <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
          <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
            <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">
              <table class="min-w-full">
                <thead class="bg-gray-500">
                  <tr>

                    <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-white sm:pl-6">
                      NUMBER
                    </th>
                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">TYPE</th>
                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">STATUS</th>
                    <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">FLOOR</th>
                    <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                      <span class="sr-only">Edit</span>
                    </th>
                  </tr>
                </thead>
                <tbody class="bg-white">
                  @forelse ($rooms as $room)
                    <tr class="border-t border-gray-200">
                      <td class="whitespace-nowrap py-2 pl-4 pr-3 text-sm font-medium text-gray-700 sm:pl-6">
                        {{ $room->numberwithFormat() }}</td>
                      </td>
                      <td class="whitespace-nowrap px-3 py-2 text-sm text-gray-700 uppercase">{{ $room->type->name }}
                      </td>
                      <td class="whitespace-nowrap px-3 py-2 text-sm text-gray-700">
                        @switch($room->status)
                          @case('Available')
                            <x-badge class="font-normal" positive md label="Available" />
                          @break

                          @case('Occupied')
                            <x-badge class="font-normal" flat positive md label="Occupied" />
                          @break

                          @case('Reserved')
                            <x-badge class="font-normal" dark flat md label="Reserved" />
                          @break

                          @case('Maintenance')
                            <x-badge class="font-normal" flat violet md label="Maintenance" />
                          @break

                          @case('Unavailable')
                            <x-badge class="font-normal" dark md label="Unavailable" />
                          @break

                          @case('Selected in Kiok')
                            <x-badge class="font-normal" flat warning md label="Selected in Kiok" />
                          @break

                          @case('Uncleaned')
                            <x-badge class="font-normal" flat negative md label="Uncleaned" />
                          @break

                          @case('Cleaning')
                            <x-badge class="font-normal" flat red md label="Cleaning" />
                          @break

                          @case('Cleaned')
                            <x-badge class="font-normal" flat blue md label="Cleaned" />
                          @break

                          @default
                        @endswitch
                      </td>
                      <td class="whitespace-nowrap px-3 py-2 text-sm text-gray-700">
                        {{ $room->floor->numberWithFormat() }}
                      </td>
                      <td class="relative whitespace-nowrap py-2 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
                        <x-button icon="pencil-alt" spinner="editRoom({{ $room->id }})"
                          wire:click="editRoom({{ $room->id }})" label="Edit" xs />
                      </td>
                    </tr>
                    @empty
                    @endforelse
                  </tbody>
                </table>
              </div>
              <div class="mt-2">
                {{ $rooms->links() }}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <x-modal wire:model.defer="add_modal" max-width="lg">
      <x-card title="Add New">
        <div class="flex flex-col space-y-2">
          <x-input wire:model.defer="number" label="Room Number" placeholder="" />
          <x-native-select label="Type" wire:model="type">
            <option selected hidden>Select Type</option>
            @foreach ($types as $type)
              <option value="{{ $type->id }}" class="uppercase">{{ $type->name }}</option>
            @endforeach
          </x-native-select>
          <x-native-select label="Floor" wire:model="floor">
            <option selected hidden>Select Floors</option>
            @foreach ($floors as $floor)
              <option value="{{ $floor->id }}" class="uppercase">{{ $floor->numberWithFormat() }}</option>
            @endforeach
          </x-native-select>
          <x-native-select label="Status" wire:model="status">
            <option selected hidden>Select Room Status</option>
            <option value="Available">Available</option>
            <option value="Occupied">Occupied</option>
            <option value="Reserved">Reserved</option>
            <option value="Maintenance">Maintenance</option>
            <option value="Unavailable">Unavailable</option>
            <option value="Selected in Kiok">Selected in Kiok</option>
            <option value="Uncleaned">Uncleaned</option>
            <option value="Cleaning">Cleaning</option>
            <option value="Cleaned">Cleaned</option>
          </x-native-select>
          <x-textarea label="Description" placeholder="Leave black if none" />
        </div>
        <x-slot name="footer">
          <div class="flex justify-end gap-x-2">
            <x-button flat label="Cancel" x-on:click="close" />
            <x-button spinner="saveRoom" wire:click="saveRoom" positive label="Save" />
          </div>
        </x-slot>
      </x-card>
    </x-modal>
    <x-modal wire:model.defer="edit_modal" max-width="lg">
      <x-card title="Update Room">
        <div class="flex flex-col space-y-2">
          <x-input wire:model.defer="number" label="Room Number" placeholder="" />
          <x-native-select label="Type" wire:model="type">
            <option selected hidden>Select Type</option>
            @foreach ($types as $type)
              <option value="{{ $type->id }}" class="uppercase">{{ $type->name }}</option>
            @endforeach
          </x-native-select>
          <x-native-select label="Floor" wire:model="floor">
            <option selected hidden>Select Floors</option>
            @foreach ($floors as $floor)
              <option value="{{ $floor->id }}" class="uppercase">{{ $floor->numberWithFormat() }}</option>
            @endforeach
          </x-native-select>
          <x-native-select label="Status" wire:model="status">
            <option selected hidden>Select Room Status</option>
            <option value="Available">Available</option>
            <option value="Occupied">Occupied</option>
            <option value="Reserved">Reserved</option>
            <option value="Maintenance">Maintenance</option>
            <option value="Unavailable">Unavailable</option>
            <option value="Selected in Kiok">Selected in Kiok</option>
            <option value="Uncleaned">Uncleaned</option>
            <option value="Cleaning">Cleaning</option>
            <option value="Cleaned">Cleaned</option>
          </x-native-select>
          <x-textarea label="Description" placeholder="Leave black if none" />
        </div>
        <x-slot name="footer">
          <div class="flex justify-end gap-x-2">
            <x-button flat label="Cancel" x-on:click="close" />
            <x-button spinner="updateRoom" wire:click="updateRoom" positive label="Update" />
          </div>
        </x-slot>
      </x-card>
    </x-modal>
  </div>
