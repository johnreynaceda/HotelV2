<div class="pt-10 px-4 sm:px-6 lg:px-8">
  <div class="flex flex-col sm:flex-row items-start sm:items-end justify-between gap-4">
    <div>
      <h1 class="font-bold text-blue-500 text-lg sm:text-xl md:text-2xl">CHECK-IN</h1>
      <h1 class="text-3xl sm:text-4xl md:text-5xl uppercase font-extrabold text-gray-500">Select room type</h1>
    </div>
  </div>
  <div class="mt-10">
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4">

      @foreach ($types as $type)
      <button wire:key="{{ $type->id }}" wire:click="selectType({{ $type->id }})" type="button">
        <div class="h-56 sm:h-64 md:h-72 rounded-2xl overflow-hidden relative grid place-content-center bg-gray-50 border-4 transition-all duration-200 {{ $type_id == $type->id ? 'border-green-500' : 'border-blue-500' }}">
          @switch(true)
              @case($type->id == 1)
                <!-- SVG Icon 1 -->
                <svg class="mx-auto mb-4 w-16 h-16 sm:w-20 sm:h-20 md:w-24 md:h-24" viewBox="0 0 62 62" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <!-- SVG content -->
                </svg>
                @break
              @case($type->id == 2)
                <!-- SVG Icon 2 -->
                <svg class="mx-auto mb-4 w-16 h-16 sm:w-20 sm:h-20 md:w-24 md:h-24" viewBox="0 0 67 67" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <!-- SVG content -->
                </svg>
                @break
              @case($type->id == 3)
                <!-- Double SVG for type 3 -->
                <div class="flex justify-center gap-2">
                  <svg class="w-14 h-14 md:w-20 md:h-20" viewBox="0 0 62 62" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <!-- SVG content -->
                  </svg>
                  <svg class="w-14 h-14 md:w-20 md:h-20" viewBox="0 0 62 62" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <!-- SVG content -->
                  </svg>
                </div>
                @break
              @default
                <svg class="mx-auto mb-4 w-16 h-16 sm:w-20 sm:h-20 md:w-24 md:h-24" viewBox="0 0 62 62" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <!-- SVG content -->
                </svg>
          @endswitch
        </div>
      </button>
      @endforeach

    </div>
  </div>
</div>
