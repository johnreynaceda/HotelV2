<div>
  <div class="mt-5 bg-white rounded-lg shadow-lg p-5">
    <div class="flex justify-between items-end">
      <x-datetime-picker wire:model="date" without-time without-tips />
      <div>
        <x-button label="Print Report" icon="printer" dark />
      </div>
    </div>
    <div class="mt-5 ">
      <div class="border-2 p-5">
        <div class="flex space-x-2 items-center justify-start">
          <x-svg.hotel class="w-10 h-10 text-gray-600" />
          <div class="border-l-2 border-gray-500 pl-2">
            <div class="text-gray-500 text-xl font-bold">HIMS</div>
            <div class="text-gray-600 font-rubik border-t text-sm  leading-4">
              {{ auth()->user()->branch_name }}
            </div>
          </div>
        </div>

        <div class="pt-10 pb-5">
          <h1 class="text-2xl text-center text-gray-600 font-bold">OCCUPIED ROOMS REPORT</h1>
          <div class="mt-6">
            <table id="example" class="table-auto mt-5" style="width:100%">
              <thead class="font-normal">
                <tr>
                  <th class="border border-gray-600 text-left px-2 text-sm font-semibold text-gray-700 py-2">
                    TR-NUMBER
                  </th>
                  <th class="border border-gray-600 text-left px-2 text-sm font-semibold text-gray-700 py-2">ROOM
                  </th>
                </tr>
              </thead>
              <tbody class="">
                @foreach ($occupieds as $transaction)
                  <tr>
                    <td class="border border-gray-600 px-3 py-1"> {{ $transaction->guest->qr_code }}</td>
                    <td class="border border-gray-600 px-3 py-1"> RM # {{ $transaction->room->numberWithFormat() }} |
                      {{ $transaction->room->floor->numberWithFormat() }}</td>
                  </tr>
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
      </div>
    </div>
  </div>
</div>
