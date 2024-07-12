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
            <h1 class="text-xl font-bold text-white uppercase">Welcome to Homi Customer Kiosk</h1>
            <img src="{{ asset('images/homiLogo2.png') }}" alt="Homi Logo" class="w-24 h-7">
        </header>
        <div class="absolute rounded-lg bg-white p-4 overflow-y-auto -mt-4 left-16 right-16 shadow-lg z-20 top-28 ">
            {{ $slot }}
        </div>
    </div>
</div>
  <x-dialog z-index="z-50" blur="md" align="center" />
  @livewireScripts
</body>

</html>
