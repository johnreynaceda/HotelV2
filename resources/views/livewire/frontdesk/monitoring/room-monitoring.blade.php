<div class="grid grid-cols-3 space-x-12" x-data="{ excess: @entangle('excess') }">
  <div class="col-span-2">
    <div class="flex space-x-4 items-center">
      <div class="search flex items-center rounded-lg  px-3 py-1 w-72 border border-gray-200 shadow-sm">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="fill-gray-500" width="24" height="24">
          <path fill="none" d="M0 0h24v24H0z" />
          <path
            d="M11 2c4.968 0 9 4.032 9 9s-4.032 9-9 9-9-4.032-9-9 4.032-9 9-9zm0 16c3.867 0 7-3.133 7-7 0-3.868-3.133-7-7-7-3.868 0-7 3.132-7 7 0 3.867 3.132 7 7 7zm8.485.071l2.829 2.828-1.415 1.415-2.828-2.829 1.414-1.414z" />
        </svg>
        <input type="text" wire:model="search" class="outline:none  h-8 focus:ring-0 flex-1 border-0 focus:border-0"
          placeholder="Search">
      </div>
      <x-native-select wire:model="filter_floor">
        <option selected hidden>Select Floors</option>
        @foreach ($floors as $floor)
          <option value="{{ $floor->id }}" class="uppercase">{{ $floor->numberWithFormat() }}</option>
        @endforeach
      </x-native-select>
      <x-native-select wire:model="filter_status">
        <option selected hidden>Select Status</option>
        <option value="Available">Available</option>
        <option value="Occupied">Occupied</option>
        <option value="Reserved">Reserved</option>
        <option value="Maintenance">Maintenance</option>
        <option value="Unavailable">Unavailable</option>
        <option value="Selected in Kiosk">Selected in Kiosk</option>
        <option value="Uncleaned">Uncleaned</option>
        <option value="Cleaning">Cleaning</option>
        <option value="Cleaned">Cleaned</option>
      </x-native-select>
    </div>
    <div class="mt-5 flex space-x-2">
      <x-badge class="font-normal" flat positive md label="Occupied" />
      <x-badge class="font-normal" dark flat md label="Reserved" />
      <x-badge class="font-normal" flat violet md label="Maintenance" />
      <x-badge class="font-normal" dark md label="Unavailable" />
      <x-badge class="font-normal" flat negative md label="Uncleaned" />
      <x-badge class="font-normal" flat red md label="Cleaning" />
      <x-badge class="font-normal" flat blue md label="Cleaned" />
    </div>
    <div class="overflow-hidden p-2 border mt-2 md:rounded-lg">
      {{-- <table class="min-w-full divide-y divide-gray-300">
        <thead class="bg-gray-50">
          <tr>
            <th scope="col"
              class="whitespace-nowrap py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">Room
              Number</th>
            <th scope="col" class="whitespace-nowrap px-2 py-3.5 text-left text-sm font-semibold text-gray-900">Floor
            </th> 
            <th scope="col" class="whitespace-nowrap px-2 py-3.5 text-left text-sm font-semibold text-gray-900">
              Status</th>
            <th scope="col" class="relative whitespace-nowrap py-3.5 pl-3 pr-4 sm:pr-6">
              <span class="sr-only">Edit</span>
            </th>
          </tr>
        </thead>
        <tbody class="divide-y divide-gray-200 bg-white">

          @forelse ($rooms as $room)
            <tr>
              <td class="whitespace-nowrap py-2 pl-4 pr-3 text-sm text-gray-500 sm:pl-6">{{ $room->number }}</td>
              <td class="whitespace-nowrap py-2 pl-4 pr-3 text-sm text-gray-500 sm:pl-6">{{ $room->floor->number }}</td>
              <td class="whitespace-nowrap py-2 pl-4 pr-3 text-sm text-gray-500 sm:pl-6">{{ $room->status }}</td>
            </tr>
          @empty
            <td colspan="3" class="text-center py-2">
              <span>No data available...</span>
            </td>
          @endforelse

          <!-- More transactions... -->
        </tbody>
      </table> --}}
      <table class="min-w-full divide-y border-separate border-spacing-y-1.5 divide-gray-300">
        <thead class="">
          <tr class="uppercase">
            <th scope="col" class="px-3 w-56 py-2 text-left text-sm font-semibold text-gray-800">ROOM</th>
            <th scope="col" class="px-3 w-72  py-2 text-left text-sm font-semibold text-gray-800">FLOOR</th>
            <th scope="col" class="px-3 py-2 text-left text-sm font-semibold text-gray-800"></th>
            <th scope="col" class="px-3 py-2 text-left text-sm font-semibold text-gray-800"></th>
            <th scope="col" class="px-3 py-2 text-left text-sm font-semibold text-gray-800"></th>
          </tr>
        </thead>
        <tbody class="divide-y divide-gray-200">
          @forelse ($rooms as $room)
            <tr class="rounded-md bg-gray-100">
              <td class="whitespace-nowrap rounded-l-lg py-3 pl-4  text-sm font-bold text-green-600 sm:pl-6">
                {{ $room->numberWithFormat() }}</td>
              <td class="whitespace-nowrap px-3 py-3 text-sm text-gray-500"> {{ $room->floor->numberWithFormat() }}</td>
              <td class="whitespace-nowrap px-3 py-3 text-sm text-gray-500">
                @switch($room->status)
                  @case('Occupied')
                    <x-badge class="font-normal" flat positive md label="Occupied" />
                  @break

                  @case('Reserved')
                    <x-badge class="font-normal" dark flat md label="Reserved" />
                  @break

                  @case('Maintenance')
                    <x-badge class="font-normal" dark flat md label="Maintenance" />
                  @break

                  @case('Unavailable')
                    <x-badge class="font-normal" dark flat md label="Unavailable" />
                  @break

                  @case('Uncleaned')
                    <x-badge class="font-normal" dark flat md label="Uncleaned" />
                  @break

                  @case('Cleaning')
                    <x-badge class="font-normal" dark flat md label="Cleaning" />
                  @break

                  @case('Cleaned')
                    <x-badge class="font-normal" dark flat md label="Cleaned" />
                  @break

                  @default
                @endswitch

              </td>
              <td class="whitespace-nowrap px-3 py-3 text-sm ">

                @php
                  $check_out_date = Carbon\Carbon::parse($room->checkInDetails->first()->check_out_at ?? null);
                @endphp

                @if ($room->status == 'Available')
                @else
                  <div class="flex space-x-1">
                    <h1>Time:</h1>
                    <div class="text-red-500">
                      <x-countdown :expires="$check_out_date">
                        <span x-text="timer.days">{{ $component->days() }}</span>d :
                        <span x-text="timer.hours">{{ $component->hours() }}</span>h :
                        <span x-text="timer.minutes">{{ $component->minutes() }}</span>m :
                        <span x-text="timer.seconds">{{ $component->seconds() }}</span>s
                      </x-countdown>
                    </div>
                  </div>
                @endif
              </td>

              <td class="whitespace-nowrap rounded-r-lg px-3 py-3 text-sm text-gray-500">
                @if ($room->status == 'Occupied')
                  <div class="flex space-x-2">
                    <x-button sm icon="eye" warning />
                    <x-button
                      href="{{ route('frontdesk.manage-guest', ['id' => $room->checkInDetails->first()->guest_id]) }}"
                      label="Manage" positive sm right-icon="arrow-narrow-right" />
                  </div>
                @endif
              </td>
            </tr>
            @empty
            @endforelse
          </tbody>
        </table>

      </div>
      <div class="mt-2">
        {{ $rooms->onEachSide(0)->links() }}
      </div>
    </div>
    <div class="col-span-1">
      <!-- wire:poll.1s  -->
      <div>
        <h1 class="mt-10 font-bold text-2xl text-gray-700">KIOSK TRANSACTIONS</h1>
      </div>
      <div class="search flex items-center rounded-lg  px-3 py-1 w-full border border-gray-200 shadow-sm">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="fill-gray-500" width="24" height="24">
          <path fill="none" d="M0 0h24v24H0z" />
          <path
            d="M11 2c4.968 0 9 4.032 9 9s-4.032 9-9 9-9-4.032-9-9 4.032-9 9-9zm0 16c3.867 0 7-3.133 7-7 0-3.868-3.133-7-7-7-3.868 0-7 3.132-7 7 0 3.867 3.132 7 7 7zm8.485.071l2.829 2.828-1.415 1.415-2.828-2.829 1.414-1.414z" />
        </svg>
        <input type="text" wire:model="search_kiosk"
          class="outline:none  h-8 focus:ring-0 flex-1 border-0 focus:border-0" placeholder="Search">
      </div>
      <div class="overflow-auto h-64 bg-white shadow sm:rounded-md mt-4">
        <ul role="list" class="divide-y divide-gray-200 " x-animate>
          @forelse($kiosks as $kiosk)
            <li x-animate class="transition duration-300 ease-in-out">
              <a wire:click="checkIn({{ $kiosk->id }})" href="#" class="block hover:bg-gray-50">
                <div class="flex items-center px-4 py-4 sm:px-6">
                  <div class="flex min-w-0 flex-1 items-center">
                    <!-- <div class="flex-shrink-0">
                                                              <img class="h-12 w-12 rounded-full"
                                                                src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                                                alt="">
                                                            </div> -->
                    <div class="min-w-0 flex-1 px-4 md:grid md:grid-cols-2 md:gap-4">
                      <div>
                        <p class="truncate text-sm font-medium text-indigo-600">{{ $kiosk->guest->name }}</p>
                        <p class="mt-2 flex items-center text-sm text-gray-500">
                          <svg class="mr-1.5 w-5 h-5" xmlns=" http://www.w3.org/2000/svg" fill="none"
                            viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round"
                              d="M20.25 8.511c.884.284 1.5 1.128 1.5 2.097v4.286c0 1.136-.847 2.1-1.98 2.193-.34.027-.68.052-1.02.072v3.091l-3-3c-1.354 0-2.694-.055-4.02-.163a2.115 2.115 0 01-.825-.242m9.345-8.334a2.126 2.126 0 00-.476-.095 48.64 48.64 0 00-8.048 0c-1.131.094-1.976 1.057-1.976 2.192v4.286c0 .837.46 1.58 1.155 1.951m9.345-8.334V6.637c0-1.621-1.152-3.026-2.76-3.235A48.455 48.455 0 0011.25 3c-2.115 0-4.198.137-6.24.402-1.608.209-2.76 1.614-2.76 3.235v6.226c0 1.621 1.152 3.026 2.76 3.235.577.075 1.157.14 1.74.194V21l4.155-4.155" />
                          </svg>

                          <span class="truncate">09{{ $kiosk->guest->contact }}</span>
                        </p>
                      </div>
                      <div class="hidden md:block">
                        <div>
                          <p class="text-sm text-gray-900">
                            <time datetime="{{ \Carbon\Carbon::parse($kiosk->created_at)->format('F d, Y g:iA') }}">
                              {{ \Carbon\Carbon::parse($kiosk->created_at)->format('F d, Y g:iA') }}
                            </time>
                          </p>

                          <p class="mt-2 flex items-center text-sm text-gray-500">
                            <!-- Heroicon name: mini/check-circle -->
                            <svg class="mr-1.5 w-5 h-5 flex-shrink-0" xmlns="http://www.w3.org/2000/svg" fill="none"
                              viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                              <path stroke-linecap="round" stroke-linejoin="round"
                                d="M3.75 4.875c0-.621.504-1.125 1.125-1.125h4.5c.621 0 1.125.504 1.125 1.125v4.5c0 .621-.504 1.125-1.125 1.125h-4.5A1.125 1.125 0 013.75 9.375v-4.5zM3.75 14.625c0-.621.504-1.125 1.125-1.125h4.5c.621 0 1.125.504 1.125 1.125v4.5c0 .621-.504 1.125-1.125 1.125h-4.5a1.125 1.125 0 01-1.125-1.125v-4.5zM13.5 4.875c0-.621.504-1.125 1.125-1.125h4.5c.621 0 1.125.504 1.125 1.125v4.5c0 .621-.504 1.125-1.125 1.125h-4.5A1.125 1.125 0 0113.5 9.375v-4.5z" />
                              <path stroke-linecap="round" stroke-linejoin="round"
                                d="M6.75 6.75h.75v.75h-.75v-.75zM6.75 16.5h.75v.75h-.75v-.75zM16.5 6.75h.75v.75h-.75v-.75zM13.5 13.5h.75v.75h-.75v-.75zM13.5 19.5h.75v.75h-.75v-.75zM19.5 13.5h.75v.75h-.75v-.75zM19.5 19.5h.75v.75h-.75v-.75zM16.5 16.5h.75v.75h-.75v-.75z" />
                            </svg>
                            {{ $kiosk->guest->qr_code }}
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div>

                  </div>
                </div>
              </a>
            </li>
          @empty
            <div class="flex justify-center items-center mt-20 text-gray-600 text-4xl">
              <span>No Data Found</span>
            </div>
          @endforelse

        </ul>
      </div>

    </div>

    <x-modal.card title="Check In Information" blur wire:model.defer="checkInModal">
      @if ($temporary_checkIn != null)
        <div class="col-span-1 sm:col-span-2">
          <x-input disabled label="QR Code" value="{{ $temporary_checkIn->guest->qr_code }}" />
        </div>
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mt-2">
          <x-input disabled label="Name" value="{{ $temporary_checkIn->guest->name }}" />
          <x-input disabled label="Contact Number" value="09{{ $temporary_checkIn->guest->contact }}" />
          <x-input disabled label="Room Number" value="{{ $temporary_checkIn->room->number }}" />
          @if ($temporary_checkIn->guest->is_long_stay)
            <x-input disabled label="Days" value="{{ $temporary_checkIn->guest->number_of_days }}" />
          @else
            <x-input disabled label="Hours" value="{{ $stayingHour->number }}" />
          @endif
        </div>
        <div class="bg-gray-200 mt-2 p-4 rounded-md border border-dashed border-gray-500">
          <div class="text-lg font-medium mb-2">Billing Statement</div>
          <div class="grid grid-cols-2 gap-4">
            <div class="col-span-1 my-auto">
              <div class="text-sm font-medium mb-1">Room Rate:</div>
            </div>
            <div class="col-span-1">
              <x-input class="text-right" disabled value="{{ $temporary_checkIn->guest->static_amount }}" />
            </div>
            <div class="col-span-1 my-auto">
              <div class="text-sm font-medium mb-1">Additional Charges:</div>
            </div>
            <div class="col-span-1">
              <x-input class="text-right" disabled value="{{ $additional_charges }}" />
            </div>
            <div class="col-span-1 my-auto">
              <div class="text-sm font-medium mb-1">Total:</div>
            </div>
            <div class="col-span-1">
              <x-input class="text-right" disabled value="{{ $total }}" />
            </div>
            <div class="col-span-1 my-auto">
              <div class="text-sm font-medium mb-1">Amount Paid:</div>
            </div>
            <div class="col-span-1">
              <x-input wire:model="amountPaid" type="number" placeholder="0.00" class="text-right pr-0" />
            </div>

            <div class="col-span-1 my-auto" x-show="excess" x-collapse>
              <div class="text-sm font-medium mb-1">Excess Amount:</div>
            </div>
            <div class="col-span-1" x-show="excess" x-collapse>
              <x-input wire:model="excess_amount" disabled type="number" class="text-right" />
              <x-checkbox id="right-label" label="Save excess as deposit" wire:model.defer="save_excess"
                class="mx-2 mt-2" />
            </div>

          </div>
        </div>
      @else
        <span>No data found</span>
      @endif
      <x-slot name="footer">
        <div class="flex justify-end gap-x-4">
          <div class="flex space-x-2">
            <x-button default label="Cancel" x-on:click="close" />
            <x-button dark label="Save" wire:click="saveCheckInDetails" />
          </div>
        </div>
      </x-slot>
    </x-modal.card>
  </div>