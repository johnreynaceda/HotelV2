<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title>{{ config('app.name', 'Laravel') }}</title>

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;600;700;800;900&display=swap"
    rel="stylesheet">
    
  <link rel="manifest" href="{{ asset('manifest.webmanifest') }}">

  <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">
  <style>
    /* width */
    ::-webkit-scrollbar {
      width: 5px;
    }

    /* Track */
    ::-webkit-scrollbar-track {
      background: #f1f1f1;
    }

    /* Handle */
    ::-webkit-scrollbar-thumb {
      background: #888;
    }

    /* Handle on hover */
    ::-webkit-scrollbar-thumb:hover {
      background: #555;
    }
  </style>
  @wireUiScripts
  <!-- Scripts -->
  @vite(['resources/css/app.css', 'resources/js/app.js'])
  <!-- Styles -->
  @livewireStyles
</head>

<body class="font-sans antialiased bg-white" x-data="{ logout: false }">
  <div class="fixed bg-gradient-to-t from-transparent to-gray-600 w-full h-full overflow-hidden">
    {{-- <img src="{{ asset('images/hotel-bg.jpg') }}" class="object-cover opacity-20" alt=""> --}}
  </div>

  <div
    class="absolute text-gray-300 flex justify-end items-end pb-5 pr-10 text-sm font-rubik font-medium w-full h-full">
    {{-- <div class="relative">
      POWERED BY: J7 IT SOLUTION & SERVICES</div> --}}

  </div>

  <div class="relative">
    <div class="grid grid-rows-[auto_1fr] min-h-screen">
        <header class="flex justify-between items-center py-12 px-20 bg-[#00A0F5] z-10">
            <button onclick="goFullscreen()">
              <h1 class="lg:text-xl font-bold text-white uppercase xs:text-2xs">Welcome to Homi Customer Kiosk</h1>
            </button>          
            <button x-on:click="logout = true"><img src="{{ asset('images/homiLogo2.png') }}" alt="Homi Logo" class="w-24 h-7"></button>
            {{-- <x-button icon="logout" sm negative  /> --}}
        </header>
        <div class="absolute rounded-lg bg-white p-4 overflow-y-auto -mt-4 left-16 right-16 shadow-lg z-20 top-28 min-h-screen ">
            {{ $slot }}
        </div>
    </div>
</div>
<div x-show="logout" x-cloak class="relative z-50" aria-labelledby="modal-title" role="dialog"
aria-modal="true">
<div x-show="logout" x-cloak x-transition:enter="ease-out duration-300" x-transition:enter-start="opacity-0"
  x-transition:enter-end="opacity-100" x-transition:leave="ease-in duration-200"
  x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0"
  class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity">
</div>

<div class="fixed inset-0 z-50 overflow-y-auto">
  <div class="flex min-h-full items-end justify-center p-4 text-center sm:items-center sm:p-0">

    <div x-show="logout" x-cloak x-transition:enter="ease-out duration-300"
      x-transition:enter-start="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
      x-transition:enter-end="opacity-100 translate-y-0 sm:scale-100" x-transition:leave="ease-in duration-200"
      x-transition:leave-start="opacity-100 translate-y-0 sm:scale-100"
      x-transition:leave-end="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
      class="relative transform overflow-hidden rounded-lg bg-white text-left shadow-xl transition-all sm:my-8 sm:w-full sm:max-w-sm">
      <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
        <div class="sm:flex sm:items-start">
          <div
            class="mx-auto flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-full bg-red-100 sm:mx-0 sm:h-10 sm:w-10">
            <!-- Heroicon name: outline/exclamation-triangle -->
            <svg class="h-6 w-6 text-red-600" xmlns="http://www.w3.org/2000/svg" fill="none"
              viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round"
                d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z" />
            </svg>
          </div>
          <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
            <h3 class="text-lg font-medium leading-6 text-gray-900" id="modal-title">Logout Account</h3>
            <div class="mt-2">
              <p class="text-sm text-gray-500">Are you sure you want to logout your account? </p>
            </div>
          </div>
        </div>
      </div>
      <div class="bg-gray-50 px-4 py-3 sm:flex sm:flex-row-reverse  sm:px-6">
        <form method="POST" action="{{ route('logout') }}" class="flex space-x-2">
          @csrf
          <x-button @click="logout=false" label="Cancel" sm icon="x" />
          <x-button href="{{ route('logout') }}"
            onclick="event.preventDefault();
          this.closest('form').submit();" label="Logout"
            icon="logout" sm negative />
        </form>

      </div>
    </div>
  </div>
</div>
</div>
  <x-dialog z-index="z-50" blur="md" align="center" />
  @livewireScripts
</body>
<script>


function goFullscreen() {
  const elem = document.documentElement;

  if (elem.requestFullscreen) {
    elem.requestFullscreen();
  } else if (elem.webkitRequestFullscreen) { /* Safari */
    elem.webkitRequestFullscreen();
  } else if (elem.msRequestFullscreen) { /* IE11 */
    elem.msRequestFullscreen();
  }
}
</script>
</html>
