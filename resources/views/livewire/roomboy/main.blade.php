<div class="grid max-w-full grid-cols-1 gap-6 mx-auto mt-5 lg:max-w-full lg:grid-flow-col-dense lg:grid-cols-1">
    <div class="space-y-6 lg:col-span-2 lg:col-start-1">
        <section aria-labelledby="applicant-information-title">
          <div class="bg-white border-b border-x rounded-md shadow-lg">
            <div x-cloak x-data="{ activeTab: '{{ request()->get('floor', $floors[0]->id ?? null) }}' }" class="rounded-md px-4 py-5 sm:px-6">
                <h2 id="applicant-information-title" class="text-lg font-medium leading-6 text-gray-900">
                    Your Assigned Floors ({{ $floors->count() }})
                </h2>
                @if($floors && count($floors))
                    <div class="flex">
                        <!-- Tabs Sidebar -->
                        <nav class="flex flex-col w-48 border-r border-gray-200 bg-white mt-5" aria-label="Floors Tabs">
                            @foreach($floors as $floor)
                                <button
                                    type="button" wire:click="getSelectedFloor({{ $floor->id }})"
                                    @click="activeTab = '{{ $floor->id }}'"
                                    :class="[
                                        activeTab == '{{ $floor->id }}'
                                            ? 'text-[#009ff4] border-l-4 border-[#009ff4] bg-blue-50'
                                            : 'text-gray-600 hover:text-[#009ff4] hover:bg-blue-50',
                                        'group flex items-center gap-2 px-4 py-3 text-sm font-medium transition-all duration-200 focus:outline-none'
                                    ]"
                                >
                                    <svg class="w-4 h-4 transition-colors duration-200"
                                        :class="activeTab == '{{ $floor->id }}'
                                            ? 'text-[#009ff4]'
                                            : 'text-gray-500 group-hover:text-[#009ff4]'"
                                        xmlns="http://www.w3.org/2000/svg"
                                        fill="none"
                                        viewBox="0 0 24 24"
                                        stroke-width="1.5"
                                        stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M6.429 9.75 2.25 12l4.179 2.25m0-4.5 5.571 3 5.571-3m-11.142 0L2.25 7.5 12 2.25l9.75 5.25-4.179 2.25m0 0L21.75 12l-4.179 2.25m0 0 4.179 2.25L12 21.75 2.25 16.5l4.179-2.25m11.142 0-5.571 3-5.571-3" />
                                    </svg>
                                    {{ $floor->numberWithFormat() }}
                                </button>
                            @endforeach
                        </nav>

                        <!-- Main Content -->
                        <div class="flex-1 p-4">
                            @foreach($floors as $floor)
                                {{-- Currently Cleaning --}}
                                <div class="mt-1 p-4 border bg-gray-50" x-show="activeTab == '{{ $floor->id }}'">
                                    @php
                                        $room_id = App\Models\Room::where('id', auth()->user()->roomboy_cleaning_room_id)->where('floor_id', $floor->id)->first();
                                        $room = App\Models\Room::where('id', auth()->user()->roomboy_cleaning_room_id)->where('floor_id', $floor->id)->first()?->numberWithFormat();
                                        $start = App\Models\Room::where('id', auth()->user()->roomboy_cleaning_room_id)->where('floor_id', $floor->id)->first()?->started_cleaning_at;
                                    @endphp
                                    <h3 class="text-lg font-semibold mb-4">Currently Cleaning</h3>
                                    @if ($room)
                                        <div class="grid grid-cols-6 gap-4 mb-4">
                                            <div class="col-span-1 shadow-lg border p-4 border-[#009ff4] flex flex-col items-center justify-center text-center rounded-md">
                                                <span class="font-medium uppercase">{{ $room }}</span>
                                                 <div class="flex space-x-3 mt-2">
                                                    <span>Time Started:</span>
                                                    <span>{{ \Carbon\Carbon::parse($start)->diffForHumans() }}</span>
                                                </div>
                                                 <div class="mt-1">
                                                    <x-button label="Finish Cleaning" class="bg-[#009ff4] text-white hover:bg-[#017dc0]" right-icon="arrow-narrow-right"
                                                        x-on:confirm="{
                                                        title: 'Are you sure? you want to finish cleaning this room?',
                                                        icon: 'question',
                                                        method: 'finishCleaning',
                                                        params: [{{ $room_id->id }}]
                                                    }" />
                                                </div>
                                            </div>

                                        </div>
                                    @else
                                        <div class="mb-2">
                                            <span class="font-medium">No room currently being cleaned on this floor</span>
                                        </div>
                                    @endif
                                </div>
                                {{-- Uncleaned Rooms --}}
                                <div class="mt-1 p-4 border bg-gray-50" x-show="activeTab == '{{ $floor->id }}'">
                                    <h3 class="text-lg font-semibold mb-4">Uncleaned Rooms</h3>
                                    @forelse ($rooms as $record)
                                    <div class="grid grid-cols-6 gap-4 mb-4">
                                        <div class="col-span-1 shadow-lg border p-4 border-[#009ff4] flex flex-col items-center justify-center text-center rounded-md">
                                            <span class="font-medium uppercase">Room # {{ $record->number }}</span>
                                            <span class="text-sm text-gray-600">({{ $record->status }})</span>
                                            <span class="text-xs text-gray-500">Time to Clean: {{ $record->time_to_clean }}</span>
                                        </div>
                                    </div>

                                    @empty
                                        <div class="mb-2">
                                            <span class="font-medium">No uncleaned rooms on this floor</span>
                                        </div>

                                    @endforelse
                                </div>
                            @endforeach
                        </div>
                    </div>
                @endif
            </div>
          </div>
        </section>
    </div>
</div>
