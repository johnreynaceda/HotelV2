<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" class="h-full bg-gray-100">

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



<body class="font-sans antialiased " x-data="{ logout: false }">
  <!--
  This example requires updating your template:

  ```
  <html class="h-full bg-gray-100">
  <body class="h-full">
  ```
-->
  <div>
    <!-- Off-canvas menu for mobile, show/hide based on off-canvas menu state. -->
    <div class="relative z-40 md:hidden" role="dialog" aria-modal="true">
      <!--
      Off-canvas menu backdrop, show/hide based on off-canvas menu state.

      Entering: "transition-opacity ease-linear duration-300"
        From: "opacity-0"
        To: "opacity-100"
      Leaving: "transition-opacity ease-linear duration-300"
        From: "opacity-100"
        To: "opacity-0"
    -->
      <div class="fixed inset-0 bg-gray-600 bg-opacity-75"></div>

      <div class="fixed inset-0 z-40 flex">
        <!--
        Off-canvas menu, show/hide based on off-canvas menu state.

        Entering: "transition ease-in-out duration-300 transform"
          From: "-translate-x-full"
          To: "translate-x-0"
        Leaving: "transition ease-in-out duration-300 transform"
          From: "translate-x-0"
          To: "-translate-x-full"
      -->
        <div class="relative flex w-full max-w-xs flex-1 flex-col bg-indigo-700">
          <!--
          Close button, show/hide based on off-canvas menu state.

          Entering: "ease-in-out duration-300"
            From: "opacity-0"
            To: "opacity-100"
          Leaving: "ease-in-out duration-300"
            From: "opacity-100"
            To: "opacity-0"
        -->
          <div class="absolute top-0 right-0 -mr-12 pt-2">
            <button type="button"
              class="ml-1 flex h-10 w-10 items-center justify-center rounded-full focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white">
              <span class="sr-only">Close sidebar</span>
              <!-- Heroicon name: outline/x-mark -->
              <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>

          <div class="h-0 flex-1 overflow-y-auto pt-5 pb-4">
            <div class="flex flex-shrink-0 items-center px-4">
              <img class="h-8 w-auto" src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=300"
                alt="Your Company">
            </div>
            <nav class="mt-5 space-y-1 px-2">
              <!-- Current: "bg-indigo-800 text-white", Default: "text-gray-700 hover:bg-gray-200 hover:bg-opacity-75" -->
              <a href="#"
                class="bg-indigo-800 text-gray-700 group flex items-center px-4 py-2 text-base font-mediumd">
                <!-- Heroicon name: outline/home -->
                <svg class="mr-4 h-6 w-6 flex-shrink-0 text-gray-700" xmlns="http://www.w3.org/2000/svg" fill="none"
                  viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.25 12l8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25" />
                </svg>
                Dashboard
              </a>

              <a href="#"
                class="text-gray-700 hover:bg-gray-200 hover:bg-opacity-75 group flex items-center px-4 py-2 text-base font-mediumd">
                <!-- Heroicon name: outline/users -->
                <svg class="mr-4 h-6 w-6 flex-shrink-0 text-gray-700" xmlns="http://www.w3.org/2000/svg" fill="none"
                  viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M15 19.128a9.38 9.38 0 002.625.372 9.337 9.337 0 004.121-.952 4.125 4.125 0 00-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 018.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0111.964-3.07M12 6.375a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zm8.25 2.25a2.625 2.625 0 11-5.25 0 2.625 2.625 0 015.25 0z" />
                </svg>
                Team
              </a>

              <a href="#"
                class="text-gray-700 hover:bg-gray-200 hover:bg-opacity-75 group flex items-center px-4 py-2 text-base font-mediumd">
                <!-- Heroicon name: outline/folder -->
                <svg class="mr-4 h-6 w-6 flex-shrink-0 text-gray-700" xmlns="http://www.w3.org/2000/svg" fill="none"
                  viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.25 12.75V12A2.25 2.25 0 014.5 9.75h15A2.25 2.25 0 0121.75 12v.75m-8.69-6.44l-2.12-2.12a1.5 1.5 0 00-1.061-.44H4.5A2.25 2.25 0 002.25 6v12a2.25 2.25 0 002.25 2.25h15A2.25 2.25 0 0021.75 18V9a2.25 2.25 0 00-2.25-2.25h-5.379a1.5 1.5 0 01-1.06-.44z" />
                </svg>
                Projects
              </a>

              <a href="#"
                class="text-gray-700 hover:bg-gray-200 hover:bg-opacity-75 group flex items-center px-4 py-2 text-base font-mediumd">
                <!-- Heroicon name: outline/calendar -->
                <svg class="mr-4 h-6 w-6 flex-shrink-0 text-gray-700" xmlns="http://www.w3.org/2000/svg" fill="none"
                  viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 012.25-2.25h13.5A2.25 2.25 0 0121 7.5v11.25m-18 0A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75m-18 0v-7.5A2.25 2.25 0 015.25 9h13.5A2.25 2.25 0 0121 11.25v7.5" />
                </svg>
                Calendar
              </a>

              <a href="#"
                class="text-gray-700 hover:bg-gray-200 hover:bg-opacity-75 group flex items-center px-4 py-2 text-base font-mediumd">
                <!-- Heroicon name: outline/inbox -->
                <svg class="mr-4 h-6 w-6 flex-shrink-0 text-gray-700" xmlns="http://www.w3.org/2000/svg" fill="none"
                  viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.25 13.5h3.86a2.25 2.25 0 012.012 1.244l.256.512a2.25 2.25 0 002.013 1.244h3.218a2.25 2.25 0 002.013-1.244l.256-.512a2.25 2.25 0 012.013-1.244h3.859m-19.5.338V18a2.25 2.25 0 002.25 2.25h15A2.25 2.25 0 0021.75 18v-4.162c0-.224-.034-.447-.1-.661L19.24 5.338a2.25 2.25 0 00-2.15-1.588H6.911a2.25 2.25 0 00-2.15 1.588L2.35 13.177a2.25 2.25 0 00-.1.661z" />
                </svg>
                Documents
              </a>

              <a href="#"
                class="text-gray-700 hover:bg-gray-200 hover:bg-opacity-75 group flex items-center px-4 py-2 text-base font-mediumd">
                <!-- Heroicon name: outline/chart-bar -->
                <svg class="mr-4 h-6 w-6 flex-shrink-0 text-gray-700" xmlns="http://www.w3.org/2000/svg"
                  fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M3 13.125C3 12.504 3.504 12 4.125 12h2.25c.621 0 1.125.504 1.125 1.125v6.75C7.5 20.496 6.996 21 6.375 21h-2.25A1.125 1.125 0 013 19.875v-6.75zM9.75 8.625c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125v11.25c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 01-1.125-1.125V8.625zM16.5 4.125c0-.621.504-1.125 1.125-1.125h2.25C20.496 3 21 3.504 21 4.125v15.75c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 01-1.125-1.125V4.125z" />
                </svg>
                Reports
              </a>
            </nav>
          </div>
          <div class="flex flex-shrink-0 border-t border-indigo-800 p-4">
            <a href="#" class="group block flex-shrink-0">
              <div class="flex items-center">
                <div>
                  <img class="inline-block h-10 w-10 rounded-full"
                    src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    alt="">
                </div>
                <div class="ml-3">
                  <p class="text-base font-medium text-white">Tom Cook</p>
                  <p class="text-sm text-indigo-200 group-hover:text-white">View profile</p>
                </div>
              </div>
            </a>
          </div>
        </div>

        <div class="w-14 flex-shrink-0" aria-hidden="true">
          <!-- Force sidebar to shrink to fit close icon -->
        </div>
      </div>
    </div>

    <!-- Static sidebar for desktop -->
    <div class="hidden md:fixed md:inset-y-0 md:flex md:w-64 md:flex-col">
      <!-- Sidebar component, swap this element with another sidebar if you like -->
      <div class="flex min-h-0 flex-1 flex-col relative bg-white">
        <div class="flex flex-1 flex-col overflow-y-auto pt-5 pb-4">
          <div class="flex flex-shrink-0 items-center px-4">
            <div class="flex items-center justify-center w-full">
              <img src="{{ asset('images/homiLogo.png') }}" class="h-11" alt="">
            </div>
          </div>
          <div class="mt-4 py-1">
            {{-- <div class="px-1 text-xs text-gray-600 font-medium">OVERVIEW</div> --}}
            <nav class="mt-2  space-y-0.5 ">
              <a href="{{ route('superadmin.dashboard') }}"
                class="{{ request()->routeIs('superadmin.dashboard') ? 'bg-gray-100 text-[#009ff4] font-semibold text-md border-l-4 border-[#009ff4]' : 'bg-white text-gray-400 font-normal text-md' }}  hover:border-l-4 hover:border-[#009ff4] hover:bg-gray-100 hover:text-[#009ff4] hover:font-semibold hover:text-md group flex items-center px-4 py-2 text-md">
                {{-- <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="mr-3 h-6 w-6 flex-shrink-0 ">
                  <path fill="none" d="M0 0h24v24H0z" />
                  <path
                    d="M13 19h6V9.978l-7-5.444-7 5.444V19h6v-6h2v6zm8 1a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V9.49a1 1 0 0 1 .386-.79l8-6.222a1 1 0 0 1 1.228 0l8 6.222a1 1 0 0 1 .386.79V20z" />
                </svg> --}}
                <svg class="mr-3 h-6 w-6 flex-shrink-0 " viewBox="0 0 29 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g>
                        <path class="{{ request()->routeIs('superadmin.dashboard') ? 'fill-[#009ff4]' : 'group-hover:fill-[#009ff4]' }}" d="M9.797 27.5342H5.01115C2.63008 27.5342 1.481 26.4325 1.481 24.1581V5.44116C1.481 3.16669 2.64192 2.065 5.01115 2.065H9.797C12.1781 2.065 13.3272 3.16669 13.3272 5.44116V24.1581C13.3272 26.4325 12.1662 27.5342 9.797 27.5342ZM5.01115 3.84193C3.50669 3.84193 3.25792 4.24469 3.25792 5.44116V24.1581C3.25792 25.3545 3.50669 25.7573 5.01115 25.7573H9.797C11.3015 25.7573 11.5502 25.3545 11.5502 24.1581V5.44116C11.5502 4.24469 11.3015 3.84193 9.797 3.84193H5.01115Z" fill="#b5bac3"/>
                        <path class="{{ request()->routeIs('superadmin.dashboard') ? 'fill-[#009ff4]' : 'group-hover:fill-[#009ff4]' }}" d="M23.4194 16.8727H18.6336C16.2525 16.8727 15.1034 15.771 15.1034 13.4965V5.44116C15.1034 3.16669 16.2643 2.065 18.6336 2.065H23.4194C25.8005 2.065 26.9496 3.16669 26.9496 5.44116V13.4965C26.9496 15.771 25.7886 16.8727 23.4194 16.8727ZM18.6336 3.84193C17.1291 3.84193 16.8803 4.24469 16.8803 5.44116V13.4965C16.8803 14.693 17.1291 15.0958 18.6336 15.0958H23.4194C24.9239 15.0958 25.1726 14.693 25.1726 13.4965V5.44116C25.1726 4.24469 24.9239 3.84193 23.4194 3.84193H18.6336Z" fill="#b5bac3"/>
                        <path class="{{ request()->routeIs('superadmin.dashboard') ? 'fill-[#009ff4]' : 'group-hover:fill-[#009ff4]' }}" d="M23.4194 27.5336H18.6336C16.2525 27.5336 15.1034 26.432 15.1034 24.1575V22.0252C15.1034 19.7507 16.2643 18.649 18.6336 18.649H23.4194C25.8005 18.649 26.9496 19.7507 26.9496 22.0252V24.1575C26.9496 26.432 25.7886 27.5336 23.4194 27.5336ZM18.6336 20.426C17.1291 20.426 16.8803 20.8287 16.8803 22.0252V24.1575C16.8803 25.354 17.1291 25.7567 18.6336 25.7567H23.4194C24.9239 25.7567 25.1726 25.354 25.1726 24.1575V22.0252C25.1726 20.8287 24.9239 20.426 23.4194 20.426H18.6336Z" fill="#b5bac3"/>
                    </g>
                </svg>

                Dashboard
              </a>
              {{-- <a href=""
                class="{{ request()->routeIs('superadmin.guest') ? 'bg-gray-100 text-gray-600 fill-gray-600 before:h-full before:w-1 relative before:bg-gray-500 before:rounded-r before:absolute before:left-0 ' : 'text-gray-500 fill-gray-500' }}  hover:fill-gray-600 hover:text-gray-600 group flex items-center px-4 py-2 text-sm hover:bg-gray-200 ">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="mr-3 h-6 w-6 flex-shrink-0 ">
                  <path fill="none" d="M0 0h24v24H0z" />
                  <path
                    d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm0-2a8 8 0 1 0 0-16 8 8 0 0 0 0 16zm-5-8h2a3 3 0 0 0 6 0h2a5 5 0 0 1-10 0z" />
                </svg>
                Guest
              </a> --}}
              {{-- <a href="{{ route('superadmin.manage-frontdesk') }}"
                class="{{ request()->routeIs('superadmin.manage-frontdesk') ? 'bg-gray-100 text-gray-600 fill-gray-600 before:h-full before:w-1 relative before:bg-gray-500 before:rounded-r before:absolute before:left-0 ' : 'text-gray-500 fill-gray-500' }}  hover:fill-gray-600 hover:text-gray-600 group flex items-center px-4 py-2 text-sm hover:bg-gray-200 ">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="mr-3 h-6 w-6 flex-shrink-0 ">
                  <path fill="none" d="M0 0h24v24H0z" />
                  <path
                    d="M1 22a8 8 0 1 1 16 0h-2a6 6 0 1 0-12 0H1zm8-9c-3.315 0-6-2.685-6-6s2.685-6 6-6 6 2.685 6 6-2.685 6-6 6zm0-2c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zM21.548.784A13.942 13.942 0 0 1 23 7c0 2.233-.523 4.344-1.452 6.216l-1.645-1.196A11.955 11.955 0 0 0 21 7c0-1.792-.393-3.493-1.097-5.02L21.548.784zm-3.302 2.4A9.97 9.97 0 0 1 19 7a9.97 9.97 0 0 1-.754 3.816l-1.677-1.22A7.99 7.99 0 0 0 17 7a7.99 7.99 0 0 0-.43-2.596l1.676-1.22z" />
                </svg>
                Manage Frontdesk
              </a> --}}
            </nav>
          </div>
          <div class="mt-5 border-t border-dashed py-1">
            {{-- <div class="px-1 text-xs text-gray-600 font-medium">MANAGE</div> --}}
            <nav class="mt-2  space-y-1 ">
                 @if (auth()->user()->hasRole('superadmin'))
              <a href="{{ route('superadmin.branches') }}"
              class="{{ request()->routeIs('superadmin.branches') ? 'bg-gray-100 text-[#009ff4] font-semibold text-md border-l-4 border-[#009ff4]' : 'bg-white text-gray-400 font-normal text-md' }}  hover:border-l-4 hover:border-[#009ff4] hover:bg-gray-100 hover:text-[#009ff4] hover:font-semibold hover:text-md group flex items-center px-4 py-2 text-md">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mr-3 h-6 w-6 flex-shrink-0 ">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 21h19.5m-18-18v18m10.5-18v18m6-13.5V21M6.75 6.75h.75m-.75 3h.75m-.75 3h.75m3-6h.75m-.75 3h.75m-.75 3h.75M6.75 21v-3.375c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21M3 3h12m-.75 4.5H21m-3.75 3.75h.008v.008h-.008v-.008Zm0 3h.008v.008h-.008v-.008Zm0 3h.008v.008h-.008v-.008Z" />
                </svg>
                 Branches
              </a>
              @endif
               <a href="{{ route('admin.activity-logs') }}"
              class="{{ request()->routeIs('admin.activity-logs') ? 'bg-gray-100 text-[#009ff4] font-semibold text-md border-l-4 border-[#009ff4]' : 'bg-white text-gray-400 font-normal text-md' }}  hover:border-l-4 hover:border-[#009ff4] hover:bg-gray-100 hover:text-[#009ff4] hover:font-semibold hover:text-md group flex items-center px-4 py-2 text-md">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"  class="mr-3 h-6 w-6 flex-shrink-0 ">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 6.75h12M8.25 12h12m-12 5.25h12M3.75 6.75h.007v.008H3.75V6.75Zm.375 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0ZM3.75 12h.007v.008H3.75V12Zm.375 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm-.375 5.25h.007v.008H3.75v-.008Zm.375 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" />
                </svg>
                 Activity Logs
              </a>
              <a href="{{ route('admin.type') }}"
              class="{{ request()->routeIs('admin.type') ? 'bg-gray-100 text-[#009ff4] font-semibold text-md border-l-4 border-[#009ff4]' : 'bg-white text-gray-400 font-normal text-md' }}  hover:border-l-4 hover:border-[#009ff4] hover:bg-gray-100 hover:text-[#009ff4] hover:font-semibold hover:text-md group flex items-center px-4 py-2 text-md">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mr-3 h-6 w-6 flex-shrink-0 "> >
                    <path stroke-linecap="round" stroke-linejoin="round" d="M4.098 19.902a3.75 3.75 0 0 0 5.304 0l6.401-6.402M6.75 21A3.75 3.75 0 0 1 3 17.25V4.125C3 3.504 3.504 3 4.125 3h5.25c.621 0 1.125.504 1.125 1.125v4.072M6.75 21a3.75 3.75 0 0 0 3.75-3.75V8.197M6.75 21h13.125c.621 0 1.125-.504 1.125-1.125v-5.25c0-.621-.504-1.125-1.125-1.125h-4.072M10.5 8.197l2.88-2.88c.438-.439 1.15-.439 1.59 0l3.712 3.713c.44.44.44 1.152 0 1.59l-2.879 2.88M6.75 17.25h.008v.008H6.75v-.008Z" />
                </svg>
                Types
              </a>
              <a href="{{ route('admin.rate') }}"
                class="{{ request()->routeIs('admin.rate') ? 'bg-gray-100 text-[#009ff4] font-semibold text-md border-l-4 border-[#009ff4]' : 'bg-white text-gray-400 font-normal text-md' }} hover:border-l-4 hover:border-[#009ff4] hover:bg-gray-100 hover:text-[#009ff4] hover:font-semibold hover:text-md group flex items-center px-4 py-2 text-md">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                  stroke="currentColor" class="mr-3 h-6 w-6 flex-shrink-0 ">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.25 18.75a60.07 60.07 0 0115.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 013 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 00-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 01-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 003 15h-.75M15 10.5a3 3 0 11-6 0 3 3 0 016 0zm3 0h.008v.008H18V10.5zm-12 0h.008v.008H6V10.5z" />
                </svg>
                Rates
              </a>
              <a href="{{ route('admin.floor') }}"
                class="{{ request()->routeIs('admin.floor') ? 'bg-gray-100 text-[#009ff4] font-semibold text-md border-l-4 border-[#009ff4]' : 'bg-white text-gray-400 font-normal text-md' }} hover:border-l-4 hover:border-[#009ff4] hover:bg-gray-100 hover:text-[#009ff4] hover:font-semibold hover:text-md group flex items-center px-4 py-2 text-md">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mr-3 h-6 w-6 flex-shrink-0 ">
                <path stroke-linecap="round" stroke-linejoin="round" d="M6.429 9.75 2.25 12l4.179 2.25m0-4.5 5.571 3 5.571-3m-11.142 0L2.25 7.5 12 2.25l9.75 5.25-4.179 2.25m0 0L21.75 12l-4.179 2.25m0 0 4.179 2.25L12 21.75 2.25 16.5l4.179-2.25m11.142 0-5.571 3-5.571-3" />
                </svg>

                Floors
              </a>
              <a href="{{ route('admin.room') }}"
                class="{{ request()->routeIs('admin.room') ? 'bg-gray-100 text-[#009ff4] font-semibold text-md border-l-4 border-[#009ff4]' : 'bg-white text-gray-400 font-normal text-md' }} hover:border-l-4 hover:border-[#009ff4] hover:bg-gray-100 hover:text-[#009ff4] hover:font-semibold hover:text-md group flex items-center px-4 py-2 text-md">
                <svg class="mr-3 h-6 w-6 flex-shrink-0 " xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                  fill="currentColor">
                  <path d="M0 0h24v24H0V0z" fill="none"></path>
                  <path d="M19 19V4h-4V3H5v16H3v2h12V6h2v15h4v-2h-2zm-6 0H7V5h6v14zm-3-8h2v2h-2z"></path>
                </svg>
                Rooms
              </a>
              <a href="{{ route('admin.food-inventory') }}"
                class="{{ request()->routeIs('admin.food-inventory') ? 'bg-gray-100 text-[#009ff4] font-semibold text-md border-l-4 border-[#009ff4]' : 'bg-white text-gray-400 font-normal text-md' }} hover:border-l-4 hover:border-[#009ff4] hover:bg-gray-100 hover:text-[#009ff4] hover:font-semibold hover:text-md group flex items-center px-4 py-2 text-md">
                <svg class="mr-3 h-6 w-6 flex-shrink-0 " xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 0 0-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 0 0-16.536-1.84M7.5 14.25 5.106 5.272M6 20.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Zm12.75 0a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z" />
                </svg>
                Frontdesk Kitchen
              </a>
              <a href="{{ route('admin.user') }}"
                class="{{ request()->routeIs('admin.user') ? 'bg-gray-100 text-[#009ff4] font-semibold text-md border-l-4 border-[#009ff4]' : 'bg-white text-gray-400 font-normal text-md' }} hover:border-l-4 hover:border-[#009ff4] hover:bg-gray-100 hover:text-[#009ff4] hover:font-semibold hover:text-md group flex items-center px-4 py-2 text-md">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mr-3 h-6 w-6 flex-shrink-0 ">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 0 0 2.625.372 9.337 9.337 0 0 0 4.121-.952 4.125 4.125 0 0 0-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 0 1 8.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0 1 11.964-3.07M12 6.375a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0Zm8.25 2.25a2.625 2.625 0 1 1-5.25 0 2.625 2.625 0 0 1 5.25 0Z" />
                </svg>

                Users
              </a>
              {{-- <a href="{{ route('admin.discount') }}"
                class="{{ request()->routeIs('admin.discount') ? 'bg-gray-100 text-[#009ff4] font-semibold text-md border-l-4 border-[#009ff4]' : 'bg-white text-gray-400 font-normal text-md' }} hover:border-l-4 hover:border-[#009ff4] hover:bg-gray-100 hover:text-[#009ff4] hover:font-semibold hover:text-md group flex items-center px-4 py-2 text-md">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                  stroke="currentColor" class="mr-3 h-6 w-6 flex-shrink-0 ">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M16.5 6v.75m0 3v.75m0 3v.75m0 3V18m-9-5.25h5.25M7.5 15h3M3.375 5.25c-.621 0-1.125.504-1.125 1.125v3.026a2.999 2.999 0 010 5.198v3.026c0 .621.504 1.125 1.125 1.125h17.25c.621 0 1.125-.504 1.125-1.125v-3.026a2.999 2.999 0 010-5.198V6.375c0-.621-.504-1.125-1.125-1.125H3.375z" />
                </svg>
                Discount
              </a> --}}
              <a href="{{ route('admin.extension-rate') }}"
                class="{{ request()->routeIs('admin.extension-rate') ? 'bg-gray-100 text-[#009ff4] font-semibold text-md border-l-4 border-[#009ff4]' : 'bg-white text-gray-400 font-normal text-md' }} hover:border-l-4 hover:border-[#009ff4] hover:bg-gray-100 hover:text-[#009ff4] hover:font-semibold hover:text-md group flex items-center px-4 py-2 text-md">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                  stroke="currentColor" class="mr-3 h-6 w-6 flex-shrink-0 ">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.25 18.75a60.07 60.07 0 0115.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 013 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 00-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 01-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 003 15h-.75M15 10.5a3 3 0 11-6 0 3 3 0 016 0zm3 0h.008v.008H18V10.5zm-12 0h.008v.008H6V10.5z" />
                </svg>
                Extension Rates
              </a>
              <a href="{{ route('admin.charges') }}"
                class="{{ request()->routeIs('admin.charges') ? 'bg-gray-100 text-[#009ff4] font-semibold text-md border-l-4 border-[#009ff4]' : 'bg-white text-gray-400 font-normal text-md' }} hover:border-l-4 hover:border-[#009ff4] hover:bg-gray-100 hover:text-[#009ff4] hover:font-semibold hover:text-md group flex items-center px-4 py-2 text-md">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                  stroke="currentColor" class="mr-3 h-6 w-6 flex-shrink-0 ">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.25 8.25h19.5M2.25 9h19.5m-16.5 5.25h6m-6 2.25h3m-3.75 3h15a2.25 2.25 0 002.25-2.25V6.75A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25v10.5A2.25 2.25 0 004.5 19.5z" />
                </svg>
                Charges for Damages
              </a>
              <a href="{{ route('admin.amenities') }}"
                class="{{ request()->routeIs('admin.amenities') ? 'bg-gray-100 text-[#009ff4] font-semibold text-md border-l-4 border-[#009ff4]' : 'bg-white text-gray-400 font-normal text-md' }} hover:border-l-4 hover:border-[#009ff4] hover:bg-gray-100 hover:text-[#009ff4] hover:font-semibold hover:text-md group flex items-center px-4 py-2 text-md">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mr-3 h-6 w-6 flex-shrink-0 ">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M9.813 15.904 9 18.75l-.813-2.846a4.5 4.5 0 0 0-3.09-3.09L2.25 12l2.846-.813a4.5 4.5 0 0 0 3.09-3.09L9 5.25l.813 2.846a4.5 4.5 0 0 0 3.09 3.09L15.75 12l-2.846.813a4.5 4.5 0 0 0-3.09 3.09ZM18.259 8.715 18 9.75l-.259-1.035a3.375 3.375 0 0 0-2.455-2.456L14.25 6l1.036-.259a3.375 3.375 0 0 0 2.455-2.456L18 2.25l.259 1.035a3.375 3.375 0 0 0 2.456 2.456L21.75 6l-1.035.259a3.375 3.375 0 0 0-2.456 2.456ZM16.894 20.567 16.5 21.75l-.394-1.183a2.25 2.25 0 0 0-1.423-1.423L13.5 18.75l1.183-.394a2.25 2.25 0 0 0 1.423-1.423l.394-1.183.394 1.183a2.25 2.25 0 0 0 1.423 1.423l1.183.394-1.183.394a2.25 2.25 0 0 0-1.423 1.423Z" />
                </svg>

                Amenities
              </a>
              <a href="{{ route('admin.priority-room') }}"
                class="{{ request()->routeIs('admin.priority-room') ? 'bg-gray-100 text-[#009ff4] font-semibold text-md border-l-4 border-[#009ff4]' : 'bg-white text-gray-400 font-normal text-md' }} hover:border-l-4 hover:border-[#009ff4] hover:bg-gray-100 hover:text-[#009ff4] hover:font-semibold hover:text-md group flex items-center px-4 py-2 text-md">
                <svg class="mr-3 h-6 w-6 flex-shrink-0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                  fill="currentColor">
                  <path
                    d="m15.684 19.504-.623 1.002v.027h1.03v-1.029c0-.271.027-.569.027-.867h-.027c-.136.298-.244.569-.406.867z">
                  </path>
                  <path
                    d="m22.998 11.539h-.813v-.542h.596l-.379-.379.379-.379.569.569-.352.352zm-1.626 0h-.812v-.542h.813zm-1.626 0h-.812v-.542h.813zm-1.625 0h-.809v-.542h.813zm-1.626 0h-.811v-.542h.813zm-1.625 0h-.811v-.542h.813zm-1.626 0h-.812v-.542h.813zm-1.626 0h-.81v-.542h.813zm-1.625 0h-.81v-.542h.813zm-1.626 0h-.81v-.542h.813zm-1.625 0h-.81v-.542h.813zm-1.626 0h-.809v-.542h.812zm-1.626 0h-.809v-.542h.813zm-1.625 0h-.809v-.406l-.325.325-.379-.378.569-.569.379.379-.108.108h.68zm.031-1.219-.379-.379.569-.569.379.379zm19.91-.271-.569-.569.379-.379.569.569zm-18.772-.866-.379-.383.569-.569.379.379zm17.638-.271-.569-.569.379-.379.569.569zm-16.474-.867-.379-.379.569-.569.379.379zm15.305-.271-.569-.569.378-.378.569.569zm-14.14-.867-.379-.379.568-.569.379.379zm12.975-.267-.569-.569.379-.379.569.569zm-11.81-.87-.379-.379.569-.569.379.379zm10.646-.272-.569-.569.379-.379.568.57zm-9.481-.866-.381-.379.569-.569.379.379zm8.32-.271-.573-.569.379-.379.569.569zm-7.155-.867-.379-.379.569-.569.379.379zm5.986-.271-.572-.569.379-.379.569.569zm-4.822-.866-.379-.379.569-.569.379.379zm3.68-.271-.565-.566.379-.379.569.569zm-2.542-.867-.379-.379.596-.569.379.379zm1.382-.271-.569-.569.352-.379.569.569z">
                  </path>
                  <path
                    d="m9.806 13.652c-.461 0-.731.434-.731 1.002 0 .596.271 1.002.731 1.002s.704-.434.704-1.002c.001-.542-.243-1.002-.704-1.002z">
                  </path>
                  <path
                    d="m6.88 13.652c-.024-.003-.052-.004-.081-.004-.077 0-.152.012-.222.033l.005-.001v.813h.271c.325 0 .542-.16.542-.434-.027-.271-.217-.406-.515-.406z">
                  </path>
                  <path
                    d="m12.975 13.652c-.461 0-.731.434-.731 1.002 0 .596.271 1.002.731 1.002s.704-.434.704-1.002c.027-.542-.243-1.002-.704-1.002z">
                  </path>
                  <path
                    d="m22.618 10.564h-21.264c-.004 0-.008 0-.013 0-.741 0-1.342.601-1.342 1.342v.014-.001 10.726.013c0 .741.601 1.342 1.342 1.342h.014 21.263.013c.741 0 1.342-.601 1.342-1.342 0-.005 0-.009 0-.014v.001-10.726c-.003-.747-.608-1.351-1.354-1.354zm-21.182 11.973h-.623v-10.266h.623zm4.469-9.319c.269-.034.58-.054.895-.054.049-.006.106-.009.163-.009.303 0 .585.093.817.252l-.005-.003c.167.133.274.337.274.565 0 .021-.001.041-.003.061v-.003c-.002.334-.213.619-.509.729l-.005.002c.217.08.325.271.406.569.074.336.157.617.256.89l-.016-.05h-.704c-.081-.196-.156-.431-.211-.673l-.006-.031c-.08-.379-.217-.461-.487-.487h-.215v1.165h-.677v-2.923zm3.657 9.21h-3.28v-.65l.596-.542c1.002-.894 1.49-1.436 1.52-1.978 0-.379-.217-.677-.758-.677-.382.015-.729.157-1.002.385l.003-.002-.298-.786c.413-.304.932-.487 1.493-.487h.028-.001c.056-.008.12-.012.186-.012.795 0 1.44.645 1.44 1.44v.036-.002c-.114.833-.566 1.543-1.21 1.999l-.009.006-.434.352v.027h1.734zm-1.192-7.747c-.003-.035-.005-.077-.005-.118 0-.802.65-1.453 1.453-1.453h.015-.001.036c.762 0 1.38.618 1.38 1.38 0 .049-.003.098-.008.146l.001-.006c.005.044.008.095.008.147 0 .787-.638 1.425-1.425 1.425-.016 0-.032 0-.048-.001h.002c-.01 0-.022 0-.034 0-.763 0-1.381-.618-1.381-1.381 0-.049.003-.097.008-.145v.006zm3.223 7.829c-.016 0-.035.001-.055.001-.485 0-.942-.12-1.342-.333l.016.008.217-.813c.312.177.684.286 1.08.298h.003c.569 0 .84-.271.84-.623 0-.461-.461-.65-.921-.65h-.434v-.786h.434c.352 0 .813-.135.813-.542 0-.271-.217-.487-.678-.487-.36.015-.694.113-.986.277l.011-.006-.217-.786c.391-.222.859-.353 1.357-.353.028 0 .056 0 .083.001h-.004c1.002 0 1.544.514 1.544 1.165-.004.517-.355.952-.832 1.081l-.008.002v.027c.57.071 1.006.552 1.006 1.135v.003c-.03.786-.762 1.382-1.926 1.382zm1.354-6.312c-.006 0-.013 0-.02 0-.77 0-1.394-.624-1.394-1.394 0-.044.002-.088.006-.131v.006c-.003-.035-.005-.077-.005-.118 0-.802.65-1.453 1.453-1.453h.015-.001.036c.762 0 1.38.618 1.38 1.38 0 .049-.003.098-.008.146l.001-.006c.005.044.008.095.008.147 0 .787-.638 1.425-1.425 1.425-.016 0-.031 0-.047-.001h.002zm4.741 5.12h-.568v1.11h-1.03v-1.111h-2.058v-.704l1.76-2.817h1.328v2.709h.569v.813zm-.271-5.146-.057-1.138c0-.352-.027-.786-.027-1.219-.08.379-.217.813-.325 1.165l-.352 1.165h-.514l-.325-1.165c-.108-.352-.19-.786-.271-1.165-.027.406-.027.867-.054 1.246l-.051 1.138h-.623l.19-2.98h.894l.298 1.002c.08.352.19.704.24 1.057.08-.352.19-.731.271-1.083l.325-1.002h.894l.16 2.98zm5.742 6.258h-.623v-10.24h.623z">
                  </path>
                </svg>
                Priority Room
              </a>

              <a href="{{ route('admin.reservation') }}"
                class="{{ request()->routeIs('admin.reservation') ? 'bg-gray-100 text-[#009ff4] font-semibold text-md border-l-4 border-[#009ff4]' : 'bg-white text-gray-400 font-normal text-md' }} hover:border-l-4 hover:border-[#009ff4] hover:bg-gray-100 hover:text-[#009ff4] hover:font-semibold hover:text-md group flex items-center px-4 py-2 text-md">
                <svg class="mr-3 h-6 w-6 flex-shrink-0 " xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                  fill="currentColor">
                  <g>
                    <path fill="none" d="M0 0h24v24H0z"></path>
                    <path fill-rule="nonzero"
                      d="M13 15v4h3v2H8v-2h3v-4H4a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h16a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1h-7zm-8-2h14V5H5v8zm3-5h8v2H8V8z">
                    </path>
                  </g>
                </svg>
                Reservation
              </a>
               @if (auth()->user()->hasRole('superadmin'))
                <a href="{{ route('superadmin.reports') }}"
                class="{{ request()->routeIs('superadmin.reports') ? 'bg-gray-100 text-[#009ff4] font-semibold text-md border-l-4 border-[#009ff4]' : 'bg-white text-gray-400 font-normal text-md' }} hover:border-l-4 hover:border-[#009ff4] hover:bg-gray-100 hover:text-[#009ff4] hover:font-semibold hover:text-md group flex items-center px-4 py-2 text-md">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mr-3 h-6 w-6 flex-shrink-0 ">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h3.75M9 15h3.75M9 18h3.75m3 .75H18a2.25 2.25 0 0 0 2.25-2.25V6.108c0-1.135-.845-2.098-1.976-2.192a48.424 48.424 0 0 0-1.123-.08m-5.801 0c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75 2.25 2.25 0 0 0-.1-.664m-5.8 0A2.251 2.251 0 0 1 13.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m0 0H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V9.375c0-.621-.504-1.125-1.125-1.125H8.25ZM6.75 12h.008v.008H6.75V12Zm0 3h.008v.008H6.75V15Zm0 3h.008v.008H6.75V18Z" />
                </svg>
                Back Office Reports
              </a>
              @endif

            </nav>
          </div>
        </div>
        <div class="flex flex-shrink-0 border-t-2 border-gray-200 py-4 px-2">
          <a href="#" class="group block w-full flex-shrink-0">
            <div class="flex justify-between">
              <div class="flex items-center">
                <div>
                  <x-avatar sm label="AR" />
                </div>
                <div class="ml-3">
                  <p class="text-sm text-gray-500">{{ auth()->user()->name }}</p>
                  <p class="text-xs font-medium text-gray-500 uppercase  ">{{ auth()->user()->roles->first()->name }}
                  </p>
                </div>
              </div>
              <x-button icon="logout" sm negative x-on:click="logout = true" />
            </div>
          </a>
        </div>
      </div>
    </div>
    <div class="flex flex-1 flex-col md:pl-64">
      <div class="sticky top-0 z-10 bg-gray-100 pl-1 pt-1 sm:pl-3 sm:pt-3 md:hidden">
        <button type="button"
          class="-ml-0.5 -mt-0.5 inline-flex h-12 w-12 items-center justify-center rounded-md text-gray-500 hover:text-gray-900 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500">
          <span class="sr-only">Open sidebar</span>
          <!-- Heroicon name: outline/bars-3 -->
          <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
            stroke-width="1.5" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
          </svg>
        </button>
      </div>
      <main class="flex-1">
        <div class="py-1">
          <div class="mx-auto max-w-full px-4 sm:px-6 md:px-8">
            <div
              class="md:flex px-2 py-4 md:items-center md:justify-between md:space-x-5">
              <div class="flex items-start space-x-5">
                <div class="">
                  <h1 class="text-3xl font-bold uppercase" style="color: #009ff4;">@yield('breadcrumbs')</h1>
                  <small class="text-md bg-gray-100 italic">@yield('childBreadcrumbs')</small>
                </div>
              </div>
              <div
                class="justify-stretch mt-6 flex flex-col-reverse space-y-4 space-y-reverse sm:flex-row-reverse sm:justify-end sm:space-y-0 sm:space-x-3 sm:space-x-reverse md:mt-0 md:flex-row md:space-x-3">
                <nav class="flex" aria-label="Breadcrumb">
                  <ol role="list">
                    <li>
                    <a href="{{ route('admin.settings') }}" class="inline-flex items-center px-4 py-2 rounded-full" style="background-color: #009ff4; color: #fff;">
                        <svg class="mr-1 h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.325.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 0 1 1.37.49l1.296 2.247a1.125 1.125 0 0 1-.26 1.431l-1.003.827c-.293.241-.438.613-.43.992a7.723 7.723 0 0 1 0 .255c-.008.378.137.75.43.991l1.004.827c.424.35.534.955.26 1.43l-1.298 2.247a1.125 1.125 0 0 1-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.47 6.47 0 0 1-.22.128c-.331.183-.581.495-.644.869l-.213 1.281c-.09.543-.56.94-1.11.94h-2.594c-.55 0-1.019-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 0 1-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 0 1-1.369-.49l-1.297-2.247a1.125 1.125 0 0 1 .26-1.431l1.004-.827c.292-.24.437-.613.43-.991a6.932 6.932 0 0 1 0-.255c.007-.38-.138-.751-.43-.992l-1.004-.827a1.125 1.125 0 0 1-.26-1.43l1.297-2.247a1.125 1.125 0 0 1 1.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.086.22-.128.332-.183.582-.495.644-.869l.214-1.28Z" />
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                        </svg>
                        Settings
                    </a>
                    </li>
                    {{-- <li>
                      <div>
                        <a href="#" class="text-gray-400 hover:text-gray-500">
                          <svg class="h-5 w-5 flex-shrink-0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                            fill="currentColor" aria-hidden="true">
                            <path fill-rule="evenodd"
                              d="M9.293 2.293a1 1 0 011.414 0l7 7A1 1 0 0117 11h-1v6a1 1 0 01-1 1h-2a1 1 0 01-1-1v-3a1 1 0 00-1-1H9a1 1 0 00-1 1v3a1 1 0 01-1 1H5a1 1 0 01-1-1v-6H3a1 1 0 01-.707-1.707l7-7z"
                              clip-rule="evenodd" />
                          </svg>
                          <span class="sr-only">Home</span>
                        </a>
                      </div>
                    </li>

                    <li>
                      <div class="flex items-center">
                        <svg class="h-5 w-5 flex-shrink-0 text-gray-400" xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                          <path fill-rule="evenodd"
                            d="M7.21 14.77a.75.75 0 01.02-1.06L11.168 10 7.23 6.29a.75.75 0 111.04-1.08l4.5 4.25a.75.75 0 010 1.08l-4.5 4.25a.75.75 0 01-1.06-.02z"
                            clip-rule="evenodd" />
                        </svg>
                        <a href="#"
                          class="ml-4 text-sm  text-gray-500 hover:text-gray-700">@yield('breadcrumbs')</a>
                      </div>
                    </li> --}}
                  </ol>
                </nav>

              </div>
            </div>

          </div>
          <div class="bg-white mx-auto max-w-full sm:px-6 md:px-8">
            <!-- Replace with your content -->
            <div class="py-8">
              <div class="h-screen p-4 ">
                {{ $slot }}
              </div>
            </div>
            <!-- /End replace -->
          </div>
        </div>
      </main>
    </div>
  </div>

  <div x-show="logout" x-cloak class="relative z-10" aria-labelledby="modal-title" role="dialog"
    aria-modal="true">
    <div x-show="logout" x-cloak x-transition:enter="ease-out duration-300" x-transition:enter-start="opacity-0"
      x-transition:enter-end="opacity-100" x-transition:leave="ease-in duration-200"
      x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0"
      class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity">
    </div>

    <div class="fixed inset-0 z-10 overflow-y-auto">
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




  @livewireScripts
  <x-dialog z-index="z-50" blur="md" align="center" />
</body>

</html>
