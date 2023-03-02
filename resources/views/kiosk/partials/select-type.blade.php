<div class="pt-10 ">
  <div class="flex items-end justify-between">
    <div>
      <h1 class="font-bold text-green-400">CHECK-IN</h1>
      <h1 class="text-5xl uppercase font-extrabold text-gray-50">Select room type</h1>
    </div>
    <div>
      @if ($steps == 1)
        <a href="{{ route('kiosk.dashboard') }}"
          class="bg-gradient-to-r from-red-500 via-red-500 to-transparent p-2 px-4 flex space-x-1 rounded-full">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
            stroke="currentColor" class="w-6 text-white h-6">
            <path stroke-linecap="round" stroke-linejoin="round" d="M6.75 15.75L3 12m0 0l3.75-3.75M3 12h18" />
          </svg>
          <span class="font-semibold text-gray-100 uppercase">Back</span>
        </a>
      @else
        <button x-on:click="step--"
          class="bg-gradient-to-r from-red-500 via-red-500 to-transparent p-2 px-4 flex space-x-1 rounded-full">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
            stroke="currentColor" class="w-6 text-white h-6">
            <path stroke-linecap="round" stroke-linejoin="round" d="M6.75 15.75L3 12m0 0l3.75-3.75M3 12h18" />
          </svg>
          <span class="font-semibold text-gray-100 uppercase">Back</span>
        </button>
      @endif
    </div>
  </div>
  <div class="mt-10">
    <div class="grid grid-cols-4 gap-4">
      {{-- @foreach ($types as $type)
        <button wire:key="{{ $type->id }}" x-on:click="$wire.getRooms({{ $type->id }}); step = 2;" type="button"
          @class([
              'p-16 text-2xl font-bold text-white uppercase border-2 shadow-lg rounded-xl bg-white/30 focus:bg-white/50',
              'border-white' => $type->id != $typeId,
              'border-red-600' => $type->id == $typeId,
          ])>
          {{ $type->name }}
        </button>
      @endforeach --}}

      @foreach ($types as $type)
        <button wire:key="{{ $type->id }}" wire:click="selectType({{ $type->id }})" type="button">
          <div class="h-56  rounded-2xl overflow-hidden relative grid place-content-center bg-gray-50">
            <svg
              class="h-56 absolute -right-10 
            {{ $type_id == $type->id ? 'text-green-600 opacity-40' : 'text-gray-600 opacity-10 ' }}
             top-0"
              xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 28" fill="none">
              <path
                d="M3 6.75C3 4.67893 4.67893 3 6.75 3H21.25C23.3211 3 25 4.67893 25 6.75V21.25C25 23.3211 23.3211 25 21.25 25H15.9242C16.3637 24.5694 16.7277 24.0622 16.9948 23.5H21.25C22.4926 23.5 23.5 22.4926 23.5 21.25V6.75C23.5 5.50736 22.4926 4.5 21.25 4.5H6.75C5.50736 4.5 4.5 5.50736 4.5 6.75V11.0052C3.9378 11.2723 3.43059 11.6363 3 12.0758V6.75ZM15.2503 23.5C14.5661 24.4108 13.4769 25 12.25 25H6.75C4.67893 25 3 23.3211 3 21.25V15.75C3 14.5231 3.58916 13.4339 4.5 12.7497C5.12675 12.279 5.9058 12 6.75 12H12.25C14.3211 12 16 13.6789 16 15.75V21.25C16 22.0942 15.721 22.8733 15.2503 23.5ZM4.5 15.75V21.25C4.5 22.4926 5.50736 23.5 6.75 23.5H12.25C13.4926 23.5 14.5 22.4926 14.5 21.25V15.75C14.5 14.5074 13.4926 13.5 12.25 13.5H6.75C5.50736 13.5 4.5 14.5074 4.5 15.75Z"
                fill="currentColor"></path>
            </svg>
            <h1 class="text-[2rem] font-extrabold uppercase relative text-gray-700">{{ $type->name }}</h1>
          </div>
        </button>
      @endforeach
    </div>
  </div>
  <div class="fixed bottom-20 right-0 left-0">
    <div class="flex justify-center">
      @if ($type_id)
        <x-button label="NEXT" wire:click="$set('steps', 2)" lg class="font-medium " right-icon="chevron-double-right"
          green />
      @endif
    </div>
  </div>
</div>
