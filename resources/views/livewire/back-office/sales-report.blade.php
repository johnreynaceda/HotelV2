<div>
     <div class="my-2 hide-div  p-4 flex space-x-2 justify-between  bg-gray-100 rounded-lg">
        <div class="flex space-x-2">
            <x-native-select wire:model="type">
                <option value="Overall Sales">Overall Sales</option>
                <option value="Daily">Daily</option>
                <option value="Weekly">Weekly</option>
                <option value="Monthly">Monthly</option>
            </x-native-select>
        </div>
        <div>
            <x-button label="Print" icon="printer" @click="printOut($refs.printContainer.outerHTML);" amber />
        </div>

    </div>
    <div x-ref="printContainer">
      <div class="flex">
        <div class="flex space-x-2 items-center justify-center">
          <x-svg.hotel class="w-10 h-10 text-gray-600" />
          <div class="border-l-2 border-gray-500 pl-2">
            <div class="text-gray-600 text-xl font-bold">HIMS</div>
            <div class="text-gray-500 font-rubik border-t text-sm  leading-4">
              {{ auth()->user()->branch_name }}
            </div>
          </div>
        </div>
      </div>
      <div class="flex mt-10 justify-center">
        <h1 class="font-bold text-xl ">SALES REPORT</h1>
      </div>
      <div class="mt-6">
        {{-- <h1 class="font-bold mt-5 text-gray-700">No of Room Cleaned: {{ $total_cleaned }}</h1> --}}
        <table id="example" class="mt-2 table-auto" style="width:100%">
          <thead class="font-normal">
            <tr>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-left text-gray-700 border">ROOM #
              </th>
               <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-left text-gray-700 border">ROOM TYPE
              </th>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-left text-gray-700 border">CHECK-IN DATE
              </th>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-left text-gray-700 border">CHECK-OUT DATE
              </th>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-left text-gray-700 border">INITIAL # OF HOURS
              </th>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-left text-gray-700 border">ROOM AMOUNT
              </th>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-left text-gray-700 border"># OF HOURS EXTENDED
              </th>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-left text-gray-700 border">EXTEND AMOUNT
              </th>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-left text-gray-700 border">AMENITIES
              </th>
               <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-left text-gray-700 border">AMENITIES AMOUNT
              </th>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-left text-gray-700 border">FOOD
              </th>
               <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-left text-gray-700 border">FOOD AMOUNT
              </th>
               <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-left text-gray-700 border">DAMAGES
              </th>
               <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-left text-gray-700 border">DAMAGE AMOUNT
              </th>
               <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-left text-gray-700 border">DEPOSIT DESC
              </th>
               <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-left text-gray-700 border">DEPOSIT AMOUNT
              </th>
              <th class="px-2 py-2 w-28 border-gray-700 text-sm font-semibold text-left text-gray-700 border">TOTAL
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
                <td class="px-3 border-gray-700 py-1 border">
                    {{ \Carbon\Carbon::parse($item->room->latestCheckInDetail->check_in_at)->format('m-d-Y h:iA') }}
                </td>
                <td class="px-3 border-gray-700 py-1 border">
                    {{ \Carbon\Carbon::parse($item->room->latestCheckInDetail->check_out_at)->format('m-d-Y h:iA') }}
                </td>
                <td class="px-3 border-gray-700 py-1  border">{{ $item->room->latestCheckInDetail->hours_stayed }} hrs</td>
                <td class="px-3 border-gray-700 py-1 border">₱ {{ number_format($item->room->latestCheckInDetail->rate->amount, 2) }}</td>
                <td class="px-3 border-gray-700 py-1 border">
                    @if($item->room->extendedGuestReports())
                        {{ $item->room->extendedGuestReports()->sum('total_hours') }} hrs
                    @endif
                </td>
                <td class="px-3 border-gray-700 py-1 border">
                    @if($item->room->extendTransactions())
                    ₱ {{ number_format($item->room->extendTransactions()->sum('payable_amount'), 2) }}
                    @endif
                </td>
                <td class="px-3 border-gray-700 py-1 border">
                     @if($item->room->amenitiesTransactions())
                        {{ $item->room->amenitiesTransactions()->first()->remarks }}
                     @endif
                </td>
                <td class="px-3 border-gray-700 py-1 border">
                     @if($item->room->amenitiesTransactions())
                    ₱ {{ number_format($item->room->amenitiesTransactions()->sum('payable_amount'), 2) }}
                    @endif
                </td>
                <td class="px-3 border-gray-700 py-1 border">
                     @if($item->room->extendedGuestReports())
                        {{ $item->room->extendedGuestReports()->sum('total_hours') }} hrs
                    @endif
                </td>
                <td class="px-3 border-gray-700 py-1 border">
                    @if($item->room->extendTransactions())
                    ₱ {{ number_format($item->room->extendTransactions()->sum('payable_amount'), 2) }}
                    @endif
                </td>
               <td class="px-3 border-gray-700 py-1 border">
                    @if($item->room->extendedGuestReports())
                        {{ $item->room->extendedGuestReports()->sum('total_hours') }} hrs
                    @endif
                </td>
                <td class="px-3 border-gray-700 py-1 border">
                    @if($item->room->extendTransactions())
                    ₱ {{ number_format($item->room->extendTransactions()->sum('payable_amount'), 2) }}
                    @endif
                </td>
                 <td class="px-3 border-gray-700 py-1 border">
                    @if($item->room->extendTransactions())
                    ₱ {{ number_format($item->room->extendTransactions()->sum('payable_amount'), 2) }}
                    @endif
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
