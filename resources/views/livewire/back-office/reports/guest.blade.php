<div>
  <div class="mt-5 bg-white rounded-lg shadow-lg p-5">
    <div class="flex justify-between items-end">
      <div class="flex space-x-2" x-animate>
        <x-native-select wire:model="type">
          <option>----------</option>
          <option value="1">Number of Guest Per Day</option>
          <option value="2">Total New Guest</option>
          <option value="3">Total Extended Guest</option>
        </x-native-select>
        <div>
          @if ($type != 2)
            <x-datetime-picker wire:model="date" without-time without-tips />
          @endif
        </div>
      </div>
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

        @switch($type)
          @case(1)
            <div class="pt-10 pb-5">
              <h1 class="text-2xl text-center text-gray-600 font-bold">GUEST PER DAY REPORT</h1>
              <div class="mt-6">
                <h1 class="font-bold mt-5 text-gray-700">TOTAL GUEST: {{ $guests ? count($guests) : 0 }}</h1>
                <table id="example" class="mt-2 table-auto" style="width:100%">
                  <thead class="font-normal">
                    <tr>
                      <th class="px-2 py-2 border-gray-700 text-sm font-semibold text-left text-gray-700 border">GUEST NAME
                      </th>
                      <th class="px-2 py-2 border-gray-700 text-sm font-semibold text-left text-gray-700 border">CONTACT
                        NUMBER
                      </th>
                    </tr>
                  </thead>
                  <tbody class="">
                    @foreach ($guests as $guest)
                      <tr>
                        <td class="px-3 border-gray-700 py-1 border"> {{ $guest->name }}</td>
                        <td class="px-3 border-gray-700 py-1 border"> {{ $guest->contact_number }}</td>
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
          @break

          @case(2)
            <div class="pt-10 pb-5">
              <h1 class="text-2xl text-center text-gray-600 font-bold">NEW GUEST REPORT</h1>
              <div class="mt-6">
                <h1 class="font-bold mt-5 text-gray-700">TOTAL GUEST: {{ $guests ? count($guests) : 0 }}</h1>
                <table id="example" class="mt-2 table-auto" style="width:100%">
                  <thead class="font-normal">
                    <tr>
                      <th class="px-2 py-2 border-gray-700 text-sm font-semibold text-left text-gray-700 border">GUEST NAME
                      </th>
                      <th class="px-2 py-2 border-gray-700 text-sm font-semibold text-left text-gray-700 border">CONTACT
                        NUMBER
                      </th>
                    </tr>
                  </thead>
                  <tbody class="">
                    @foreach ($guests as $guest)
                      <tr>
                        <td class="px-3 border-gray-700 py-1 border"> {{ $guest->name }}</td>
                        <td class="px-3 border-gray-700 py-1 border"> {{ $guest->contact_number }}</td>
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
          @break

          @case(3)
            <div class="pt-10 pb-5">
              <h1 class="text-2xl text-center text-gray-600 font-bold">EXTENDED GUEST REPORT</h1>
              <div class="mt-6">
                <h1 class="font-bold mt-5 text-gray-700">TOTAL GUEST: {{ $guests ? count($guests) : 0 }}</h1>
                <table id="example" class="mt-2 table-auto" style="width:100%">
                  <thead class="font-normal">
                    <tr>
                      <th class="px-2 py-2 border-gray-700 text-sm font-semibold text-left text-gray-700 border">GUEST NAME
                      </th>
                      <th class="px-2 py-2 border-gray-700 text-sm font-semibold text-left text-gray-700 border">CONTACT
                        NUMBER
                      </th>
                    </tr>
                  </thead>
                  <tbody class="">
                    @foreach ($guests as $guest)
                      <tr>
                        <td class="px-3 border-gray-700 py-1 border"> {{ $guest->name }}</td>
                        <td class="px-3 border-gray-700 py-1 border"> {{ $guest->contact_number }}</td>
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
          @break

          @default
        @endswitch
      </div>
    </div>
  </div>
</div>
