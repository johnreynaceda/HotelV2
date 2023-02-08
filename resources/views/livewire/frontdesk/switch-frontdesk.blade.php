<div>
  <x-button label="Switch Frontdesk" icon="user" white wire:click="$set('switch_modal', true)" />

  <x-modal.card fullscreen wire:model.defer="switch_modal">
    <div class="mx-20 ">
      <div class="flex justify-between">
        <h1 class="text-2xl font-bold text-gray-600">SHIFT REPORT</h1>
        <x-button label="Print" gray right-icon="printer" />
      </div>

      <div class="mt-8 border-2">
        <div class="p-4 border-b">
          <h1 class="text-xl text-center font-semibold text-gray-600">DAILY SHIFT REPORT</h1>
        </div>
        <div class="overflow-hidden bg-white shadow ">

          <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
            <dl class="sm:divide-y sm:divide-gray-200">
              <div class="py-2 sm:grid sm:grid-cols-3 sm:gap-4 sm:py-2 sm:px-6">
                <dt class="text-sm font-medium text-gray-500">Date</dt>
                <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0">
                  {{ \Carbon\Carbon::now()->format('F d, Y') }}</dd>
              </div>
              <div class="py-2 sm:grid sm:grid-cols-3 sm:gap-4 sm:py-2 sm:px-6">
                <dt class="text-sm font-medium text-gray-500">Frontdesk</dt>
                <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0">
                  @php
                    $users = \App\Models\Frontdesk::whereIn('id', $frontdesks)->get();
                  @endphp

                  @foreach ($users as $user)
                    {{ $user->name }}
                  @endforeach
                </dd>

              </div>
              <div class="py-2 sm:grid sm:grid-cols-3 sm:gap-4 sm:py-2 sm:px-6">
                <dt class="text-sm font-medium text-gray-500">Time Log In</dt>
                <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0">margotfoster@example.com</dd>
              </div>
              <div class="py-2 sm:grid sm:grid-cols-3 sm:gap-4 sm:py-2 sm:px-6">
                <dt class="text-sm font-medium text-gray-500">Time Log Out</dt>
                <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0">$120,000</dd>
              </div>
            </dl>
          </div>
        </div>
        <div class="p-4">
          <h1 class="text-xl text-center font-semibold text-gray-600">SUMMARY</h1>
          <div class="mt-5">
            <table class="min-w-full divide-y divide-gray-300">
              <thead class="bg-gray-50">
                <tr>
                  <th scope="col"
                    class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6 lg:pl-8">
                    FLOOR</th>
                  <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">ROOM
                  </th>
                  <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">FOOD
                  </th>
                  <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">DRINKS
                  </th>
                  <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">LOAD
                  </th>
                  <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">INTERNET
                  </th>
                  <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">EXCESS CHARGES
                  </th>
                  <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">GROSS TOTAL
                  </th>
                  <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">TOTAL DEPOSIT
                  </th>

                </tr>
              </thead>
              <tbody class="divide-y divide-gray-200 bg-white">
                @foreach ($floors as $floor)
                  @php
                    $trans = \App\Models\Transaction::where('floor_id', $floor->id)
                        ->whereNotNull('paid_at')
                        ->where('branch_id', $floor->branch_id)
                        ->get();
                  @endphp
                  <tr>
                    <td
                      class="whitespace-nowrap py-2 pl-4 pr-3 uppercase text-sm font-medium text-gray-900 sm:pl-6 lg:pl-8">
                      {{ $floor->numberWithFormat() }}</td>
                    <td class="whitespace-nowrap px-3 py-2 text-sm text-gray-500">


                      ₱
                      {{ $trans->where('transaction_type_id', 1)->sum('payable_amount') + $trans->where('transaction_type_id', 4)->sum('payable_amount') }}
                    </td>
                    <td class="whitespace-nowrap px-3 py-2 text-sm text-gray-500">&#8369;00</td>
                    <td class="whitespace-nowrap px-3 py-2 text-sm text-gray-500">&#8369;00</td>
                    <td class="whitespace-nowrap px-3 py-2 text-sm text-gray-500">&#8369;00</td>
                    <td class="whitespace-nowrap px-3 py-2 text-sm text-gray-500">&#8369;00</td>
                    <td class="whitespace-nowrap px-3 py-2 text-sm text-gray-500">&#8369;00</td>
                    <td class="whitespace-nowrap bg-gray-500 px-3 py-2 text-sm text-white">

                      ₱
                      {{ $trans->whereIn('transaction_type_id', [1, 3, 4, 6, 8, 9])->sum('payable_amount') }}
                    </td>
                    <td class="whitespace-nowrap bg-gray-500 px-3 py-2 text-sm text-white">
                      ₱
                      {{ $trans->where('transaction_type_id', 2)->sum('payable_amount') }}
                    </td>

                  </tr>
                @endforeach

                <!-- More people... -->
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="mt-2 p-4 border-gray-200 border-2 space-y-4 bg-gray-200">
        <div class="flex justify-between mx-8">
          <span class="font-bold text-sm">TOTAL NEW GUEST</span>
          <span class="font-bold text-sm">99</span>
        </div>
        <div class="flex justify-between mx-8">
          <span class="font-bold text-sm">TOTAL EXTENDED GUEST</span>
          <span class="font-bold text-sm">99</span>
        </div>
        <div class="flex justify-between mx-8">
          <span class="font-bold text-sm">TOTAL # OF SLIP USED</span>
          <span class="font-bold text-sm">99</span>
        </div>
        <div class="flex justify-between mx-8">
          <span class="font-bold text-sm">TOTAL # OF UNOCCUPIED ROOMS</span>
          <span class="font-bold text-sm">99</span>
        </div>
      </div>
    </div>
  </x-modal.card>
</div>
