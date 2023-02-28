<div>
  <div class="my-2  p-4 flex space-x-2   justify-start  bg-gray-100 rounded-lg">
    <x-native-select wire:model="frontdesk_id">
      <option>Select Frontdesk</option>
      @foreach ($frontdesks as $item)
        <option value="{{ $item->id }}">{{ $item->name }}</option>
      @endforeach
    </x-native-select>
    <x-native-select wire:model="shift">
      <option>Select Shift</option>
      <option>AM</option>
      <option>PM</option>
    </x-native-select>
    <x-datetime-picker placeholder="Select Date" without-time wire:model="date" />
    <div class="w-40 ">
      <x-time-picker placeholder="12:00 AM" wire:model.defer="timePicker" />
    </div>
  </div>
  <div class="flex justify-center">
    <h1 class="font-bold text-xl ">NEW GUEST REPORT</h1>
  </div>
  <div class="mt-6">
    <h1 class="font-bold mt-5 text-gray-700">No of New Guest: </h1>
    <table id="example" class="mt-2 table-auto" style="width:100%">
      <thead class="font-normal">
        <tr>
          <th class="px-2 py-2 w-32 border-gray-700 text-sm font-semibold text-left text-gray-700 border">ROOM NUMBER
          </th>
          <th class="px-2 py-2 border-gray-700 text-sm font-semibold text-left text-gray-700 border">GUEST NAME
          </th>
          <th class="px-2 py-2 border-gray-700 text-sm font-semibold text-left text-gray-700 border">CHECK-IN DATE/TIME
          </th>
          <th class="px-2 py-2 border-gray-700 text-sm font-semibold text-left text-gray-700 border">CHECK-OUT DATE/TIME
          </th>
          <th class="px-2 py-2 border-gray-700 text-sm font-semibold text-left text-gray-700 border">NO. OF HOURS
          </th>
          <th class="px-2 py-2 border-gray-700 text-sm font-semibold text-left text-gray-700 border">SHIFT
          </th>
          <th class="px-2 py-2 border-gray-700 text-sm font-semibold text-left text-gray-700 border">FRONTDESK NAME
          </th>
        </tr>
      </thead>
      <tbody class="">

        @foreach ($rooms as $room)
          <tr>
            <td colspan="" class="px-3 border-gray-700 py-1 border">{{ $room->number }}</td>
            <td colspan="6" class="px-3 border-gray-700 py-1 border"></td>
          </tr>

          @foreach ($room->newGuestReports as $item)
            <tr>
              <td class="px-3 border-gray-700 py-1  "></td>
              <td class="px-3 border-gray-700 py-1 border">{{ $item->checkinDetail->guest->name }}</td>
              <td class="px-3 border-gray-700 py-1 border">
                {{ \Carbon\Carbon::parse($item->created_at)->format('F d, Y h:m A') }}</td>
              <td class="px-3 border-gray-700 py-1 border">
                {{ \Carbon\Carbon::parse($item->checkinDetail->check_out_at)->format('F d, Y h:m A') }}</td>
              <td class="px-3 border-gray-700 py-1 border">{{ $item->checkinDetail->hours_stayed }}</td>
              <td class="px-3 border-gray-700 py-1 border">{{ $item->shift }}</td>
              <td class="px-3 border-gray-700 py-1 border">
                @php
                  $user = App\Models\Frontdesk::where('id', $item->frontdesk_id)->first();
                @endphp

                {{ $user->name . ', ' . $item->partner_name }}
              </td>
            </tr>
          @endforeach
        @endforeach


      </tbody>
    </table>
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
