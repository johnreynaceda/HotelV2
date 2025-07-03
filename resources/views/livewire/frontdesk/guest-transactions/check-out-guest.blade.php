<div class="p-6">
    <div class="flex justify-between items-center mb-3">
        <h2 class="text-2xl font-semibold text-gray-800">GUEST CHECK-OUT</h2>
          <x-button negative onclick="window.history.back();" label="Back" icon="arrow-left" />
        {{-- <button type="button" class="px-3 py-2 bg-red-500 text-gray-100 rounded hover:bg-gray-300 flex items-center gap-2" onclick="window.history.back();">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
            </svg>
            Back
        </button> --}}
    </div>
    @if(!$record->has_kiosk_check_out)
        <p class="text-gray-600 mb-4 italic">The guest must first check out at the kiosk.</p>
    @else
        <div>
            <div class="my-2 border-t border-gray-500 border-dashed"></div>
            <div class="mb-2">
                <strong class="text-gray-800">Guest Name:</strong> {{ $record->name }}
            </div>
            <div class="mb-2">
                <strong class="text-gray-800">Room Type:</strong> {{ $record->room->type->name }}
            </div>
            <div class="mb-2">
                <strong class="text-gray-800">Room #:</strong> {{ $record->room->number }}
            </div>
            <div class="mb-2">
                <strong class="text-gray-800">Check In Date:</strong> {{ Carbon\Carbon::parse($record->checkinDetail->check_in_at)->format('F d, Y h:i A') }}
            </div>
        </div>
        {{-- table for reminders --}}
        <div class="my-2 border-t border-gray-500 border-dashed"></div>
        <table class="w-full">
            <tbody>
                <tr class="border-b border-gray-200">
                    <td class="py-2 text-gray-700 border-r border-gray-200">
                        Room key and remote handed over by the guest / room boy
                    </td>
                    <td class="py-2 text-gray-700 border-r border-gray-200 px-2">
                        @if($hasConfirmedRoomKeyHandedOver)
                            <span class="font-normal italic {{ $roomKeyHandedOver === 'Yes' ? 'text-green-600' : 'text-red-600' }}">
                                {{ $roomKeyHandedOver }}
                            </span>
                        @endif
                    </td>
                    <td class="py-2">
                        @if(!$hasConfirmedRoomKeyHandedOver)
                        <div class="flex justify-end gap-4">
                            <x-button wire:click="hasHandedRemote('Yes')" emerald label="Yes" icon="check"/>
                            <x-button wire:click="hasHandedRemote('No')" negative label="No" icon="x"/>
                        </div>
                        @endif
                    </td>
                </tr>
                @if($hasConfirmedRoomKeyHandedOver)
                <tr class="border-b border-gray-200">
                    <td class="py-2 text-gray-700 border-r border-gray-200">Charges for damages -
                        <span class="font-semibold">
                            &#8369; {{ number_format($record->transactions()->where('transaction_type_id', 4)->sum('payable_amount'), 2) }}
                        </span>
                    </td>
                    <td class="py-2 text-gray-700 border-r border-gray-200">
                        @forelse($record->transactions()->where('transaction_type_id', 4)->get() as $transaction)
                            <div class="flex items-center justify-between px-2 @if(!$loop->last) border-b border-gray-200 pb-1 mb-1 @endif">
                                <span>
                                    {{ $transaction->remarks ?? 'Damage Charge' }} -  &#8369; {{ number_format($transaction->payable_amount, 2) }}
                                </span>
                                @if($transaction->paid_at === null)
                                {{-- Pay button --}}
                                <x-button emerald label="Pay" wire:click="payDamageCharge({{ $transaction->id }})" class="ml-2" xs/>
                                @else
                                {{-- Paid text --}}
                                <span class="text-green-600 font-semibold">Paid</span>
                                @endif
                            </div>
                        @empty
                            <div class="text-gray-500 italic">No damage charges recorded.</div>
                        @endforelse
                    </td>
                    <td class="py-2 text-right">
                        <x-button negative wire:click=" $set('damage_modal', true)" label="Damage Charges" icon="emoji-sad" />
                    </td>
                </tr>
                 <tr class="border-b border-gray-200">
                    <td class="py-2 text-gray-700 border-r border-gray-200">Claimable Deposit -
                        <span class="font-semibold">
                            &#8369; {{number_format($deposits->sum('deposit_amount'), 2)}}
                        </span>
                    </td>
                    <td class="py-2 text-gray-700 border-r border-gray-200 px-2">
                        @foreach($deposits as $transaction)
                            <div>
                                {{ $transaction->remarks ?? 'Deposit' }} -  &#8369; {{ number_format($transaction->deposit_amount, 2) }}
                            </div>
                        @endforeach
                    </td>
                    <td class="py-2 text-right">
                        <x-button wire:click="checkOutGuest" emerald label="Claim All" icon="cash"/>
                    </td>
                </tr>
                @endif
            </tbody>
        </table>
    @endif

    {{-- modal --}}

    <x-modal wire:model.defer="damage_modal" align="center">
    <x-card>
      <div>
        <div class="header flex space-x-1 border-b items-end justify-between py-0.5">
          <h2 class="text-lg uppercase text-gray-600 font-bold">Damage Charges</h2>
          <x-button.circle icon="plus" xs positive />
        </div>
        <div class="mt-3">
          <div class="space-y-4">
            <x-native-select label="Item" wire:model="item_id_damage">
              <option selected hidden>Select Item</option>
              @forelse($items as $item)
                <option value="{{ $item->id }}">{{ $item->name }}</option>
              @empty
                <option>No Items Yet</option>
              @endforelse
            </x-native-select>
            {{-- <x-input label="Additional Amount" type="number" min="0" placeholder=""
              wire:model="additional_amount_damage" disabled /> --}}

            <dl class="mt-8 bg-gray-300 rounded-md p-3 divide-y divide-gray-400 text-sm lg:col-span-5 lg:mt-0">
              <div class="flex items-center justify-between pb-4">
                <dt class="text-gray-600">Item Amount</dt>
                <dd class="font-medium text-gray-800">₱ {{ number_format($item_price_damage, 2, '.', ',') }}</dd>
              </div>
              {{-- <div class="flex items-center justify-between py-4">
                <dt class="text-gray-600">Additional Amount</dt>
                <dd class="font-medium text-gray-800">₱
                  {{ $additional_amount_damage == '' ? '0.00' : number_format($additional_amount_damage, 2, '.', ',') }}
                </dd>
              </div> --}}
              <div class="flex items-center justify-between pt-4">
                <dt class="font-bold text-lg text-gray-800">Total Payable Amount</dt>
                <dd class="font-bold text-lg text-red-600">₱ {{ number_format($total_amount_damage, 2, '.', ',') }}
                </dd>
              </div>
            </dl>

          </div>
        </div>
      </div>

      <x-slot name="footer">
        <div class="flex justify-between gap-x-2">
          <x-button negative label="Cancel" x-on:click="close" />
          <div class="flex space-x-3">
              {{-- <x-button cyan label="Save & Pay" wire:click="confirmDamageChargesPay" spinner="confirmDamageChargesPay"/>
                @if ($deposit_except_remote_and_key - $check_in_details->total_deduction >= $transaction->payable_amount)
                <x-button amber label="Save & Pay With Deposit" wire:click="confirmDamageChargesPayDeposit" spinner="confirmDamageChargesPayDeposit"/>
                @endif --}}
              <x-button positive label="Save" wire:click="confirmDamageCharges" spinner="confirmDamageCharges"/>
          </div>
        </div>
      </x-slot>
    </x-card>
  </x-modal>
</div>
