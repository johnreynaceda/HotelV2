<div>
     <div class="my-2 hide-div  p-4 flex space-x-2 justify-between  bg-gray-100 rounded-lg">
        <div class="flex items-center space-x-6 w-full">
            {{-- <div>
                <x-native-select wire:model="type" class="h-10 text-base">
                    <option value="Overall Sales">Overall Sales</option>
                    <option value="Daily">Daily</option>
                    <option value="Weekly">Weekly</option>
                    <option value="Monthly">Monthly</option>
                </x-native-select>
            </div>
            <div class="flex items-center space-x-4">
                <label class="inline-flex items-center space-x-2">
                    <input type="checkbox" wire:model="showExtend" class="form-checkbox h-5 w-5 text-red-500 rounded">
                    <span class="text-base">Extend</span>
                </label>
                <label class="inline-flex items-center space-x-2">
                    <input type="checkbox" wire:model="showAmenities" class="form-checkbox h-5 w-5 text-yellow-500 rounded">
                    <span class="text-base">Amenities</span>
                </label>
                <label class="inline-flex items-center space-x-2">
                    <input type="checkbox" wire:model="showFood" class="form-checkbox h-5 w-5 text-blue-500 rounded">
                    <span class="text-base">Food</span>
                </label>
                <label class="inline-flex items-center space-x-2">
                    <input type="checkbox" wire:model="showDamages" class="form-checkbox h-5 w-5 text-green-500 rounded">
                    <span class="text-base">Damages</span>
                </label>
                <label class="inline-flex items-center space-x-2">
                    <input type="checkbox" wire:model="showDeposits" class="form-checkbox h-5 w-5 text-violet-500 rounded">
                    <span class="text-base">Deposits</span>
                </label>
            </div> --}}
        </div>
        <div class="flex items-center space-x-2">
            <x-button label="Print" icon="printer" @click="printOut($refs.printContainer.outerHTML);" amber />
            <x-button label="Back" icon="arrow-left" wire:click="returnBack" slate />
        </div>
    </div>
      {{-- <div class="flex space-x-4 hide-div p-4 items-center">
                <x-input label="From" type="date" wire:model="date_from" class="h-10 text-base" placeholder="Date From" />
                <x-input label="To" type="date" wire:model="date_to" class="h-10 text-base" placeholder="Date To" />
                 <x-native-select label="Shift" wire:model="shift" class="h-10 text-base">
                    <option value="">ALL</option>
                    <option value="AM">AM</option>
                    <option value="PM">PM</option>
                </x-native-select>
      </div> --}}
    <div x-ref="printContainer">
      <div class="flex mt-10 justify-center">
        <h1 wire:loading.remove wire.target="showExtend, showAmenities, showFood, showDamages, showDeposits" class="font-bold text-xl ">INVENTORY REPORT</h1>
            <div wire:loading wire:target="showExtend, showAmenities, showFood, showDamages, showDeposits">
                <x-icon.spinner class="w-6 h-6 text-amber-600 animate-spin" />
            </div>
      </div>
      <div class="mt-6">
 <div class="overflow-x-auto mt-4">
    <table class="table-auto border-collapse w-full text-sm">
        <thead>
            <tr class="bg-gray-200 text-gray-700 font-semibold text-center">
                <th class="border px-2 py-1">Item Code</th>
                <th class="border px-2 py-1">Item Name</th>
                <th class="border px-2 py-1">Category</th>
                <th class="border px-2 py-1">Unit</th>
                <th class="border px-2 py-1">Opening Stock</th>
                <th class="border px-2 py-1">Stock-In</th>
                <th class="border px-2 py-1">Stock-out</th>
                <th class="border px-2 py-1">Wastage</th>
                <th class="border px-2 py-1">Closing Stock</th>
                <th class="border px-2 py-1">Unit Cost</th>
                <th class="border px-2 py-1">Total Value</th>
            </tr>
        </thead>
        <tbody>
            @forelse($inventories as $item)
            <tr class="text-center">
                <td class="border px-2 py-1">{{ $item['item_code'] }}</td>
                <td class="border px-2 py-1">{{ $item['item_name'] }}</td>
                <td class="border px-2 py-1">{{ $item['category'] }}</td>
                <td class="border px-2 py-1">{{ $item['unit'] }}</td>
                <td class="border px-2 py-1">{{ $item['opening_stock'] }}</td>
                <td class="border px-2 py-1">{{ $item['stock_in'] }}</td>
                <td class="border px-2 py-1">{{ $item['stock_out'] }}</td>
                <td class="border px-2 py-1">{{ $item['wastage'] }}</td>
                <td class="border px-2 py-1">{{ $item['closing_stock'] }}</td>
                <td class="border px-2 py-1">₱ {{ number_format($item['unit_cost'], 2) }}</td>
                <td class="border px-2 py-1 font-semibold">₱ {{ number_format($item['total_value'], 2) }}</td>
            </tr>
            @empty
            <tr>
                <td colspan="11" class="border px-2 py-3 text-center text-gray-500">No inventory records found.</td>
            </tr>
            @endforelse
        </tbody>
    </table>
</div>
        <div class="mt-20">
            <div class="flex justify-end space-y-7">
                <div class="text-gray-700">
                  {{-- <h1 class="text-lg font-semibold">TOTAL SALES :  ₱ {{ number_format($totalSales, 2) }}</h1> --}}
                </div>
              </div>
        </div>
        <div class="mt-20">
          <div class="flex flex-col space-y-7">
            <div class="text-gray-700">
              <h1 class="text-sm font-semibold">Prepared By:</h1>
              <h1 class="text-sm mt-8 w-48 border-b border-gray-400"></h1>
            </div>
            <div class="text-gray-700">
              <h1 class="text-sm font-semibold">Verified By:</h1>
              <h1 class="text-sm mt-8 w-48 border-b border-gray-400"></h1>
            </div>
          </div>
        </div>
      </div>
    </div>
</div>
