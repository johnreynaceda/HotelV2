<div class="p-6">
    <h2 class="text-xl font-semibold text-gray-800 mb-6">Check In Information</h2>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        {{-- Left: Guest Details --}}
        <div class="space-y-4 text-sm text-gray-700">
            <div>
                <label class="block font-medium mb-1">QR Code</label>
               <div class="p-2 bg-gray-100 rounded-md">{{$record->guest->qr_code}}</div>
            </div>
            <div>
                <label class="block font-medium mb-1">Name</label>
                <div class="p-2 bg-gray-100 rounded-md">{{$record->guest->name}}</div>
            </div>
            <div>
                <label class="block font-medium mb-1">Contact Number</label>
                <div class="p-2 bg-gray-100 rounded-md">{{ $record->guest->contact == 'N/A' ? 'N/A' : '09' . $temporary_checkIn->guest->contact }}</div>
            </div>
            <div>
                <label class="block font-medium mb-1">Room Number</label>
                <div class="p-2 bg-gray-100 rounded-md">{{ $record->room->number }}</div>
            </div>
            @if ($record->guest->is_long_stay)
            <div>
                <label class="block font-medium mb-1">Days</label>
                <div class="p-2 bg-gray-100 rounded-md">{{ $record->guest->number_of_days }}</div>
            </div>
            @else
            <div>
                <label class="block font-medium mb-1">Staying Hours</label>
                <div class="p-2 bg-gray-100 rounded-md">{{ $stayingHour->number }}</div>
            </div>
            @endif
        </div>

        {{-- Right: Billing Details --}}
        <div class="border rounded-md bg-gray-50 p-4 shadow-sm text-sm text-gray-700">
            <h3 class="text-lg font-semibold text-gray-700 mb-4">Billing Statement</h3>

            <div class="flex justify-between text-lg mb-2">
                <span class="text-gray-600">Room Rate:</span>
                <span class="text-gray-800 font-medium">₱ {{ number_format($record->guest->static_amount, 2) }}</span>
            </div>
            <div class="flex justify-between text-lg mb-2">
                <span class="text-gray-600">Additional Charges:</span>
                <span class="text-gray-800 font-medium">₱ {{ number_format($additional_charges, 2) }}</span>
            </div>
             @if($has_discount)
            <div class="flex justify-between text-lg mb-2">
                <span class="text-red-600">Discount: (Senior & PWD)</span>
                <span class="text-red-600 font-medium">– ₱ {{ number_format($discount_amount, 2) }}</span>
            </div>
            @endif
            <hr class="my-2">

            <div class="flex justify-between text-xl font-semibold text-gray-800 mb-4">
                <span>Total:</span>
                <span>₱ {{ number_format($total, 2) }}</span>
            </div>

            <div class="mt-20">
                <label class="block font-medium mb-1">Amount Paid</label>
                <x-input wire:model.defer="amountPaid" type="number" placeholder="0.00" class="text-right px-2 py-2" prefix="₱" />
            </div>
        </div>
    </div>

    <div class="flex justify-end mt-6 space-x-2">
        <div class="flex justify-between items-center w-full">
            <div>
                {{-- checkbox grant discount --}}
                <label class="inline-flex items-center">
                    <input type="checkbox" wire:model="has_discount" class="form-checkbox rounded text-[#1877F2] focus:ring-[#1877F2] border-gray-300" />
                    <span class="ml-2 text-sm text-gray-700">Grant Discount</span>
                </label>
            </div>
            <div class="flex space-x-2">
                <button wire:click="cancelCheckIn" class="px-4 py-2 bg-gray-300 text-gray-800 rounded-md hover:bg-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-300 focus:ring-opacity-50">
                    Cancel
                </button>
                <button wire:click="proceedCheckIn" class="px-4 py-2 bg-[#1877F2] text-white rounded-md hover:bg-[#166FE0] focus:outline-none focus:ring-2 focus:ring-[#1877F2] focus:ring-opacity-50">
                    Check-In
                </button>
            </div>
        </div>
    </div>

    {{-- modal for submission --}}
    <x-modal wire:model.defer="change_modal" align="center">
      <x-card>
        <div>
          <div class="header flex space-x-1 border-b items-end justify-between py-0.5">
            <h2 class="text-lg uppercase text-gray-600 font-bold">Confirmation</h2>
          </div>
          <div class="mt-3">
            <div class="space-y-4">
              <dl class="mt-8 p-2 divide-y divide-gray-400 text-sm lg:col-span-5 lg:mt-0">
                {{-- change: $excess_amount --}}
                <div class="flex justify-between py-2">
                    <div class="w-full divide-y divide-gray-400 ">
                        {{-- <div class="flex justify-between items-center py-2">
                            <dt class="text-gray-600 text-lg font-bold">Amount Paid:</dt>
                            <dd class="text-gray-800 text-lg font-bold">₱ {{ number_format($amountPaid, 2) }}</dd>
                        </div> --}}
                        <div class="flex justify-between items-center py-2">
                            <dt class="text-gray-600 text-2xl font-bold">Excess Amount:</dt>
                            <dd class="text-gray-800 text-2xl font-bold">₱ {{ number_format($excess_amount, 2) }}</dd>
                        </div>
                    </div>
                </div>
                 {{-- add checkbox for save excess --}}
                    <div class="flex items-center">
                        <label class="inline-flex flex-col items-start pt-5">
                            <span class="flex items-center">
                                <input type="checkbox" wire:model="save_excess" class="form-checkbox rounded text-[#1877F2] focus:ring-[#1877F2] border-gray-300" />
                                <span class="ml-2 text-lg text-gray-700">Save excess amount</span>
                            </span>
                            <span class="text-xs text-gray-600 mt-1 ml-6">Save this amount as a deposit to the guest's account.</span>
                        </label>
                    </div>
              </dl>
            </div>
          </div>
        </div>

        <x-slot name="footer">
          <div class="flex justify-end s gap-x-2">
              <x-button red label="Close" x-on:click="close" />
              <x-button emerald label="Check-In" wire:click="saveCheckIn" />
          </div>
        </x-slot>
      </x-card>
    </x-modal>
</div>
