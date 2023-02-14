<div>
  <div class="p-4 bg-white rounded-xl">
    <div class="grid grid-cols-2 gap-10">
      <div>
        <div class="header flex space-x-2 text-green-700 items-center py-2 border-y">
          <svg class="w-8 h-8" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="none">
            <path
              d="M7.18301 2.11333C7.29885 2.01836 7.45117 1.98034 7.59806 2.00971L12.5981 3.00971C12.8318 3.05646 13 3.26166 13 3.5V12.4969C13 12.7352 12.8318 12.9404 12.5981 12.9872L7.59806 13.9872C7.45117 14.0166 7.29885 13.9785 7.18301 13.8836C7.06716 13.7886 7 13.6467 7 13.4969V2.5M10 7.99841C10 7.72227 9.77614 7.49841 9.5 7.49841C9.22386 7.49841 9 7.72227 9 7.99841C9 8.27456 9.22386 8.49841 9.5 8.49841C9.77614 8.49841 10 8.27456 10 7.99841Z"
              fill="currentColor"></path>
            <path d="M6 3H3.5C3.22386 3 3 3.22386 3 3.5V12.4969C3 12.773 3.22386 12.9969 3.5 12.9969H6V3Z"
              fill="currentColor"></path>
            <path d="M7.18301 2.11333C7.06716 2.2083 7 2.35021 7 2.5Z" fill="currentColor"></path>
          </svg>
          <span class="font-semibold text-xl">PRIORITY ROOMS</span>
        </div>
        {{-- <div class="mt-3 grid grid-cols-2 gap-4" x-animate>
          @forelse ($types as $type)
           
            <div
              class="rounded-lg bg-gradient-to-br relative from-gray-300 overflow-hidden p-5 via-gray-200 to-gray-100">
              <div class="font-bold text-xl text-gray-600">{{ $room->numberWithFormat() }}</div>
              <div class="text-xs">{{ $room->floor->numberWithFormat() }}</div>

              <svg class="w-28 h-28 absolute text-green-600 opacity-20 -top-2 -right-2" fill="currentColor"
                xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                <!--! Font Awesome Free 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. -->
                <path
                  d="M336 352c97.2 0 176-78.8 176-176S433.2 0 336 0S160 78.8 160 176c0 18.7 2.9 36.8 8.3 53.7L7 391c-4.5 4.5-7 10.6-7 17v80c0 13.3 10.7 24 24 24h80c13.3 0 24-10.7 24-24V448h40c13.3 0 24-10.7 24-24V384h40c6.4 0 12.5-2.5 17-7l33.3-33.3c16.9 5.4 35 8.3 53.7 8.3zm40-176c-22.1 0-40-17.9-40-40s17.9-40 40-40s40 17.9 40 40s-17.9 40-40 40z">
                </path>
              </svg>

              <div class="absolute top-2 right-2">
                <x-button.circle icon="trash" wire:click="removePriority({{ $room->id }})" negative />
              </div>
            </div>
          @empty
            <div class="mt-3">
              <h1>No Priority rooms available</h1>
            </div>
          @endforelse
        </div> --}}

        <div class="mt-3">
          @foreach ($types as $type)
            <div>
              <h1 class="font-bold text-gray-600 text-xl uppercase">{{ $type->name }}</h1>
            </div>
            @php
              $rooms = \App\Models\Room::where('type_id', $type->id)
                  ->where('is_priority', true)
                  ->with('floor')
                  ->orderBy('number', 'asc')
                  ->get();
            @endphp
            <div class="mt-1 grid grid-cols-2 gap-4 mb-2" x-animate>
              @forelse ($rooms as $room)
                <div
                  class="rounded-lg bg-gradient-to-br relative from-gray-300 overflow-hidden p-5 via-gray-200 to-gray-100">
                  <div class="font-bold text-xl text-gray-600">{{ $room->numberWithFormat() }}</div>
                  <div class="text-xs">{{ $room->floor->numberWithFormat() }}</div>

                  <svg class="w-28 h-28 absolute text-green-600 opacity-20 -top-2 -right-2" fill="currentColor"
                    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <!--! Font Awesome Free 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. -->
                    <path
                      d="M336 352c97.2 0 176-78.8 176-176S433.2 0 336 0S160 78.8 160 176c0 18.7 2.9 36.8 8.3 53.7L7 391c-4.5 4.5-7 10.6-7 17v80c0 13.3 10.7 24 24 24h80c13.3 0 24-10.7 24-24V448h40c13.3 0 24-10.7 24-24V384h40c6.4 0 12.5-2.5 17-7l33.3-33.3c16.9 5.4 35 8.3 53.7 8.3zm40-176c-22.1 0-40-17.9-40-40s17.9-40 40-40s40 17.9 40 40s-17.9 40-40 40z">
                    </path>
                  </svg>

                  <div class="absolute top-2 right-2">
                    <x-button.circle icon="trash" wire:click="removePriority({{ $room->id }})" negative />
                  </div>
                </div>
              @empty
                <div class="mt-3">
                  <h1>No Priority rooms available</h1>
                </div>
              @endforelse
            </div>
          @endforeach
        </div>
      </div>
      <div>
        <div class="header flex space-x-2 text-red-700 items-center py-2 border-y">
          <svg class="w-8 h-8" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="none">
            <path
              d="M7.18301 2.11333C7.29885 2.01836 7.45117 1.98034 7.59806 2.00971L12.5981 3.00971C12.8318 3.05646 13 3.26166 13 3.5V12.4969C13 12.7352 12.8318 12.9404 12.5981 12.9872L7.59806 13.9872C7.45117 14.0166 7.29885 13.9785 7.18301 13.8836C7.06716 13.7886 7 13.6467 7 13.4969V2.5M10 7.99841C10 7.72227 9.77614 7.49841 9.5 7.49841C9.22386 7.49841 9 7.72227 9 7.99841C9 8.27456 9.22386 8.49841 9.5 8.49841C9.77614 8.49841 10 8.27456 10 7.99841Z"
              fill="currentColor"></path>
            <path d="M6 3H3.5C3.22386 3 3 3.22386 3 3.5V12.4969C3 12.773 3.22386 12.9969 3.5 12.9969H6V3Z"
              fill="currentColor"></path>
            <path d="M7.18301 2.11333C7.06716 2.2083 7 2.35021 7 2.5Z" fill="currentColor"></path>
          </svg>
          <span class="font-semibold text-xl">AVAILABLE ROOMS (CLEANED ROOM)</span>
        </div>
        <div class="mt-3 flex justify-between">
          <div class="flex space-x-2">
            <x-native-select wire:model="filter">
              <option selected hidden>Select Type</option>
              @foreach ($types as $type)
                <option value="{{ $type->id }}">{{ $type->name }}</optionv>
              @endforeach
            </x-native-select>
            <x-button.circle icon="refresh" slate spinner />
          </div>
          <div class="search flex items-center rounded-lg  px-3 py-1 w-72 border border-gray-200 shadow-sm">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="fill-gray-500" width="24"
              height="24">
              <path fill="none" d="M0 0h24v24H0z" />
              <path
                d="M11 2c4.968 0 9 4.032 9 9s-4.032 9-9 9-9-4.032-9-9 4.032-9 9-9zm0 16c3.867 0 7-3.133 7-7 0-3.868-3.133-7-7-7-3.868 0-7 3.132-7 7 0 3.867 3.132 7 7 7zm8.485.071l2.829 2.828-1.415 1.415-2.828-2.829 1.414-1.414z" />
            </svg>
            <input type="text" wire:model="search"
              class="outline:none  h-8 focus:ring-0 flex-1 border-0 focus:border-0" placeholder="Search">
          </div>
        </div>
        <div class="mt-3 grid grid-cols-2 gap-4" x-animate>
          @forelse ($available_rooms as $room)
            <div
              class="rounded-lg bg-gradient-to-br relative from-gray-300 overflow-hidden p-5 via-gray-200 to-gray-100">
              <div class="font-bold text-xl text-gray-600">{{ $room->numberWithFormat() }}</div>
              <div class="text-xs uppercase">{{ $room->floor->numberWithFormat() }}</div>
              <div class="mt-3 relative z-10">
                <x-button wire:click="setPriority({{ $room->id }})" label="Set as Priority"
                  right-icon="arrow-narrow-right" negative class="w-full" />
              </div>
              <svg class="w-40 h-40 absolute text-red-600 opacity-20 -top-2 -right-2" fill="currentColor"
                xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                <!--! Font Awesome Free 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. -->
                <path
                  d="M336 352c97.2 0 176-78.8 176-176S433.2 0 336 0S160 78.8 160 176c0 18.7 2.9 36.8 8.3 53.7L7 391c-4.5 4.5-7 10.6-7 17v80c0 13.3 10.7 24 24 24h80c13.3 0 24-10.7 24-24V448h40c13.3 0 24-10.7 24-24V384h40c6.4 0 12.5-2.5 17-7l33.3-33.3c16.9 5.4 35 8.3 53.7 8.3zm40-176c-22.1 0-40-17.9-40-40s17.9-40 40-40s40 17.9 40 40s-17.9 40-40 40z">
                </path>
              </svg>
            </div>
          @empty
          @endforelse
        </div>
      </div>
    </div>
  </div>
</div>
