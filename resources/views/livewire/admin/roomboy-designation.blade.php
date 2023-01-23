<div>
  <div class="mt-5">
    <div>
      <div class="mt-6">
        <div class="px-4 sm:px-6 lg:px-8">
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
                          STATUS</th>
                        <th scope="col"
                          class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold uppercase text-white sm:pl-6">
                          CLEANING</th>
                        <th scope="col"
                          class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold uppercase text-white sm:pl-6">
                          FLOOR DESIGNATION</th>
                        <th scope="col"
                          class="py-3.5 pl-4 pr-3 text-right text-sm font-semibold uppercase text-white sm:pl-6">
                        </th>

                      </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200 bg-white">
                      @forelse ($roomboys as $roomboy)
                        <tr>
                          <td class="whitespace-nowrap py-3 pl-4 pr-3 text-sm   text-gray-700 sm:pl-6">
                            {{ $roomboy->name }}</td>
                          <td class="whitespace-nowrap py-3 pl-4 pr-3 text-sm   text-gray-700 sm:pl-6">
                            @if ($roomboy->roomboy_cleaning_room_id == null)
                              <x-badge label="Not Cleaning" red class="font-medium" />
                            @else
                              <x-badge label="Cleaning" flat positive />
                            @endif
                          </td>
                          <td class="whitespace-nowrap py-3 pl-4 pr-3 text-sm   text-gray-700 sm:pl-6">
                            @if ($roomboy->roomboy_cleaning_room_id == null)
                              <x-badge label="Not Cleaning" flat red class="font-normal" />
                            @else
                              <span>Currently Cleaning in
                                {{ App\Models\Room::where('id', $roomboy->roomboy_cleaning_room_id)->first()->numberWithFormat() }}</span>
                            @endif
                          </td>
                          <td class="whitespace-nowrap py-3 pl-4 pr-3 text-sm   text-gray-700 sm:pl-6">

                            @if ($roomboy->roomboy_assigned_floor_id == null)
                              <x-badge label="Not Assign" red class="font-medium" />
                            @else
                              <span>{{ App\Models\Floor::where('id', $roomboy->roomboy_assigned_floor_id)->first()->numberWithFormat() }}</span>
                            @endif
                          </td>
                          <td class="whitespace-nowrap py-3 pl-4 pr-3 text-sm   text-gray-700 sm:pl-6">
                            <div class="flex justify-end">
                              <x-button label="MANAGE DESIGNATION" wire:click="manageDesignation({{ $roomboy->id }})"
                                spinner="manageDesignation({{ $roomboy->id }})" sm dark
                                right-icon="arrow-narrow-right" />
                            </div>
                          </td>
                        </tr>
                      @empty
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
    <x-modal wire:model.defer="assign_modal" align="center" max-width="lg">
      <x-card title="Manage Designation">
        <div>
          <x-native-select label="Floor" wire:model="floor">
            <option selected hidden>Select Floor</option>
            @foreach ($floors as $floor)
              <option value="{{ $floor->id }}">{{ $floor->numberWithFormat() }}</option>
            @endforeach
          </x-native-select>
        </div>

        <x-slot name="footer">
          <div class="flex justify-end gap-x-4">
            <x-button flat label="Cancel" x-on:click="close" />
            <x-button positive label="Save" wire:click="saveDesignation" spinner="saveDesignation" />
          </div>
        </x-slot>
      </x-card>
    </x-modal>
  </div>
