<div>
  <div class=" lg:grid  lg:grid-cols-12 lg:gap-8 w-full ">
    <div class="hidden lg:col-span-3 lg:block xl:col-span-2">
      <nav aria-label="Sidebar" class="sticky top-[8.5rem] divide-y divide-gray-300">
        <nav class="flex flex-col space-y-2">
          <x-button label="Transfer Room" md slate right-icon="external-link" wire:click=" $set('transfer_modal', true)" />
          <x-button label="Extend" md slate right-icon="external-link" wire:click=" $set('extend_modal', true)" />
          <x-button label="Damage Charges" md slate right-icon="external-link"
            wire:click=" $set('damage_modal', true)" />
          <x-button label="Amenities" md slate right-icon="external-link" wire:click=" $set('amenities_modal', true)" />
          <x-button label="Food and Beverages" md slate right-icon="external-link"
            wire:click=" $set('food_beverages_modal', true)" />
          <x-button label="Deposits" md slate right-icon="external-link" wire:click=" $set('deposit_modal', true)" />
        </nav>
        <div class="mt-3">
          <div class="border shadow-md mt-20 rounded-lg">
            <li class="flex py-2 px-2">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="h-10 w-10 fill-green-600">
                <path fill="none" d="M0 0h24v24H0z" />
                <path d="M5 20h14v2H5v-2zm7-2a8 8 0 1 1 0-16 8 8 0 0 1 0 16z" />
              </svg>
              <div class="ml-2">
                <div class="flex space-x-1">
                <p class="text-sm font-medium text-gray-900 uppercase">{{ $guest->name }}</p>
                <p class="text-sm text-gray-900 ">(09{{ $guest->contact }})</p>
                </div>
                <div class="flex space-x-1 items-center fill-gray-600 text-gray-600">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="h-5 w-5">
                    <path fill="none" d="M0 0h24v24H0z" />
                    <path
                      d="M16 17v-1h-3v-3h3v2h2v2h-1v2h-2v2h-2v-3h2v-1h1zm5 4h-4v-2h2v-2h2v4zM3 3h8v8H3V3zm2 2v4h4V5H5zm8-2h8v8h-8V3zm2 2v4h4V5h-4zM3 13h8v8H3v-8zm2 2v4h4v-4H5zm13-2h3v2h-3v-2zM6 6h2v2H6V6zm0 10h2v2H6v-2zM16 6h2v2h-2V6z" />
                  </svg>
                  <span class="text-sm">{{ $guest->qr_code }}</span>
                </div>
              </div>
            </li>
          </div>
          <div class="bg-gradient-to-br shadow-md from-gray-300 via-gray-200 to-gray-100 mt-2 rounded-lg p-3">
            <div class="header">
              <h3 class="text-lg font-bold text-gray-700 uppercase">Check-In Details</h3>

              <div class="mt-2 border-b border-gray-300">
                <h1 class="text-xs text-gray-500">Room Number</h1>
                <h1 class="font-bold text-gray-700">ROOM #{{ $guest->room->number }}</h1>
              </div>
              <div class="mt-2 border-b border-gray-300">
                <h1 class="text-xs text-gray-500">Initial Check In Hour</h1>
                <h1 class="font-bold text-gray-700">{{ $guest->rates->stayingHour->number }} Hours</h1>
              </div>
              <div class="mt-2 border-b border-gray-300">
                <h1 class="text-xs text-gray-500">Time Remaining</h1>
                <h1 class="font-bold text-gray-700">
                  @php
                    $check_out_date = Carbon\Carbon::parse($guest->checkinDetail->check_out_at ?? null);
                    
                  @endphp
                  <x-countdown :expires="$check_out_date" class="text-red-600">
                    <span x-text="timer.days">{{ $component->days() }}</span>d :
                    <span x-text="timer.hours">{{ $component->hours() }}</span>h :
                    <span x-text="timer.minutes">{{ $component->minutes() }}</span>m :
                    <span x-text="timer.seconds">{{ $component->seconds() }}</span>s
                  </x-countdown>

                </h1>
              </div>
              <div class="mt-2 border-b border-gray-300">
                <h1 class="text-xs text-gray-500">Check In Date</h1>
                <h1 class="font-medium text-gray-700">
                  {{ Carbon\Carbon::parse($guest->checkinDetail->check_in_at)->format('F d, Y h:i A') }}</h1>
              </div>
              <div class="mt-2 border-b border-gray-300">
                <h1 class="text-xs text-gray-500">Expected Check Out Date</h1>
                <h1 class="font-medium text-gray-700">
                  {{ Carbon\Carbon::parse($guest->checkinDetail->check_out_at)->format('F d, Y h:i A') }}</h1>
              </div>
            </div>
          </div>
        </div>
      </nav>
    </div>
    <main class="lg:col-span-9 xl:col-span-7">
      <div class="border rounded-lg p-4">
        <div class="lg:flex lg:items-center lg:justify-between border-b">
          <div class="min-w-0 flex-1">
            <h2 class="text-2xl font-bold leading-7 text-gray-900 sm:truncate sm:text-3xl sm:tracking-tight">GUEST
              TRANSACTIONS</h2>
            <div class="my-1 flex flex-col sm:mt-0 sm:flex-row sm:flex-wrap sm:space-x-6">
              <div class="mt-2 flex items-center text-sm text-gray-500">
                @if ($transaction->where('description', 'Transfer Room')->count() > 0)
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="h-5 fill-green-600">
                    <path fill="none" d="M0 0h24v24H0z" />
                    <path
                      d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-.997-6l7.07-7.071-1.414-1.414-5.656 5.657-2.829-2.829-1.414 1.414L11.003 16z" />
                  </svg>
                  <span class="ml-1">Transfer Room</span>
                @else
                  <!-- Heroicon name: mini/briefcase -->
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="h-5 fill-gray-500">
                    <path fill="none" d="M0 0h24v24H0z" />
                    <path
                      d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm0-2a8 8 0 1 0 0-16 8 8 0 0 0 0 16z" />
                  </svg>
                  <span class="ml-1">Transfer Room</span>
                @endif
              </div>
              <div class="mt-2 flex items-center text-sm text-gray-500">
                @if ($transaction->where('description', 'Extend')->count() > 0)
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="h-5 fill-green-600">
                    <path fill="none" d="M0 0h24v24H0z" />
                    <path
                      d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-.997-6l7.07-7.071-1.414-1.414-5.656 5.657-2.829-2.829-1.414 1.414L11.003 16z" />
                  </svg>
                  <span class="ml-1">Extend</span>
                @else
                  <!-- Heroicon name: mini/briefcase -->
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="h-5 fill-gray-500">
                    <path fill="none" d="M0 0h24v24H0z" />
                    <path
                      d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm0-2a8 8 0 1 0 0-16 8 8 0 0 0 0 16z" />
                  </svg>
                  <span class="ml-1">Extend</span>
                @endif
              </div>
              <div class="mt-2 flex items-center text-sm text-gray-500">
                @if ($transaction->where('description', 'Damage Charges')->count() > 0)
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="h-5 fill-green-600">
                    <path fill="none" d="M0 0h24v24H0z" />
                    <path
                      d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-.997-6l7.07-7.071-1.414-1.414-5.656 5.657-2.829-2.829-1.414 1.414L11.003 16z" />
                  </svg>
                  <span class="ml-1">Damage Charges</span>
                @else
                  <!-- Heroicon name: mini/briefcase -->
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="h-5 fill-gray-500">
                    <path fill="none" d="M0 0h24v24H0z" />
                    <path
                      d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm0-2a8 8 0 1 0 0-16 8 8 0 0 0 0 16z" />
                  </svg>
                  <span class="ml-1">Damage Charges</span>
                @endif
              </div>
              <div class="mt-2 flex items-center text-sm text-gray-500">
                @if ($transaction->where('description', 'Amenities')->count() > 0)
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="h-5 fill-green-600">
                    <path fill="none" d="M0 0h24v24H0z" />
                    <path
                      d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-.997-6l7.07-7.071-1.414-1.414-5.656 5.657-2.829-2.829-1.414 1.414L11.003 16z" />
                  </svg>
                  <span class="ml-1">Amenities</span>
                @else
                  <!-- Heroicon name: mini/briefcase -->
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="h-5 fill-gray-500">
                    <path fill="none" d="M0 0h24v24H0z" />
                    <path
                      d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm0-2a8 8 0 1 0 0-16 8 8 0 0 0 0 16z" />
                  </svg>
                  <span class="ml-1">Amenities</span>
                @endif
              </div>
              <div class="mt-2 flex items-center text-sm text-gray-500">
                @if ($transaction->where('description', 'Food and Beverages')->count() > 0)
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="h-5 fill-green-600">
                    <path fill="none" d="M0 0h24v24H0z" />
                    <path
                      d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-.997-6l7.07-7.071-1.414-1.414-5.656 5.657-2.829-2.829-1.414 1.414L11.003 16z" />
                  </svg>
                  <span class="ml-1">Food and Beverages</span>
                @else
                  <!-- Heroicon name: mini/briefcase -->
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="h-5 fill-gray-500">
                    <path fill="none" d="M0 0h24v24H0z" />
                    <path
                      d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm0-2a8 8 0 1 0 0-16 8 8 0 0 0 0 16z" />
                  </svg>
                  <span class="ml-1">Food and Beverages</span>
                @endif
              </div>
              <div class="mt-2 flex items-center text-sm text-gray-500">
                @if ($transaction->where('description', 'Deposit')->count() > 0)
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="h-5 fill-green-600">
                    <path fill="none" d="M0 0h24v24H0z" />
                    <path
                      d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-.997-6l7.07-7.071-1.414-1.414-5.656 5.657-2.829-2.829-1.414 1.414L11.003 16z" />
                  </svg>
                  <span class="ml-1">Deposits</span>
                @else
                  <!-- Heroicon name: mini/briefcase -->
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="h-5 fill-gray-500">
                    <path fill="none" d="M0 0h24v24H0z" />
                    <path
                      d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm0-2a8 8 0 1 0 0-16 8 8 0 0 0 0 16z" />
                  </svg>
                  <span class="ml-1">Deposits</span>
                @endif
              </div>
            </div>
          </div>
        </div>
        <div class="mt-5">
          <div class="px-4 sm:px-6 lg:px-8">

            <div class="mt flex flex-col">
              <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
                <div class="inline-block min-w-full py-2 align-middle ">
                  <div class="overflow-hidden shadow ">
                    <table class="min-w-full">
                      <thead class="bg-gray-500">
                        <tr>
                          <th scope="col"
                            class="py-3.5 pl-4 pr-3 text-left w-40 text-sm font-semibold text-white sm:pl-6">
                          </th>

                          <th scope="col" class="px-3 py-3.5 w-96 text-left text-sm font-semibold text-white">
                            DETAILS
                          </th>
                          <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">
                            AMOUNT
                          </th>
                          <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">
                            TRANSACTION DATE
                          </th>
                          <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">
                            PAID AT
                          </th>
                        </tr>
                      </thead>
                      @forelse($transactions as $transaction)
                        <tbody class="bg-white">
                          <tr class="border-t border-gray-200">
                            <th colspan="5" scope="colgroup"
                              class="bg-gray-100 px-4 py-2 text-left text-sm font-semibold text-green-600 uppercase sm:px-6">
                              {{ $transaction->description }}
                            </th>
                          </tr>

                          <tr class="border-t border-gray-300">
                            <td class="whitespace-nowrap py-2 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-6">
                            </td>
                            <td class=" px-3 py-2 text-sm text-gray-600 ">
                              <p> {{ $transaction->remarks }}</p>
                            </td>
                            <td class="whitespace-nowrap px-3 py-2 text-sm text-gray-600 ">
                              ₱ {{ number_format($transaction->payable_amount, 2, '.', ',') }}
                            </td>
                            <td class="whitespace-nowrap px-3 py-2 text-sm text-gray-600 ">
                              {{ Carbon\Carbon::parse($transaction->created_at)->format('F d, Y h:i A') }}
                            </td>
                            <td class="whitespace-nowrap px-3 py-2 text-sm text-gray-600 ">
                              {{ Carbon\Carbon::parse($transaction->paid_at)->format('F d, Y h:i A') }}
                            </td>
                          @empty
                            <td class="whitespace-nowrap px-3 py-2 colspan-5 text-sm text-gray-600 ">
                              NO DATA
                            </td>
                          </tr>
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
      <div class="mt-2 flex justify-end space-x-2">
        <x-button label="Back" icon="reply" negative href="{{ route('frontdesk.room-monitoring') }}" />
        <x-button label="Check Out" right-icon="arrow-right" positive />
      </div>
    </main>
    <aside class="hidden xl:col-span-3 xl:block">
      <div class="sticky top-[8.5rem] space-y-4">
        <div class="border rounded-lg p-5">
          <div class="flex space-x-1 items-center">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="h-5 w-5 fill-gray-600">
              <path fill="none" d="M0 0h24v24H0z" />
              <path
                d="M19 22H5a3 3 0 0 1-3-3V3a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v12h4v4a3 3 0 0 1-3 3zm-1-5v2a1 1 0 0 0 2 0v-2h-2zM6 7v2h8V7H6zm0 4v2h8v-2H6zm0 4v2h5v-2H6z" />
            </svg>
            <span class="font-bold text-gray-600  text-lg">BILL SUMMARY REPORT</span>
          </div>
          <div class="mt-3">
            <dl class="mt-8 divide-y divide-gray-200 text-sm lg:col-span-5 lg:mt-0">
              <div class="flex items-center justify-between pb-4">
                <dt class="text-gray-600">Subtotal</dt>
                <dd class="font-medium text-gray-900">$72</dd>
              </div>
              <div class="flex items-center justify-between py-4">
                <dt class="text-gray-600">Shipping</dt>
                <dd class="font-medium text-gray-900">$5</dd>
              </div>
              <div class="flex items-center justify-between py-4">
                <dt class="text-gray-600">Tax</dt>
                <dd class="font-medium text-gray-900">$6.16</dd>
              </div>
              <div class="flex items-center justify-between pt-4">
                <dt class="font-medium text-gray-900">Order total</dt>
                <dd class="font-medium text-indigo-600">$83.16</dd>
              </div>
            </dl>
          </div>
        </div>
      </div>
    </aside>
  </div>

  <x-modal wire:model.defer="transfer_modal" align="center">
    <x-card>
      <div>
        <div class="header flex space-x-1 border-b items-end justify-between py-0.5">
          <h2 class="text-lg uppercase text-gray-600 font-bold">Transfer Room</h2>
          <x-button.circle icon="plus" xs positive />
        </div>
        <div class="mt-3">
          Content here
        </div>
      </div>

      <x-slot name="footer">
        <div class="flex justify-end gap-x-2">
          <x-button flat negative label="Cancel" x-on:click="close" />
          <x-button positive label="Save" right-icon="arrow-narrow-right" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>

  <x-modal wire:model.defer="deposit_modal" align="center">
    <x-card>
      <div>
        <div class="header flex space-x-1 border-b items-end justify-between py-0.5">
          <h2 class="text-lg uppercase text-gray-600 font-bold">Deposit</h2>
          <x-button.circle icon="plus" xs positive />
        </div>
        <div class="mt-3">
          Content here
        </div>
      </div>

      <x-slot name="footer">
        <div class="flex justify-end gap-x-2">
          <x-button flat negative label="Cancel" x-on:click="close" />
          <x-button positive label="Save" right-icon="arrow-narrow-right" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>

  <x-modal wire:model.defer="extend_modal" align="center">
    <x-card>
      <div>
        <div class="header flex space-x-1 border-b items-end justify-between py-0.5">
          <h2 class="text-lg uppercase text-gray-600 font-bold">Extend</h2>
          <x-button.circle icon="plus" xs positive />
        </div>
        <div class="mt-3">
          Content here
        </div>
      </div>

      <x-slot name="footer">
        <div class="flex justify-end gap-x-2">
          <x-button flat negative label="Cancel" x-on:click="close" />
          <x-button positive label="Save" right-icon="arrow-narrow-right" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>

  <x-modal wire:model.defer="damage_modal" align="center">
    <x-card>
      <div>
        <div class="header flex space-x-1 border-b items-end justify-between py-0.5">
          <h2 class="text-lg uppercase text-gray-600 font-bold">Damage Charges</h2>
          <x-button.circle icon="plus" xs positive />
        </div>
        <div class="mt-3">
          Content here
        </div>
      </div>

      <x-slot name="footer">
        <div class="flex justify-end gap-x-2">
          <x-button flat negative label="Cancel" x-on:click="close" />
          <x-button positive label="Save" right-icon="arrow-narrow-right" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>

  <x-modal wire:model.defer="amenities_modal" align="center">
    <x-card>
      <div>
        <div class="header flex space-x-1 border-b items-end justify-between py-0.5">
          <h2 class="text-lg uppercase text-gray-600 font-bold">Amenities</h2>
          <x-button.circle icon="plus" xs positive />
        </div>
        <div class="mt-3">
            <div class="space-y-4">
            <x-native-select label="Item" wire:model="item_id">
                <option>Select Item</option>
                @forelse($items as $item)
                <option value="{{$item->id}}">{{$item->name}}</option>
                @empty
                <option>No Items Yet</option>
                @endforelse
            </x-native-select>
            <x-input label="Quantity" type="number" min="1" value="1" placeholder="" wire:model="item_quantity" />
            <x-input label="Additional Amount" type="number" min="0" placeholder="" wire:model="additional_amount" />
            
            <dl class="mt-8 bg-gray-300 rounded-md p-2 divide-y divide-gray-400 text-sm lg:col-span-5 lg:mt-0">
              <div class="flex items-center justify-between pb-4">
                <dt class="text-gray-600">Subtotal</dt>
                <dd class="font-medium text-gray-800">₱ {{number_format($subtotal, 2, '.', ',');}}</dd>
              </div>
              <div class="flex items-center justify-between py-4">
                <dt class="text-gray-600">Additional Amount</dt>
                <dd class="font-medium text-gray-800">₱ {{$additional_amount == '' ? '0.00' : number_format($additional_amount, 2, '.', ',');}}</dd>
              </div>
              <div class="flex items-center justify-between pt-4">
                <dt class="font-medium text-lg text-gray-800">Total Payable Amount</dt>
                <dd class="font-medium text-lg text-gray-900">₱ {{number_format($total_amount, 2, '.', ',');}}</dd>
              </div>
            </dl>
             
            </div>
        </div>
      </div>

      <x-slot name="footer">
        <div class="flex justify-end gap-x-2">
          <x-button flat negative label="Cancel" x-on:click="close" />
          <x-button positive label="Save" wire:click="addAmenities" right-icon="arrow-narrow-right" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>

  <x-modal wire:model.defer="food_beverages_modal" align="center">
    <x-card>
      <div>
        <div class="header flex space-x-1 border-b items-end justify-between py-0.5">
          <h2 class="text-lg uppercase text-gray-600 font-bold">Food and Beverages</h2>
          <x-button.circle icon="plus" xs positive />
        </div>
        <div class="mt-3">
          Content here
        </div>
      </div>

      <x-slot name="footer">
        <div class="flex justify-end gap-x-2">
          <x-button flat negative label="Cancel" x-on:click="close" />
          <x-button positive label="Save" right-icon="arrow-narrow-right" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>
</div>