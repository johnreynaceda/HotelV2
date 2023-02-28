<div>
  <div class="my-2  p-4 flex space-x-2   justify-start  bg-gray-100 rounded-lg">
    <x-native-select wire:model="model">
      <option>Select Frontdesk</option>
      <option>Pending</option>
      <option>Stuck</option>
      <option>Done</option>
    </x-native-select>
    <x-native-select wire:model="model">
      <option>Select Shift</option>
      <option>AM</option>
      <option>PM</option>
    </x-native-select>
    <x-datetime-picker placeholder="Select Date" wire:model.defer="normalPicker" />
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
        <tr>
          <td colspan="" class="px-3 border-gray-700 py-1 border">1</td>
          <td colspan="6" class="px-3 border-gray-700 py-1 border"></td>
        </tr>
        <tr>
          <td class="px-3 border-gray-700 py-1  "></td>
          <td class="px-3 border-gray-700 py-1 border">Johnrey Naceda</td>
          <td class="px-3 border-gray-700 py-1 border">February 25, 2022 2:30 PM</td>
          <td class="px-3 border-gray-700 py-1 border">February 25, 2022 2:30 PM</td>
          <td class="px-3 border-gray-700 py-1 border">12</td>
          <td class="px-3 border-gray-700 py-1 border">February 25, 2022 2:30 PM</td>
          <td class="px-3 border-gray-700 py-1 border">Gab, reyy</td>
        </tr>
        <tr>
          <td class="px-3 border-gray-700 py-1  "></td>
          <td class="px-3 border-gray-700 py-1 border">Johnrey Naceda</td>
          <td class="px-3 border-gray-700 py-1 border">February 25, 2022 2:30 PM</td>
          <td class="px-3 border-gray-700 py-1 border">February 25, 2022 2:30 PM</td>
          <td class="px-3 border-gray-700 py-1 border">12</td>
          <td class="px-3 border-gray-700 py-1 border">February 25, 2022 2:30 PM</td>
          <td class="px-3 border-gray-700 py-1 border">Gab, reyy</td>
        </tr>
        <tr>
          <td class="px-3 border-gray-700 py-1  "></td>
          <td class="px-3 border-gray-700 py-1 border">Johnrey Naceda</td>
          <td class="px-3 border-gray-700 py-1 border">February 25, 2022 2:30 PM</td>
          <td class="px-3 border-gray-700 py-1 border">February 25, 2022 2:30 PM</td>
          <td class="px-3 border-gray-700 py-1 border">12</td>
          <td class="px-3 border-gray-700 py-1 border">February 25, 2022 2:30 PM</td>
          <td class="px-3 border-gray-700 py-1 border">Gab, reyy</td>
        </tr>
        <tr>
          <td colspan="" class="px-3 border-gray-700 py-1 border">2</td>
          <td colspan="6" class="px-3 border-gray-700 py-1 border"></td>
        </tr>
        <tr>
          <td class="px-3 border-gray-700 py-1  "></td>
          <td class="px-3 border-gray-700 py-1 border">Johnrey Naceda</td>
          <td class="px-3 border-gray-700 py-1 border">February 25, 2022 2:30 PM</td>
          <td class="px-3 border-gray-700 py-1 border">February 25, 2022 2:30 PM</td>
          <td class="px-3 border-gray-700 py-1 border">12</td>
          <td class="px-3 border-gray-700 py-1 border">February 25, 2022 2:30 PM</td>
          <td class="px-3 border-gray-700 py-1 border">Gab, reyy</td>
        </tr>
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
