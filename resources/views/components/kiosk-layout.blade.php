<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title>{{ config('app.name', 'Laravel') }}</title>
  <link rel="manifest" href="/manifest.webmanifest">

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;600;700;800;900&display=swap"
    rel="stylesheet">

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

<body class="font-sans antialiased bg-gray-400" x-data="{ logout: false }">
  <div class="fixed inset-0 bg-gradient-to-t from-transparent to-gray-600 w-full h-full overflow-hidden">
    <img src="{{ asset('images/hotel-bg.jpg') }}" class="object-cover opacity-20" alt="">
  </div>

  <div
    class="absolute text-gray-300 flex justify-end items-end pb-5 pr-10 text-sm font-rubik font-medium w-full h-full">
    {{-- <div class="relative">
      POWERED BY: J7 IT SOLUTION & SERVICES</div> --}}
  </div>

  <div class="relative">
    <div class="">
      <div class="p-10 flex justify-between items-center">
        <div class="flex space-x-2 items-center">
          <x-svg.hotel class="w-10 h-10 text-gray-300" />
          <div class="border-l-2 border-gray-400 pl-2">
            <div class="text-gray-200 text-2xl font-bold">HIMS</div>
            <div class="text-gray-300 font-rubik font-medium  leading-3">{{ auth()->user()->branch_name }}</div>
          </div>
        </div>
        <form method="POST" action="{{ route('logout') }}">
          @csrf
          <button href="{{ route('logout') }}"
            onclick="event.preventDefault();
              this.closest('form').submit();"
            class="bg-gradient-to-r from-gray-500 via-gray-500 to-transparent p-2 px-4 flex space-x-1 rounded-full">

            <span class="font-semibold text-gray-100 uppercase">Logout</span>
            <svg class="w-6 h-6 text-gray-100" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
              fill="currentColor" aria-hidden="true">
              <path
                d="M15.24 22.27h-.13c-4.44 0-6.58-1.75-6.95-5.67-.04-.41.26-.78.68-.82.4-.04.78.27.82.68.29 3.14 1.77 4.31 5.46 4.31h.13c4.07 0 5.51-1.44 5.51-5.51V8.74c0-4.07-1.44-5.51-5.51-5.51h-.13c-3.71 0-5.19 1.19-5.46 4.39-.05.41-.4.72-.82.68a.751.751 0 01-.69-.81c.34-3.98 2.49-5.76 6.96-5.76h.13c4.91 0 7.01 2.1 7.01 7.01v6.52c0 4.91-2.1 7.01-7.01 7.01z">
              </path>
              <path d="M15 12.75H3.62c-.41 0-.75-.34-.75-.75s.34-.75.75-.75H15c.41 0 .75.34.75.75s-.34.75-.75.75z">
              </path>
              <path
                d="M5.85 16.1c-.19 0-.38-.07-.53-.22l-3.35-3.35a.754.754 0 010-1.06l3.35-3.35c.29-.29.77-.29 1.06 0 .29.29.29.77 0 1.06L3.56 12l2.82 2.82c.29.29.29.77 0 1.06-.14.15-.34.22-.53.22z">
              </path>
            </svg>
          </button>
        </form>
      </div>
      <div>
        {{ $slot }}
      </div>
    </div>
  </div>
  <x-dialog z-index="z-50" blur="md" align="center" />
  @livewireScripts
</body>

</html>
