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
      <x-badge class="font-normal" flat slate md label="Uncleaned" />
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
                {{ $room->numberWithFormat() }}
                <p class="text-sm text-gray-500 font-normal">{{$room->type->name}}</p>
              </td>
              <td class="whitespace-nowrap px-3 py-3 text-sm text-gray-500">
                {{ $room->floor->numberWithFormat() }}
             </td>
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

                @if ($room->status == 'Occupied')
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
                @if ($room->status == 'Occupied' && $room->checkInDetails != null)
                  <div class="flex space-x-2">
                    {{-- @dump($room->checkInDetails); --}}
                    <x-button wire:click="viewDetails({{ $room->checkInDetails->first()->guest_id }})" sm icon="eye"
                      warning />
                    <x-button
                      href="{{ route('frontdesk.manage-guest', ['id' => $room->checkInDetails->first()->guest_id]) }}"
                      label="Manage" class="hidden" positive sm right-icon="arrow-narrow-right" />
                    <x-button
                      href="{{ route('frontdesk.guest-transaction', ['id' => $room->checkInDetails->first()->guest_id]) }}"
                      label="Manage" positive sm right-icon="arrow-narrow-right" />
                  </div>
                @elseif($room->status == 'Reserved')
                <x-button
                label="Check-in" wire:click="checkInReserve({{ $room->id }})" positive sm right-icon="arrow-narrow-right" />
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
      <div wire:poll.1s>
        <h1 class="mt-2 font-bold text-2xl text-gray-700">CHECK-IN GUEST</h1>
      </div>
      {{-- <div class="mt-3 p-4 border rounded-lg">
        <div>
          <div class="header font-bold text-gray-700">GUEST INFORMATION</div>
          <div class="mt-2 grid grid-cols-2 gap-4">
            <x-input label="Guest Name" wire:model.defer="name" placeholder="" />
            <x-input right-icon="user" wire:model="contact_number" label="Contact Number" placeholder="09" />
          </div>
        </div>
        <div class="mt-5" x-animate>
          <div class="header font-bold text-green-700">CHECK-IN INFORMATION</div>
          <div class="mt-2 grid grid-cols-2 gap-4">
            <x-native-select label="Room Type" wire:model="type_id">
              <option hidden selected>Select Room Type</option>
              @foreach ($types as $type)
                <option value="{{ $type->id }}">{{ $type->name }}</option>
              @endforeach
            </x-native-select>
            <x-native-select label="Room " wire:model="room_id">
              <option hidden selected>Select Room </option>
              @foreach ($roomss as $room)
                <option value="{{ $room->id }}">{{ $room->numberWithFormat() }}</option>
              @endforeach
            </x-native-select>
            @if (!$is_longStay)
              <x-native-select label="Rate " wire:model="rate_id">
                <option hidden selected>Select Rate</option>
                @foreach ($ratess as $rate)
                  <option value="{{ $rate->id }}">
                    {{ $rate->stayingHour->number . ' Hours - ₱' . number_format($rate->amount, 2) }}</option>
                @endforeach
              </x-native-select>

            @endif
            <div class="flex items-end">
              <x-checkbox id="right-label" label="Long Stay" wire:model="is_longStay" />
            </div>
            @if ($is_longStay)
              <x-input label="Number of Days" placeholder="" />
            @endif
          </div>
        </div>
        <div class="mt-3 justify-end flex w-full">
          <x-button wire:click="checkInGuest" label="Check-In" positive />
        </div>
      </div> --}}


      <div class="overflow-auto h-64 bg-white shadow sm:rounded-md mt-4">
        <ul role="list" class="divide-y divide-gray-200 " x-animate>
          @forelse($kiosks as $kiosk)
            <li x-animate class="transition duration-300 ease-in-out">
              <a wire:click="checkIn({{ $kiosk->id }})" href="#" class="block hover:bg-red-50">
                <div class="flex items-center px-4 py-4 sm:px-6 bg-gray-50">
                  <div class="flex min-w-0 flex-1 items-center">

                    <div class="min-w-0 flex-1 px-4 md:grid md:grid-cols-2 md:gap-4">
                      <div class="flex items-center">
                        <p class="truncate text-sm font-medium text-indigo-600 uppercase">{{ $kiosk->guest->name }}
                          (ROOM #{{ $kiosk->guest->room->number }})
                        </p>
                      </div>
                      <div class="hidden md:block">
                        <div>
                          <p class="flex items-center text-sm text-gray-500">
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

      {{-- FOR RESERVATIONS --}}




    </div>

    <x-modal wire:model.defer="guest_details_modal" align="center">
      <x-card>
        <div>
          <div class="header flex space-x-1 border-b items-end justify-between py-0.5">
            <h2 class="text-lg uppercase text-gray-600 font-bold">Guest Details</h2>
          </div>
          <div class="mt-3">
            <div class="space-y-4">
              <dl class="mt-8 p-2 divide-y divide-gray-400 text-sm lg:col-span-5 lg:mt-0">
                @if ($guest_details)
                  <div class="flex items-center justify-between pb-4">
                    <dt class="text-gray-600">Name: </dt>
                    <dd class="font-medium uppercase text-gray-800">{{ $guest_details->name }}</dd>
                  </div>
                  <div class="flex items-center justify-between py-4">
                    <dt class="text-gray-600">Contact Number: </dt>
                    <dd class="font-medium text-gray-800">09{{ $guest_details->contact }}</dd>
                  </div>
                @endif
              </dl>
            </div>
          </div>
        </div>

        <x-slot name="footer">
          <div class="flex justify-end s gap-x-2">
            <x-button red label="Close" x-on:click="close" />
          </div>
        </x-slot>
      </x-card>
    </x-modal>

    <x-modal.card title="Check In Information" blur wire:model.defer="checkInModal">
      @if ($temporary_checkIn != null)
        <div class="col-span-1 sm:col-span-2">
          <x-input disabled label="QR Code" value="{{ $temporary_checkIn->guest->qr_code }}" />
        </div>
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mt-2">
          <x-input disabled label="Name" value="{{ $temporary_checkIn->guest->name }}" />
          <x-input disabled label="Contact Number"
            value="{{ $temporary_checkIn->guest->contact == 'N/A' ? 'N/A' : '09' . $temporary_checkIn->guest->contact }}" />
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

    <x-modal.card title="Check In Information" blur wire:model.defer="checkInReserveModal">
      @if ($temporary_reserve != null)
        <div class="col-span-1 sm:col-span-2">
          <x-input disabled label="QR Code" value="{{ $temporary_reserve->guest->qr_code }}" />
        </div>
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mt-2">
          <x-input disabled label="Name" value="{{ $temporary_reserve->guest->name }}" />
          <x-input disabled label="Contact Number"
            value="{{ $temporary_reserve->guest->contact == 'N/A' ? 'N/A' : '09' . $temporary_reserve->guest->contact }}" />
          <x-input disabled label="Room Number" value="{{ $temporary_reserve->room->number }}" />
          @if ($temporary_reserve->guest->is_long_stay)
            <x-input disabled label="Days" value="{{ $temporary_reserve->guest->number_of_days }}" />
          @else
            <x-input disabled label="Hours" value="{{ $stayingHour_reserve->number }}" />
          @endif
        </div>
        <div class="bg-gray-200 mt-2 p-4 rounded-md border border-dashed border-gray-500" x-animate>
          <div class="text-lg font-medium mb-2">Billing Statement</div>
          <div class="grid grid-cols-2 gap-4" x-animate>
            <div class="col-span-1 my-auto">
              <div class="text-sm font-medium mb-1">Room Rate:</div>
            </div>
            <div class="col-span-1">
              <x-input class="text-right" disabled value="{{ $temporary_reserve->guest->static_amount }}" />
            </div>
            <div class="col-span-1 my-auto">
              <div class="text-sm font-medium mb-1">Additional Charges:</div>
            </div>
            <div class="col-span-1">
              <x-input class="text-right" disabled value="{{ $additional_charges_reserve }}" />
            </div>
            <div class="col-span-1 my-auto">
              <div class="text-sm font-medium mb-1">Total:</div>
            </div>
            <div class="col-span-1">
              <x-input class="text-right" disabled value="{{ $total_reserve }}" />
            </div>
            <div class="col-span-1 my-auto">
              <div class="text-sm font-medium mb-1">Amount Paid:</div>
            </div>
            <div class="col-span-1">
              <x-input wire:model="amountPaid_reserve" type="number" placeholder="0.00" class="text-right pr-0" />
            </div>

            @if ($reserve_div)
              <div class="col-span-1 my-auto">
                <div class="text-sm font-medium mb-1">Excess Amount:</div>
              </div>
              <div class="col-span-1">
                <x-input wire:model="excess_amount_reserve" disabled type="number" class="text-right" />

              </div>
              <div class="col-span-1 flex justify-end">
              </div>
              <div class="col-span-1">
                <x-checkbox id="right-label" label="Save excess as deposit" wire:model.defer="save_excess_reserve" />
              </div>
            @endif
          </div>
        </div>
      @else
        <span>No data found</span>
      @endif
      <x-slot name="footer">
        <div class="flex justify-end gap-x-4">
          <div class="flex space-x-2">
            <x-button default label="Cancel" x-on:click="close" />
            <x-button dark label="Save" wire:click="saveReserveCheckInDetails" />
          </div>
        </div>
      </x-slot>
    </x-modal.card>

    <x-modal wire:model.defer="guestCheckInModal" align="center">
      <x-card title="CHECK-IN DETAILS">
        <div class="col-span-1 sm:col-span-2">
          <x-input disabled label="QR Code" value="{{ $checkInDetails['transaction_code'] ?? 'Null' }}" />
        </div>
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mt-2">
          <x-input disabled label="Name" value="{{ $checkInDetails['guest_name'] ?? 'Null' }}" />
          <x-input disabled label="Contact Number" value="{{ $checkInDetails['guest_contact_number'] ?? 'Null' }}" />
          <x-input disabled label="Room Number" value="{{ $checkInDetails['room'] ?? 'Null' }}" />

          @if ($is_longStay)
            <x-input disabled label="Days" value="" />
          @else
            <x-input disabled label="Hours" value="{{ $checkInDetails['rate'] ?? 'Null' }}" />
          @endif

        </div>
        <div class="bg-gray-100 mt-2 p-4 rounded-md border border-dashed border-gray-300">
          <div class="text-lg font-medium mb-2">Billing Statement</div>
          <div class="grid grid-cols-2 gap-4">
            <div class="col-span-1 my-auto">
              <div class="text-sm font-medium mb-1">Room Rate: </div>
            </div>
            <div class="col-span-1">
              <x-input class="text-right" disabled value="&#8369;{{ $checkInDetails['room_rate'] ?? 0 }}.00" />
            </div>
            <div class="col-span-1 my-auto">
              <div class="text-sm font-medium mb-1">Additional Charges:</div>
            </div>
            <div class="col-span-1">
              <x-input class="text-right" disabled value="&#8369;200.00" />
            </div>
            <div class="col-span-1 my-auto">
              <div class="text-sm font-medium mb-1">Total:</div>
            </div>
            <div class="col-span-1">
              <x-input class="text-right" disabled value="&#8369;{{ number_format($total, 2) }}" />
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
        <x-slot name="footer">
          <div class="flex justify-end gap-x-4">
            <x-button flat label="Cancel" x-on:click="close" />
            <x-button positive wire:click="storeGuest" spinner="storeGuest" label="Check-In Guest" />
          </div>
        </x-slot>
      </x-card>
    </x-modal>

  </div>
