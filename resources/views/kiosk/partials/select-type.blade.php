<div class="pt-10 ">
  <div class="flex items-end justify-between">
    <div>
      <h1 class="font-bold text-blue-500">CHECK-IN</h1>
      <h1 class="text-5xl uppercase font-extrabold text-gray-500">Select room type</h1>
    </div>
    {{-- <div>
      @if ($steps == 1)
        <a href="{{ route('kiosk.dashboard') }}"
          class="bg-gray-50 outline-blue-500 border border-blue-500 p-2 px-4 flex space-x-1 rounded-full">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
            stroke="currentColor" class="w-6 text-blue-500 h-6">
            <path stroke-linecap="round" stroke-linejoin="round" d="M6.75 15.75L3 12m0 0l3.75-3.75M3 12h18" />
          </svg>
          <span class="font-semibold text-blue-500 uppercase">Back</span>
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
    </div> --}}
  </div>
  <div class="mt-10">
    <div class="grid grid-cols-3 gap-4">
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
        <div class="h-72  rounded-2xl overflow-hidden relative grid place-content-center bg-gray-50 border-2 border-blue-500 {{ $type_id == $type->id ? 'border-green-500' : 'border-blue-500' }} ">
           @switch($type->id)
               @case($type->id == 1)
               <svg class="mx-auto mb-10" width="96" height="96" viewBox="0 0 62 62" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g clip-path="url(#clip0_2_5)">
                <path d="M62 0H0V62H62V0Z" fill="white" fill-opacity="0.01"/>
                <path d="M10.3333 15.5C10.3333 13.3598 12.0682 11.625 14.2083 11.625H47.7917C49.9318 11.625 51.6667 13.3598 51.6667 15.5V29.7083H10.3333V15.5Z" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M7.75 45.2083V50.375" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M54.25 45.2083V50.375" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M37.4583 23.25H24.5417C22.4015 23.25 20.6667 24.9848 20.6667 27.125V29.7083H41.3333V27.125C41.3333 24.9848 39.5985 23.25 37.4583 23.25Z" fill="#2F88FF" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M5.16666 33.5833C5.16666 31.4432 6.90156 29.7083 9.04166 29.7083H52.9583C55.0985 29.7083 56.8333 31.4432 56.8333 33.5833V45.2083H5.16666V33.5833Z" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                </g>
                <defs>
                <clipPath id="clip0_2_5">
                <rect width="62" height="62" fill="white"/>
                </clipPath>
                </defs>
                </svg>
                @break
                @case($type->id == 2)
                <svg class="mx-auto mb-10" width="96" height="96" viewBox="0 0 67 67" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M67 0H0V67H67V0Z" fill="white" fill-opacity="0.01"/>
                    <path d="M8 18.0714C8 15.8228 9.8888 14 12.2188 14H48.7812C51.1113 14 53 15.8228 53 18.0714V33H8V18.0714Z" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M5 50V55" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M56 50V55" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M24.75 26H16.25C13.9027 26 12 27.8803 12 30.2V33H29V30.2C29 27.8803 27.0973 26 24.75 26Z" fill="#2F88FF" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M44.75 26H36.25C33.9027 26 32 27.8803 32 30.2V33H49V30.2C49 27.8803 47.0973 26 44.75 26Z" fill="#2F88FF" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M3 37.25C3 34.9027 4.84683 33 7.125 33H53.875C56.1532 33 58 34.9027 58 37.25V50H3V37.25Z" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                @break
                @case($type->id == 3)
                <div class="flex space-x-4">
                    <svg class="mx-auto mb-10" width="86" height="86" viewBox="0 0 62 62" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_2_5)">
                        <path d="M62 0H0V62H62V0Z" fill="white" fill-opacity="0.01"/>
                        <path d="M10.3333 15.5C10.3333 13.3598 12.0682 11.625 14.2083 11.625H47.7917C49.9318 11.625 51.6667 13.3598 51.6667 15.5V29.7083H10.3333V15.5Z" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                        <path d="M7.75 45.2083V50.375" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                        <path d="M54.25 45.2083V50.375" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                        <path d="M37.4583 23.25H24.5417C22.4015 23.25 20.6667 24.9848 20.6667 27.125V29.7083H41.3333V27.125C41.3333 24.9848 39.5985 23.25 37.4583 23.25Z" fill="#2F88FF" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                        <path d="M5.16666 33.5833C5.16666 31.4432 6.90156 29.7083 9.04166 29.7083H52.9583C55.0985 29.7083 56.8333 31.4432 56.8333 33.5833V45.2083H5.16666V33.5833Z" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                        </g>
                        <defs>
                        <clipPath id="clip0_2_5">
                        <rect width="62" height="62" fill="white"/>
                        </clipPath>
                        </defs>
                        </svg>
                        <svg class="mx-auto mb-10" width="86" height="86" viewBox="0 0 62 62" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_2_5)">
                            <path d="M62 0H0V62H62V0Z" fill="white" fill-opacity="0.01"/>
                            <path d="M10.3333 15.5C10.3333 13.3598 12.0682 11.625 14.2083 11.625H47.7917C49.9318 11.625 51.6667 13.3598 51.6667 15.5V29.7083H10.3333V15.5Z" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M7.75 45.2083V50.375" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M54.25 45.2083V50.375" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M37.4583 23.25H24.5417C22.4015 23.25 20.6667 24.9848 20.6667 27.125V29.7083H41.3333V27.125C41.3333 24.9848 39.5985 23.25 37.4583 23.25Z" fill="#2F88FF" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M5.16666 33.5833C5.16666 31.4432 6.90156 29.7083 9.04166 29.7083H52.9583C55.0985 29.7083 56.8333 31.4432 56.8333 33.5833V45.2083H5.16666V33.5833Z" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                            </g>
                            <defs>
                            <clipPath id="clip0_2_5">
                            <rect width="62" height="62" fill="white"/>
                            </clipPath>
                            </defs>
                            </svg>
                </div>
                @break

               @default
               <svg class="mx-auto mb-10" width="64" height="64" viewBox="0 0 62 62" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g clip-path="url(#clip0_2_5)">
                <path d="M62 0H0V62H62V0Z" fill="white" fill-opacity="0.01"/>
                <path d="M10.3333 15.5C10.3333 13.3598 12.0682 11.625 14.2083 11.625H47.7917C49.9318 11.625 51.6667 13.3598 51.6667 15.5V29.7083H10.3333V15.5Z" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M7.75 45.2083V50.375" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M54.25 45.2083V50.375" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M37.4583 23.25H24.5417C22.4015 23.25 20.6667 24.9848 20.6667 27.125V29.7083H41.3333V27.125C41.3333 24.9848 39.5985 23.25 37.4583 23.25Z" fill="#2F88FF" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M5.16666 33.5833C5.16666 31.4432 6.90156 29.7083 9.04166 29.7083H52.9583C55.0985 29.7083 56.8333 31.4432 56.8333 33.5833V45.2083H5.16666V33.5833Z" stroke="black" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                </g>
                <defs>
                <clipPath id="clip0_2_5">
                <rect width="62" height="62" fill="white"/>
                </clipPath>
                </defs>
                </svg>

           @endswitch

                <h1 class="text-[2rem] font-extrabold uppercase relative text-gray-700">{{ $type->name }}</h1>
        </div>
        </button>
        {{-- <button wire:key="{{ $type->id }}" wire:click="selectType({{ $type->id }})" type="button">
          <div class="h-72  rounded-2xl overflow-hidden relative grid place-content-center bg-gray-50 border-2 border-blue-500 {{ $type_id == $type->id ? 'border-green-500' : 'border-blue-500' }}  ">
            <svg class="h-56 absolute -right-10
            {{ $type_id == $type->id ? 'text-green-600 opacity-40' : 'text-gray-600 opacity-10 ' }}
             top-0" viewBox="0 0 67 66" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M33.5 0C52.0002 0 67 14.7759 67 33C67 51.2241 52.0002 66 33.5 66C14.9998 66 0 51.2241 0 33C0 14.7759 14.9998 0 33.5 0ZM28.8545 16.3926H32.9493C33.6963 16.3926 34.3124 16.9995 34.3124 17.7354V33.2793H48.7124C49.4648 33.2793 50.0755 33.8862 50.0755 34.6221V38.6558C50.0755 39.397 49.4594 39.9985 48.7124 39.9985H27.4859V17.7354C27.4859 16.9941 28.1021 16.3926 28.8545 16.3926ZM33.5 7.49268C47.8018 7.49268 59.3938 18.9116 59.3938 33C59.3938 47.0884 47.8018 58.5073 33.5 58.5073C19.1982 58.5073 7.6062 47.0884 7.6062 33C7.6062 18.917 19.1982 7.49268 33.5 7.49268Z" fill="currentColor"/>
                </svg>


            <h1 class="text-[2rem] font-extrabold uppercase relative text-gray-700">{{ $type->name }}</h1>
          </div>
        </button> --}}
        {{-- reserved svg --}}
          {{-- <svg
              class="h-56 absolute -right-10
            {{ $type_id == $type->id ? 'text-green-600 opacity-40' : 'text-gray-600 opacity-10 ' }}
             top-0"
              xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 28" fill="none">
              <path
                d="M3 6.75C3 4.67893 4.67893 3 6.75 3H21.25C23.3211 3 25 4.67893 25 6.75V21.25C25 23.3211 23.3211 25 21.25 25H15.9242C16.3637 24.5694 16.7277 24.0622 16.9948 23.5H21.25C22.4926 23.5 23.5 22.4926 23.5 21.25V6.75C23.5 5.50736 22.4926 4.5 21.25 4.5H6.75C5.50736 4.5 4.5 5.50736 4.5 6.75V11.0052C3.9378 11.2723 3.43059 11.6363 3 12.0758V6.75ZM15.2503 23.5C14.5661 24.4108 13.4769 25 12.25 25H6.75C4.67893 25 3 23.3211 3 21.25V15.75C3 14.5231 3.58916 13.4339 4.5 12.7497C5.12675 12.279 5.9058 12 6.75 12H12.25C14.3211 12 16 13.6789 16 15.75V21.25C16 22.0942 15.721 22.8733 15.2503 23.5ZM4.5 15.75V21.25C4.5 22.4926 5.50736 23.5 6.75 23.5H12.25C13.4926 23.5 14.5 22.4926 14.5 21.25V15.75C14.5 14.5074 13.4926 13.5 12.25 13.5H6.75C5.50736 13.5 4.5 14.5074 4.5 15.75Z"
                fill="currentColor"></path>
            </svg> --}}
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
