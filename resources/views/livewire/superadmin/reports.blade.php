<div x-data>
    <div>
      <h2 class="text-xl font-medium text-[#009ff4] uppercase">Super Admin Reports</h2>
      <ul role="list" class="mt-3 grid grid-cols-1 gap-5 sm:grid-cols-2 sm:gap-6 lg:grid-cols-3">
        <li class="col-span-1 flex rounded-md overflow-auto shadow-sm">
          <div
            class="flex w-16 flex-shrink-0 items-center justify-center bg-blue-600 rounded-l-md text-sm font-medium text-white">
            <svg class="w-10 h-10" xmlns="http://www.w3.org/2000/svg" fill="currentColor" stroke="none" viewBox="0 0 24 24">
              <path
                d="m20 8-6-6H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8zM9 19H7v-9h2v9zm4 0h-2v-6h2v6zm4 0h-2v-3h2v3zM14 9h-1V4l5 5h-4z">
              </path>
            </svg>
          </div>
          <div
            class="flex flex-1 items-center justify-between truncate rounded-r-md border-t border-r border-b border-gray-200 bg-white">
            <div class="flex-1 truncate px-4 py-4 text-sm">
              <a href="#" class="font-medium text-gray-700 text-lg uppercase hover:text-gray-600">ROOMS</a>
            </div>
            <div class="flex-shrink-0 pr-2">
              <x-button.circle gray icon="arrow-right" wire:click="openReport(1)" spinner="openReport(1)" />
            </div>
          </div>
        </li>
        <li class="col-span-1 flex rounded-md overflow-auto shadow-sm">
          <div
            class="flex w-16 flex-shrink-0 items-center justify-center bg-blue-600 rounded-l-md text-sm font-medium text-white">
            <svg class="w-10 h-10" xmlns="http://www.w3.org/2000/svg" fill="currentColor" stroke="none"
              viewBox="0 0 24 24">
              <path
                d="m20 8-6-6H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8zM9 19H7v-9h2v9zm4 0h-2v-6h2v6zm4 0h-2v-3h2v3zM14 9h-1V4l5 5h-4z">
              </path>
            </svg>
          </div>
          <div
            class="flex flex-1 items-center justify-between truncate rounded-r-md border-t border-r border-b border-gray-200 bg-white">
            <div class="flex-1 truncate px-4 py-4 text-sm">
              <a href="#" class="font-medium text-gray-700 text-lg uppercase hover:text-gray-600">EXPENSES</a>
            </div>
            <div class="flex-shrink-0 pr-2">
              <x-button.circle gray icon="arrow-right" wire:click="openReport(2)" spinner="openReport(2)" />
            </div>
          </div>
        </li>
        <li class="col-span-1 flex rounded-md overflow-auto shadow-sm">
          <div
            class="flex w-16 flex-shrink-0 items-center justify-center bg-blue-600 rounded-l-md text-sm font-medium text-white">
            <svg class="w-10 h-10" xmlns="http://www.w3.org/2000/svg" fill="currentColor" stroke="none"
              viewBox="0 0 24 24">
              <path
                d="m20 8-6-6H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8zM9 19H7v-9h2v9zm4 0h-2v-6h2v6zm4 0h-2v-3h2v3zM14 9h-1V4l5 5h-4z">
              </path>
            </svg>
          </div>
          <div
            class="flex flex-1 items-center justify-between truncate rounded-r-md border-t border-r border-b border-gray-200 bg-white">
            <div class="flex-1 truncate px-4 py-4 text-sm">
              <a href="#" class="font-medium text-gray-700 text-lg uppercase hover:text-gray-600">SALES</a>
            </div>
            <div class="flex-shrink-0 pr-2">
              <x-button.circle gray icon="arrow-right" wire:click="openReport(3)" spinner="openReport(3)" />
            </div>
          </div>
        </li>

      </ul>
    </div>

    {{-- <x-modal.card wire:model.defer="report_modal" fullscreen>
      <div class="mx-auto max-w-7xl">

        <div class="">
          @switch($report_type)
            @case(1)
              <div class="mt-2">
                @include('back-office.Reports.new-guest')
              </div>
            @break

            @case(2)
              <div class="mt-2">
                @include('back-office.Reports.checkout-guest')
              </div>
            @break

            @case(3)
              <div class="mt-2">
                @include('back-office.Reports.guest-per-room-type')
              </div>
            @break

            @case(4)
              <div class="mt-2">
                @include('back-office.Reports.roomboy-report')
              </div>
            @break

            @case(5)
              <div class="mt-2">
                @include('back-office.Reports.unoccupied-room')
              </div>
            @break

            @case(6)
              <div class="mt-2">
                @include('back-office.Reports.extended-guest')
              </div>
            @break

            @case(7)
            <div class="mt-2">
              @include('back-office.Reports.sales')
            </div>
            @break

            @default
          @endswitch
        </div>
      </div>
      <x-slot name="footer">
        <div class="flex justify-end gap-x-4">
          <x-button flat label="Cancel" x-on:click="close" />
          <x-button @click="printOut($refs.printContainer.outerHTML);" positive label="Print Report" icon="" />
        </div>
      </x-slot>

    </x-modal.card> --}}
  </div>
