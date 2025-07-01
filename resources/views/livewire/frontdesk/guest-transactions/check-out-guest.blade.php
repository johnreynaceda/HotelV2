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
                    <td class="py-2 text-gray-700">
                        Room key and remote handed over by the guest / room boy
                    </td>
                    <td class="py-2 text-gray-700">
                        @if($hasConfirmedRoomKeyHandedOver)
                            <span class="font-normal italic {{ $roomKeyHandedOver === 'Yes' ? 'text-green-600' : 'text-red-600' }}">
                                {{ $roomKeyHandedOver }}
                            </span>
                        @endif
                    </td>
                    <td class="py-2">
                        @if(!$hasConfirmedRoomKeyHandedOver && !$has_damaged_remote_and_key)
                        <div class="flex justify-end gap-4">
                            <x-button wire:click="hasHandedRemote('Yes')" emerald label="Yes" icon="check"/>
                            <x-button wire:click="hasHandedRemote('No')" negative label="No" icon="x"/>

                        </div>
                        @endif
                    </td>
                </tr>
                <tr class="border-b border-gray-200">
                    <td class="py-2 text-gray-700">Check room by the body -
                        <span class="font-semibold">
                            &#8369; {{number_format($record->transactions()->where('transaction_type_id', 4)->sum('payable_amount'), 2)}}
                        </span>
                    </td>
                     <td class="py-2 text-gray-700">
                        @forelse($record->transactions()->where('transaction_type_id', 4)->get() as $transaction)
                            <div>
                                {{ $transaction->remarks ?? 'Damage Charge' }} -  &#8369; {{ number_format($transaction->payable_amount, 2) }}
                            </div>
                        @empty
                            <div class="text-gray-500 italic">No damage charges recorded.</div>
                        @endforelse
                     </td>
                    <td class="py-2 text-right">
                        <x-button negative wire:click="checkOutGuest" label="Damage Charges" icon="emoji-sad" />
                    </td>
                </tr>
                 <tr class="border-b border-gray-200">
                    <td class="py-2 text-gray-700">Claimable Deposit -
                        <span class="font-semibold">
                            &#8369; {{number_format($deposits->sum('deposit_amount'), 2)}}
                        </span>
                    </td>
                    <td class="py-2 text-gray-700">
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
            </tbody>
        </table>
    @endif
</div>
