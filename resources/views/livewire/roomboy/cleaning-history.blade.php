<div class="grid max-w-full grid-cols-1 gap-6 mx-auto mt-5 lg:max-w-full lg:grid-flow-col-dense lg:grid-cols-1">
    <div class="space-y-6 lg:col-span-2 lg:col-start-1">
        <section aria-labelledby="applicant-information-title">
          <div class="bg-white border-b border-x rounded-md shadow-lg">
              <div class="px-4 py-5 sm:px-6 flex justify-between items-center">
                  <h2 id="applicant-information-title" class="text-lg font-medium leading-6 text-gray-900">
                   Cleaning History
                </h2>
                 <a href="{{ route('roomboy.dashboard') }}"
                      class="px-4 py-2 flex items-center text-gray-50 bg-[#009ff4] rounded-full hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-50">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                        stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M15.75 19.5L8.25 12l7.5-7.5" />
                    </svg>
                      <span class="ml-1 hidden xl:block">
                        Back
                      </span>
                    </a>
              </div>
              <div class="flex space-x-4 hide-div p-4 items-center">
                <x-input label="From" type="date" wire:model="date_from" class="h-10 text-base" placeholder="Date From" />
                <x-input label="To" type="date" wire:model="date_to" class="h-10 text-base" placeholder="Date To" />
                 <x-native-select label="Status" wire:model="status" class="h-10 text-base">
                    <option value="">ALL</option>
                    <option value="T">On Time</option>
                    <option value="OT">Overtime</option>
                    <option value="ADV">Advanced</option>
                </x-native-select>
               </div>
              <div class="p-4">
                <table class="min-w-full divide-y divide-gray-200 rounded-md overflow-hidden shadow">
                    <thead class="bg-[#009ff4]">
                        <tr>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-bold text-white uppercase tracking-wider">
                                Roomboy
                            </th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-bold text-white uppercase tracking-wider">
                                Floor
                            </th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-bold text-white uppercase tracking-wider">
                                Room #
                            </th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-bold text-white uppercase tracking-wider">
                                Start Time
                            </th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-bold text-white uppercase tracking-wider">
                                End Time
                            </th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-bold text-white uppercase tracking-wider">
                                Duration
                            </th>
                             <th scope="col" class="px-6 py-3 text-left text-xs font-bold text-white uppercase tracking-wider">
                                Status
                            </th>
                             <th scope="col" class="px-6 py-3 text-left text-xs font-bold text-white uppercase tracking-wider">
                                OT Mins/Hrs
                            </th>
                             <th scope="col" class="px-6 py-3 text-left text-xs font-bold text-white uppercase tracking-wider">
                                ADV Mins/Hrs
                            </th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-100">
                        @forelse ($histories as $record)
                            @php
                                $duration = $record->cleaning_duration; // duration in minutes
                                $status = 'On Time';
                                $ot = null;
                                $adv = null;

                                if ($duration > 15) {
                                    $status = 'Overtime';
                                    $ot = $duration - 15;
                                } elseif ($duration < 15) {
                                    $status = 'Advanced';
                                    $adv = 15 - $duration;
                                }
                            @endphp

                            <tr>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 uppercase">{{ $record->user->name }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 uppercase">{{ $record->room->floor->numberWithFormat() }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 uppercase">{{ $record->room->numberWithFormat() }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ \Carbon\Carbon::parse($record->start_time)->format('F d, Y g:i A') }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ \Carbon\Carbon::parse($record->end_time)->format('F d, Y g:i A') }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ $duration }} minutes</td>

                                <!-- Status -->
                                <td class="px-6 py-4 whitespace-nowrap text-sm">
                                    <span class="px-2 py-1 rounded text-xs font-semibold
                                        @if ($status === 'On Time') bg-green-100 text-green-700
                                        @elseif ($status === 'Overtime') bg-red-100 text-red-700
                                        @else bg-yellow-100 text-yellow-700 @endif">
                                        {{ $status }}
                                    </span>
                                </td>

                                <!-- Overtime -->
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                    @if ($ot)
                                        @php
                                            $hours = intdiv($ot, 60);
                                            $mins = $ot % 60;
                                        @endphp

                                        {{ $hours > 0 ? $hours . ' hr(s)' : '' }}
                                        {{ $mins > 0 ? $mins . ' min(s)' : '' }}
                                    @else
                                        -
                                    @endif
                                </td>

                                <!-- Advanced -->
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                    @if ($adv)
                                        @php
                                            $hours = intdiv($adv, 60);
                                            $mins = $adv % 60;
                                        @endphp

                                        {{ $hours > 0 ? $hours . ' hr(s)' : '' }}
                                        {{ $mins > 0 ? $mins . ' min(s)' : '' }}
                                    @else
                                        -
                                    @endif
                                </td>

                            </tr>
                        @empty
                            <tr>
                                <td colspan="9" class="px-6 py-4 whitespace-nowrap text-sm italic text-gray-500 text-center">
                                    No cleaning history found.
                                </td>
                            </tr>
                        @endforelse
                    </tbody>

                </table>
              </div>
          </div>
        </section>
    </div>
</div>
