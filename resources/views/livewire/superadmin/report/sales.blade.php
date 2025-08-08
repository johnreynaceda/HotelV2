<div>
     <div class="my-2 hide-div  p-4 flex space-x-2 justify-between  bg-gray-100 rounded-lg">
        <div class="flex items-center space-x-6 w-full">
            <div class="flex space-x-2">
                 <x-native-select wire:model="branch_id">
                    <option selected hidden>Select Branch</option>
                        <option value="">All Branches</option>
                    @foreach ($branches as $item)
                        <option value="{{ $item->id }}">{{ $item->name }}</option>
                    @endforeach
                </x-native-select>
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
            </div>
        </div>
        <div class="flex items-center space-x-2">
            <x-button label="Print" icon="printer" @click="printOut($refs.printContainer.outerHTML);" amber />
            <x-button label="Back" red icon="arrow-left" @click="window.history.back()" />
        </div>

    </div>
    <div x-ref="printContainer">
      {{-- <div class="flex">
        <div class="flex space-x-2 items-center justify-center">
          <x-svg.hotel class="w-10 h-10 text-gray-600" />
          <div class="border-l-2 border-gray-500 pl-2">
            <div class="text-gray-600 text-xl font-bold">HIMS</div>
            <div class="text-gray-500 font-rubik border-t text-sm  leading-4">
              {{ auth()->user()->branch_name }}
            </div>
          </div>
        </div>
      </div> --}}
      <div class="flex mt-10 justify-center">
        <h1 wire:loading.remove wire.target="showExtend, showAmenities, showFood, showDamages, showDeposits" class="font-bold text-xl ">SALES REPORT</h1>
            <div wire:loading wire:target="showExtend, showAmenities, showFood, showDamages, showDeposits">
                <x-icon.spinner class="w-6 h-6 text-amber-600 animate-spin" />
            </div>
      </div>
      <div class="mt-6">
        {{-- <h1 class="font-bold mt-5 text-gray-700">No of Room Cleaned: {{ $total_cleaned }}</h1> --}}
        <table id="example" class="mt-2 table-auto" style="width:100%">

          <thead class="font-normal">
            <tr>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border bg-gray-200" colspan="7">GUEST INFORMATION</th>
              @if($showExtend)
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border bg-red-200" colspan="2">EXTEND
              </th>
              @endif
              @if($showAmenities)
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border bg-yellow-200" colspan="2">AMENITIES
              </th>
              @endif
              @if($showFood)
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border bg-blue-200" colspan="2">FOOD
              </th>
               @endif
                @if($showDamages)
               <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border bg-green-200" colspan="2">DAMAGES
              </th>
                @endif
                @if($showDeposits)
               <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border bg-violet-200" colspan="2">DEPOSITS
              </th>
                @endif
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border bg-gray-400">TOTAL AMOUNT
              </th>
            </tr>
            <tr>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border">ROOM #
              </th>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border">ROOM TYPE
              </th>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border">GUEST NAME
              </th>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border">CHECK-IN DATE
              </th>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border">CHECK-OUT DATE
              </th>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border">INITIAL # OF HOURS
              </th>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border">ROOM AMOUNT
              </th>
                @if($showExtend)
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border"># OF HOURS
              </th>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border">AMOUNT
              </th>
                @endif
                @if($showAmenities)
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border">ITEM
              </th>
               <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border">AMOUNT
              </th>
              @endif
              @if($showFood)
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border">ITEM
              </th>
               <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border">AMOUNT
              </th>
                @endif
                @if($showDamages)
               <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border">ITEM
              </th>
               <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border">AMOUNT
              </th>
                @endif
                @if($showDeposits)
               <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border">DESCRIPTION
              </th>
               <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border">AMOUNT
              </th>
                @endif
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-center text-gray-700 border">
              </th>
              {{-- <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-left text-gray-700 border">TRANSACTION
              </th>
              <th class="px-2 py-2 border-gray-700 text-sm font-semibold text-left text-gray-700 border">DESCRIPTION
              </th>
              <th class="px-2 py-2 border-gray-700 text-sm font-semibold text-left text-gray-700 border">DATE
              </th>
              <th class="px-2 py-2 border-gray-700 text-sm font-semibold text-right text-gray-700 border">PAID AMOUNT</th> --}}
            </tr>
          </thead>
          <tbody class="">
            @foreach ($transactions as $item)
              <tr>
                <td class="px-3 border-gray-700 py-1  border">{{ $item->room->number }}</td>
                <td class="px-3 border-gray-700 py-1  border">{{ $item->room->type->name }}</td>
                <td class="px-3 border-gray-700 py-1  border uppercase">{{ $item->room->latestCheckInDetail->guest->name }}</td>
                <td class="px-3 border-gray-700 py-1 border">
                    {{ \Carbon\Carbon::parse($item->room->latestCheckInDetail->check_in_at)->format('m-d-Y h:iA') }}
                </td>
                <td class="px-3 border-gray-700 py-1 border">
                    {{ \Carbon\Carbon::parse($item->room->latestCheckInDetail->check_out_at)->format('m-d-Y h:iA') }}
                </td>
                <td class="px-3 border-gray-700 py-1  border">{{ $item->room->latestCheckInDetail->hours_stayed }} hrs</td>
                <td class="px-3 border-gray-700 py-1 border">₱ {{ number_format($item->room->latestCheckInDetail->rate->amount, 2) }}</td>
                @if($showExtend)
                <td class="px-3 border-gray-700 py-1 border">
                    @if($item->room->extendedGuestReports())
                        {{ $item->room->extendedGuestReports()->sum('total_hours') }} hrs
                    @endif
                </td>
                <td class="px-3 border-gray-700 py-1 border">
                    @if($item->room->extendTransactions())
                    ₱ {{ number_format($item->room->extendTransactions()->sum('paid_amount'), 2) }}
                    @endif
                </td>
                @endif
                @if($showAmenities)
                <td class="px-3 border-gray-700 py-1 border">
                     @if($item->room->amenitiesTransactions())
                        {{ $item->room->amenitiesTransactions()->first()?->remarks }}
                     @endif
                </td>
                <td class="px-3 border-gray-700 py-1 border">
                     @if($item->room->amenitiesTransactions())
                    ₱ {{ number_format($item->room->amenitiesTransactions()->sum('paid_amount'), 2) }}
                    @endif
                </td>
                @endif
                @if($showFood)
                <td class="px-3 border-gray-700 py-1 border">
                     @if($item->room->foodTransactions())
                        {{ $item->room->foodTransactions()->first()?->remarks }}
                    @endif
                </td>
                <td class="px-3 border-gray-700 py-1 border">
                    @if($item->room->foodTransactions())
                    ₱ {{ number_format($item->room->foodTransactions()->sum('paid_amount'), 2) }}
                    @endif
                </td>
                @endif
                @if($showDamages)
               <td class="px-3 border-gray-700 py-1 border">
                    @if($item->room->damagesTransactions())
                        {{ $item->room->damagesTransactions()->first()?->remarks }}
                    @endif
                </td>
                <td class="px-3 border-gray-700 py-1 border">
                    @if($item->room->damagesTransactions())
                    ₱ {{ number_format($item->room->damagesTransactions()->sum('paid_amount'), 2) }}

                    @endif
                </td>
                @endif
                @if($showDeposits)
                <td class="px-3 border-gray-700 py-1 border">
                    @if($item->room->depositTransactions())
                        {{ $item->room->depositTransactions()->first()?->remarks }}
                    @endif
                </td>
                <td class="px-3 border-gray-700 py-1 border">
                    @if($item->room->depositTransactions())
                    ₱ {{ number_format($item->room->depositTransactions()->sum('paid_amount'), 2) }}
                    @endif
                </td>
                @endif
                <td class="px-3 border-gray-700 py-1 border">
                    ₱ {{ number_format($item->room->latestCheckInDetail->rate->amount +
                    ($showExtend ? $item->room->extendTransactions()->sum('paid_amount') : 0) +
                    ($showAmenities ? $item->room->amenitiesTransactions()->sum('paid_amount') : 0) +
                    ($showFood ? $item->room->foodTransactions()->sum('paid_amount') : 0) +
                    ($showDamages ? $item->room->damagesTransactions()->sum('paid_amount') : 0) +
                    ($showDeposits ? $item->room->depositTransactions()->sum('paid_amount') : 0), 2) }}
                </td>


                {{-- <td class="px-3 border-gray-700 py-1  border">{{ $item->description }}</td>
                <td class="px-3 border-gray-700 py-1  border">{{ $item->remarks }}</td>
                <td class="px-3 border-gray-700 py-1 text-sm  border">
                  {{ \Carbon\Carbon::parse($item->paid_at)->format('F d, Y h:i A') }}</td>
                <td class="px-3 border-gray-700 py-1 text-sm text-right border">
                    ₱ {{ number_format($item->paid_amount, 2) }}</td> --}}
              </tr>
            @endforeach
          </tbody>
        </table>
        <div class="mt-20">
            <div class="flex justify-end space-y-7">
                <div class="text-gray-700">
                  <h1 class="text-lg font-semibold">TOTAL SALES :  ₱ {{ number_format($totalSales, 2) }}</h1>
                  {{-- <h1 class="text-sm mt-8 w-48 border-b border-gray-400"></h1> --}}
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
