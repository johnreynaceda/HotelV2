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

<body class="font-sans antialiased" x-data="{ logout: false }">

  <div>
    <div class="relative sticky top-0 z-10 bg-gradient-to-b from-gray-700 via-gray-600 to-gray-500">
      <div class="flex items-center justify-between px-16 py-4 md:justify-start md:space-x-10">
        <div class="flex justify-start lg:w-0 lg:flex-1">
          <div class="flex space-x-2 items-center">
            <x-svg.hotel class="w-10 h-10 text-gray-100" />
            <div class="border-l-2 border-gray-400 pl-2">
              <div class="text-gray-200 text-2xl font-bold">HIMS</div>
              <div class="text-gray-300 font-rubik font-medium  leading-3">{{ auth()->user()->branch_name }}</div>
            </div>
          </div>
        </div>
        <div class="-my-2 -mr-2 md:hidden">
          <button type="button"
            class="inline-flex items-center justify-center rounded-md bg-white p-2 text-gray-400 hover:bg-gray-100 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500"
            aria-expanded="false">
            <span class="sr-only">Open menu</span>
            <!-- Heroicon name: outline/bars-3 -->
            <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
              stroke-width="1.5" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
            </svg>
          </button>
        </div>
        <nav class="hidden space-x-6 md:flex">


          <a href="{{ route('frontdesk.dashboard') }}"
            class="{{ Request::routeIs('frontdesk.dashboard') ? 'bg-white text-white fill-white bg-opacity-30' : 'text-white fill-white' }} text-md font-medium hover:bg-white hover:bg-opacity-30 p-2 items-center rounded-lg flex space-x-2 ">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
              <path fill="none" d="M0 0H24V24H0z" />
              <path
                d="M12 2c5.523 0 10 4.477 10 10s-4.477 10-10 10S2 17.523 2 12 6.477 2 12 2zm0 2c-4.418 0-8 3.582-8 8s3.582 8 8 8 8-3.582 8-8-3.582-8-8-8zm3.833 3.337c.237-.166.559-.138.763.067.204.204.23.526.063.76-2.18 3.046-3.38 4.678-3.598 4.897-.586.585-1.536.585-2.122 0-.585-.586-.585-1.536 0-2.122.374-.373 2.005-1.574 4.894-3.602zM17.5 11c.552 0 1 .448 1 1s-.448 1-1 1-1-.448-1-1 .448-1 1-1zm-11 0c.552 0 1 .448 1 1s-.448 1-1 1-1-.448-1-1 .448-1 1-1zm2.318-3.596c.39.39.39 1.023 0 1.414-.39.39-1.024.39-1.414 0-.39-.39-.39-1.024 0-1.414.39-.39 1.023-.39 1.414 0zM12 5.5c.552 0 1 .448 1 1s-.448 1-1 1-1-.448-1-1 .448-1 1-1z" />
            </svg>
            <span>DASHBOARD</span>
          </a>
          <a href="{{ route('frontdesk.room-monitoring') }}"
            class="{{ Request::routeIs('frontdesk.room-monitoring') ? 'bg-white text-white fill-white bg-opacity-30' : 'text-white fill-white' }} text-md font-medium hover:bg-white hover:bg-opacity-30 p-2 items-center rounded-lg flex space-x-2 ">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
              <path fill="none" d="M0 0h24v24H0z" />
              <path
                d="M6 19h12V9.157l-6-5.454-6 5.454V19zm13 2H5a1 1 0 0 1-1-1v-9H1l10.327-9.388a1 1 0 0 1 1.346 0L23 11h-3v9a1 1 0 0 1-1 1zM7.5 13h2a2.5 2.5 0 1 0 5 0h2a4.5 4.5 0 1 1-9 0z" />
            </svg>
            <span>ROOM MONITORING</span>
          </a>
          <a href="{{ route('frontdesk.priority-room') }}"
            class="{{ Request::routeIs('frontdesk.priority-room') ? 'bg-white text-white fill-white bg-opacity-30' : 'text-white fill-white' }} text-md font-medium hover:bg-white hover:bg-opacity-30 p-2 items-center rounded-lg flex space-x-2 ">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
              <path fill="none" d="M0 0h24v24H0z" />
              <path
                d="M6 19h12V9.157l-6-5.454-6 5.454V19zm13 2H5a1 1 0 0 1-1-1v-9H1l10.327-9.388a1 1 0 0 1 1.346 0L23 11h-3v9a1 1 0 0 1-1 1zM7.5 13h2a2.5 2.5 0 1 0 5 0h2a4.5 4.5 0 1 1-9 0z" />
            </svg>
            <span>PRIORITY ROOM</span>
          </a>
          <a href="#"
            class=" text-md font-medium text-white fill-white  p-2 items-center rounded-lg flex space-x-2 hover:text-gray-200">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
              <path fill="none" d="M0 0h24v24H0z" />
              <path
                d="M2.213 14.06a9.945 9.945 0 0 1 0-4.12c1.11.13 2.08-.237 2.396-1.001.317-.765-.108-1.71-.986-2.403a9.945 9.945 0 0 1 2.913-2.913c.692.877 1.638 1.303 2.403.986.765-.317 1.132-1.286 1.001-2.396a9.945 9.945 0 0 1 4.12 0c-.13 1.11.237 2.08 1.001 2.396.765.317 1.71-.108 2.403-.986a9.945 9.945 0 0 1 2.913 2.913c-.877.692-1.303 1.638-.986 2.403.317.765 1.286 1.132 2.396 1.001a9.945 9.945 0 0 1 0 4.12c-1.11-.13-2.08.237-2.396 1.001-.317.765.108 1.71.986 2.403a9.945 9.945 0 0 1-2.913 2.913c-.692-.877-1.638-1.303-2.403-.986-.765.317-1.132 1.286-1.001 2.396a9.945 9.945 0 0 1-4.12 0c.13-1.11-.237-2.08-1.001-2.396-.765-.317-1.71.108-2.403.986a9.945 9.945 0 0 1-2.913-2.913c.877-.692 1.303-1.638.986-2.403-.317-.765-1.286-1.132-2.396-1.001zM4 12.21c1.1.305 2.007 1.002 2.457 2.086.449 1.085.3 2.22-.262 3.212.096.102.195.201.297.297.993-.562 2.127-.71 3.212-.262 1.084.45 1.781 1.357 2.086 2.457.14.004.28.004.42 0 .305-1.1 1.002-2.007 2.086-2.457 1.085-.449 2.22-.3 3.212.262.102-.096.201-.195.297-.297-.562-.993-.71-2.127-.262-3.212.45-1.084 1.357-1.781 2.457-2.086.004-.14.004-.28 0-.42-1.1-.305-2.007-1.002-2.457-2.086-.449-1.085-.3-2.22.262-3.212a7.935 7.935 0 0 0-.297-.297c-.993.562-2.127.71-3.212.262C13.212 6.007 12.515 5.1 12.21 4a7.935 7.935 0 0 0-.42 0c-.305 1.1-1.002 2.007-2.086 2.457-1.085.449-2.22.3-3.212-.262-.102.096-.201.195-.297.297.562.993.71 2.127.262 3.212C6.007 10.788 5.1 11.485 4 11.79c-.004.14-.004.28 0 .42zM12 15a3 3 0 1 1 0-6 3 3 0 0 1 0 6zm0-2a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
            </svg>
            <span>SETTINGS</span>
          </a>
          {{-- <a href="#" class="text-base font-medium text-white hover:text-gray-200">ROOM MONITORING</a>
        <a href="#" class="text-base font-medium text-white hover:text-gray-200">PRIORITY ROOM</a>
        <a href="#" class="text-base font-medium text-white hover:text-gray-200">PRIORITY ROOM</a> --}}


        </nav>
        <div class="hidden items-center justify-end md:flex md:flex-1 lg:w-0">
          <livewire:frontdesk.switch-frontdesk />
          <form method="POST" action="{{ route('logout') }}">
          @csrf
          <x-button negative label="Logout" class="ml-2" onclick="event.preventDefault();
              this.closest('form').submit();" icon="logout" />
          </form>

          {{-- <x-dropdown>
            <x-slot name="trigger">
              <x-avatar lg label="AB" />
            </x-slot>

            <x-dropdown.item icon="cog" label="User Settings" />
            <div>
              <livewire:frontdesk.switch-frontdesk />
            </div>
            <form method="POST" action="{{ route('logout') }}">
              @csrf
              <x-dropdown.item href="{{ route('logout') }}"
                onclick="event.preventDefault();
              this.closest('form').submit();" separator icon="logout"
                label="Logout" />
            </form>
          </x-dropdown> --}}
        </div>
      </div>
    </div>
    <div class="mt-14 px-16">
      {{ $slot }}
    </div>
  </div>

  <x-notifications z-index="z-50" />
  <x-dialog z-index="z-50" blur="md" align="center" />
  @livewireScripts
</body>

</html>
