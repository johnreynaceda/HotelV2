<x-kiosk-layout-update>
  <div class="px-10">
    <h1 class="text-5xl pt-20 text-gray-600 uppercase font-extrabold">Select Transaction</h1>
    <div class="pt-16  flex items-center space-x-10">
      <a href="{{ route('kiosk.check-in') }}"
        class="w-[28rem] border relative h-80 bg-gradient-to-bl overflow-hidden from-green-800 shadow-xl via-green-800 to-transparent rounded-2xl">
        <svg class="h-72 text-white absolute -right-28 opacity-10 top-0" xmlns="http://www.w3.org/2000/svg"
          xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 36 36" preserveAspectRatio="xMidYMid meet"
          fill="currentColor">
          <title>login-solid</title>
          <path
            d="M28,4H12a2,2,0,0,0-2,2v7h8.5L15.12,9.71a1,1,0,0,1,1.41-1.41l5.79,5.79-5.79,5.79a1,1,0,0,1-1.41-1.41L18.5,15H10V30a2,2,0,0,0,2,2H28a2,2,0,0,0,2-2V6A2,2,0,0,0,28,4Z"
            class="clr-i-solid clr-i-solid-path-1"></path>
          <path d="M10,13H4a1,1,0,0,0-1,1,1,1,0,0,0,1,1h6Z" class="clr-i-solid clr-i-solid-path-2"></path>
          <rect x="0" y="0" width="36" height="36" fill-opacity="0"></rect>
        </svg>
        <div class="pt-6 px-10 pb-10">
          <h1 class="font-bold text-white text-3xl">CHECK-IN</h1>
        </div>
        <div class=" flex justify-center items-center">
          <div class=" w-40 h-40 flex justify-center items-center rounded-full p-3 shadow-xl bg-green-700">
            <svg class="h-28 w-28 text-white" xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 36 36"
              preserveAspectRatio="xMidYMid meet" fill="currentColor">
              <title>login-solid</title>
              <path
                d="M28,4H12a2,2,0,0,0-2,2v7h8.5L15.12,9.71a1,1,0,0,1,1.41-1.41l5.79,5.79-5.79,5.79a1,1,0,0,1-1.41-1.41L18.5,15H10V30a2,2,0,0,0,2,2H28a2,2,0,0,0,2-2V6A2,2,0,0,0,28,4Z"
                class="clr-i-solid clr-i-solid-path-1"></path>
              <path d="M10,13H4a1,1,0,0,0-1,1,1,1,0,0,0,1,1h6Z" class="clr-i-solid clr-i-solid-path-2"></path>
              <rect x="0" y="0" width="36" height="36" fill-opacity="0"></rect>
            </svg>
          </div>
        </div>
      </a>
      <span class="font-bold text-lg text-gray-50">OR</span>
      <a href=""
        class="w-[28rem] border relative h-80 bg-gradient-to-bl shadow-xl overflow-hidden from-red-800 via-red-800 to-transparent rounded-2xl">

        <svg class="h-72 text-white absolute -right-28 opacity-10 top-0" xmlns="http://www.w3.org/2000/svg"
          xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 36 36"
          preserveAspectRatio="xMidYMid meet" fill="currentColor">
          <title>logout-solid</title>
          <path
            d="M23,4H7A2,2,0,0,0,5,6V30a2,2,0,0,0,2,2H23a2,2,0,0,0,2-2V24H15.63a1,1,0,0,1-1-1,1,1,0,0,1,1-1H25V6A2,2,0,0,0,23,4Z"
            class="clr-i-solid clr-i-solid-path-1"></path>
          <path d="M28.16,17.28a1,1,0,0,0-1.41,1.41L30.13,22H25v2h5.13l-3.38,3.46a1,1,0,1,0,1.41,1.41L34,23.07Z"
            class="clr-i-solid clr-i-solid-path-2"></path>
          <rect x="0" y="0" width="36" height="36" fill-opacity="0"></rect>
        </svg>
        <div class="pt-6 px-10 pb-10">
          <h1 class="font-bold text-white text-3xl">CHECK-OUT</h1>
        </div>
        <div class=" flex justify-center items-center">
          <div class=" w-40 h-40 flex justify-center items-center rounded-full p-3 shadow-xl bg-red-700">

            <svg class="h-28 w-28 text-white" xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 36 36"
              preserveAspectRatio="xMidYMid meet" fill="currentColor">
              <title>logout-solid</title>
              <path
                d="M23,4H7A2,2,0,0,0,5,6V30a2,2,0,0,0,2,2H23a2,2,0,0,0,2-2V24H15.63a1,1,0,0,1-1-1,1,1,0,0,1,1-1H25V6A2,2,0,0,0,23,4Z"
                class="clr-i-solid clr-i-solid-path-1"></path>
              <path d="M28.16,17.28a1,1,0,0,0-1.41,1.41L30.13,22H25v2h5.13l-3.38,3.46a1,1,0,1,0,1.41,1.41L34,23.07Z"
                class="clr-i-solid clr-i-solid-path-2"></path>
              <rect x="0" y="0" width="36" height="36" fill-opacity="0"></rect>
            </svg>
          </div>
        </div>
      </a>
    </div>
  </div>
</x-kiosk-layout-update>
