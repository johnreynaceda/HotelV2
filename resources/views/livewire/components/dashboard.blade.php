<div>
    <div class="flex flex-col items-center">
        <div class="w-full mb-8">
            <dl class="grid grid-cols-1 sm:grid-cols-2 gap-12">
                <!-- Checked In Today -->
                <div class="relative overflow-hidden rounded-lg bg-white px-4 pt-5 shadow sm:px-6 sm:pt-6 flex flex-col items-start min-w-[220px] border border-gray-300">
                    <p class="truncate text-md font-semibold text-gray-500 text-left w-full">Checked In Today</p>
                    <dd class="mt-5 flex items-baseline pb-6 sm:pb-7 justify-start w-full">
                        <div class="flex flex-col items-start">
                            <p class="text-5xl font-semibold text-blue-500">{{ $check_in_today }}</p>
                            <p class="text-sm text-gray-500 text-left">Guest</p>
                        </div>
                    </dd>
                </div>
                <!-- Checked Out Today -->
                <div class="relative overflow-hidden rounded-lg bg-white px-4 pt-5 shadow sm:px-6 sm:pt-6 flex flex-col items-start min-w-[220px] border border-gray-300">
                    <p class="truncate text-md font-semibold text-gray-500 text-left w-full">Checked Out Today</p>
                    <dd class="mt-5 flex items-baseline pb-6 sm:pb-7 justify-start w-full">
                        <div class="flex flex-col items-start">
                            <p class="text-5xl font-semibold text-blue-500">{{ $check_out_today }}</p>
                            <p class="text-sm text-gray-500 text-left">Guest</p>
                        </div>
                    </dd>
                </div>
            </dl>
        </div>

        <div class="w-full">
             <div class="flex justify-between items-center mb-4">
            <h2 class="text-lg font-semibold text-[#009ff4] uppercase">{{$cardLabel}}</h2>
            <div>
                <select id="chartFilter" wire:model="cardFilter" class="w-36 border border-[#009ff4] rounded-md px-3 py-2 text-sm focus:ring-2 focus:ring-[#009ff4] focus:border-[#009ff4] text-[#009ff4] bg-white font-semibold shadow-sm transition">
                    <option value="today">Today</option>
                    <option value="week">This Week</option>
                    <option value="month">This Month</option>
                    <option value="year">This Year</option>
                    <option value="overall">Overall</option>
                </select>
            </div>
            </div>
            <dl class="grid grid-cols-1 sm:grid-cols-4 gap-12">
                <!-- Total Check In -->
                <div class="relative overflow-hidden rounded-lg bg-white px-4 pt-5 shadow sm:px-6 sm:pt-6 flex flex-col items-start min-w-[220px] border border-gray-300">
                    <p class="truncate text-md font-semibold text-gray-500 text-left w-full">Total Check In</p>
                    <dd class="mt-5 flex items-baseline pb-6 sm:pb-7 justify-start w-full">
                        <div class="flex flex-col items-start">
                            <p class="text-5xl font-semibold text-gray-700">{{ $total_check_in }}</p>
                            <p class="text-sm text-gray-500 text-left">Guest</p>
                        </div>
                    </dd>
                </div>
                <!-- Total Check Out -->
                <div class="relative overflow-hidden rounded-lg bg-white px-4 pt-5 shadow sm:px-6 sm:pt-6 flex flex-col items-start min-w-[220px] border border-gray-300">
                    <p class="truncate text-md font-semibold text-gray-500 text-left w-full">Total Check Out</p>
                    <dd class="mt-5 flex items-baseline pb-6 sm:pb-7 justify-start w-full">
                        <div class="flex flex-col items-start">
                            <p class="text-5xl font-semibold text-gray-700">{{ $total_check_out }}</p>
                            <p class="text-sm text-gray-500 text-left">Guest</p>
                        </div>
                    </dd>
                </div>
                <!-- Total Available Rooms -->
                <div class="relative overflow-hidden rounded-lg bg-white px-4 pt-5 shadow sm:px-6 sm:pt-6 flex flex-col items-start min-w-[220px] border border-gray-300">
                    <p class="truncate text-md font-semibold text-gray-500 text-left w-full">Total Available Rooms</p>
                    <dd class="mt-5 flex items-baseline pb-6 sm:pb-7 justify-start w-full">
                        <div class="flex flex-col items-start">
                            <p class="text-5xl font-semibold text-gray-700">{{ $total_available_rooms }}</p>
                            <p class="text-sm text-gray-500 text-left">Rooms</p>
                        </div>
                    </dd>
                </div>
                <!-- Total Cleaning Rooms -->
                <div class="relative overflow-hidden rounded-lg bg-white px-4 pt-5 shadow sm:px-6 sm:pt-6 flex flex-col items-start min-w-[220px] border border-gray-300">
                    <p class="truncate text-md font-semibold text-gray-500 text-left w-full">Total Cleaning Rooms</p>
                    <dd class="mt-5 flex items-baseline pb-6 sm:pb-7 justify-start w-full">
                        <div class="flex flex-col items-start">
                            <p class="text-5xl font-semibold text-gray-700">{{ $total_cleaning_rooms }}</p>
                            <p class="text-sm text-gray-500 text-left">Rooms</p>
                        </div>
                    </dd>
                </div>
            </dl>
        </div>
    </div>
      <div>
        <dl class="mt-5 grid grid-cols-1 gap-5">


          @if(auth()->user()->hasRole('admin') || auth()->user()->hasRole('superadmin') || auth()->user()->hasRole(roles: 'back_office'))
            <div class="w-full ">
                <livewire:components.chart />
            </div>
          @endif
        </dl>
        {{-- chart --}}
        @if(auth()->user()->hasRole('frontdesk'))
        <div class="px-4">
            <livewire:components.chart />
        </div>
        @endif
        {{-- @if(auth()->user()->hasRole('kitchen'))
        <div class="px-4">
            <livewire:components.chart />
        </div>
        @endif --}}
      </div>
</div>
