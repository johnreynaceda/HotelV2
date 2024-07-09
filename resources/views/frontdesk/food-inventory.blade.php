<x-admin-layout>
    <div class="container items-center py-8 m-auto mt-5">
        <div class="flex flex-wrap pb-3 mx-2 md:mx-24 lg:mx-0">
          {{-- <div class="w-full p-2 lg:w-1/4 md:w-1/2">
            <a href="{{route('frontdesk.food-category')}}">
                <div
                class="flex flex-col px-6 py-10 overflow-hidden bg-white hover:bg-gradient-to-br hover:from-purple-400 hover:via-blue-400 hover:to-blue-500 rounded-xl shadow-lg duration-300 hover:shadow-2xl group">
                <div class="flex flex-row justify-between items-center">
                  <div class="px-4 py-4 bg-gray-300  rounded-xl bg-opacity-30">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 group-hover:text-gray-50" viewBox="0 0 20 20"
                      fill="currentColor">
                      <path fill-rule="evenodd"
                        d="M10.293 15.707a1 1 0 010-1.414L14.586 10l-4.293-4.293a1 1 0 111.414-1.414l5 5a1 1 0 010 1.414l-5 5a1 1 0 01-1.414 0z"
                        clip-rule="evenodd" />
                      <path fill-rule="evenodd"
                        d="M4.293 15.707a1 1 0 010-1.414L8.586 10 4.293 5.707a1 1 0 011.414-1.414l5 5a1 1 0 010 1.414l-5 5a1 1 0 01-1.414 0z"
                        clip-rule="evenodd" />
                    </svg>
                  </div>
                </div>
                <h1 class="text-3xl sm:text-4xl xl:text-5xl font-bold text-gray-700 mt-12 group-hover:text-gray-50">Category</h1>
              </div>
            </a>
          </div> --}}
          <div class="w-72 p-2 lg:w-72 md:w-72">
            <div  class="block">
                <div class="relative rounded-xl shadow-lg overflow-hidden h-72">
                    <img src="{{ asset('images/category.jpg') }}" alt="Category Image" class="w-full h-full object-cover transition-transform duration-300 transform hover:scale-105">
                    <div class="absolute inset-0 bg-black bg-opacity-50 transition-opacity duration-300 opacity-75 hover:opacity-100"></div>
                    <div class="absolute inset-0 flex flex-col items-start justify-between p-6 transition-opacity duration-300 opacity-100 hover:opacity-100">
                        <h1 class="text-3xl font-bold text-white">CATEGORY</h1>
                        <a href="{{ route('frontdesk.food-category') }}" class="shadow-lg px-4 py-1 bg-gray-200 text-gray-600 rounded-full hover:bg-gray-100 transition-colors duration-300"><span class="text-sm">Manage Category</span></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="w-72 p-2 lg:w-72 md:w-72 cursor-pointer">
            <div  class="block ">
                <div class="relative rounded-xl shadow-lg overflow-hidden h-72 ">
                    <img src="{{ asset('images/menu.jpg') }}" alt="Menu Image" class="w-full h-full object-cover transition-transform duration-300 transform hover:scale-105">
                    <div class="absolute inset-0 bg-black bg-opacity-50 transition-opacity duration-300 opacity-75 hover:opacity-100"></div>
                    <div class="absolute inset-0 flex flex-col items-start justify-between p-6 transition-opacity duration-300 opacity-100 hover:opacity-100">
                        <h1 class="text-3xl font-bold text-white">MENU</h1>
                        <a href="{{ route('frontdesk.food-menu') }}" class="shadow-lg px-4 py-1 bg-gray-200 text-gray-600 rounded-full hover:bg-gray-100 transition-colors duration-300">
                                <span class="text-sm">Manage Menu</span>
                          </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="w-72 p-2 lg:w-72 md:w-72">
            <div  class="block">
                <div class="relative rounded-xl shadow-lg overflow-hidden h-72">
                    <img src="{{ asset('images/inventories.jpg') }}" alt="Category Image" class="w-full h-full object-cover transition-transform duration-300 transform hover:scale-105 scale-100">
                    <div class="absolute inset-0 bg-black bg-opacity-50 transition-opacity duration-300 opacity-75 hover:opacity-100"></div>
                    <div class="absolute inset-0 flex flex-col items-start justify-between p-6 transition-opacity duration-300 opacity-100 hover:opacity-100">
                        <h1 class="text-3xl font-bold text-white">INVENTORY</h1>
                        <a href="{{ route('frontdesk.food-inventories') }}" class="shadow-lg px-4 py-1 bg-gray-200 text-gray-600 rounded-full hover:bg-gray-100 transition-colors duration-300"><span class="text-sm">Manage Inventory</span></a>
                    </div>
                </div>
            </div>
        </div>
          {{-- <div class="w-full p-2 lg:w-1/4 md:w-1/2">
            <a href="{{route('frontdesk.food-menu')}}">
                <div
                class="flex flex-col px-6 py-10 overflow-hidden bg-white hover:bg-gradient-to-br hover:from-purple-400 hover:via-blue-400 hover:to-blue-500 rounded-xl shadow-lg duration-300 hover:shadow-2xl group">
                <div class="flex flex-row justify-between items-center">
                  <div class="px-4 py-4 bg-gray-300  rounded-xl bg-opacity-30">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 group-hover:text-gray-50" viewBox="0 0 20 20"
                      fill="currentColor">
                      <path d="M5 4a2 2 0 012-2h6a2 2 0 012 2v14l-5-2.5L5 18V4z" />
                    </svg>
                  </div>
                </div>
                <h1 class="text-3xl sm:text-4xl xl:text-5xl font-bold text-gray-700 mt-12 group-hover:text-gray-50">Menu</h1>
              </div>
            </a>
          </div>
          <div class="w-full p-2 lg:w-1/4 md:w-1/2">
            <a href="{{route('frontdesk.food-inventories')}}">
                <div
                class="flex flex-col px-6 py-10 overflow-hidden bg-white hover:bg-gradient-to-br hover:from-purple-400 hover:via-blue-400 hover:to-blue-500 rounded-xl shadow-lg duration-300 hover:shadow-2xl group">
                <div class="flex flex-row justify-between items-center">
                  <div class="px-4 py-4 bg-gray-300  rounded-xl bg-opacity-30">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 group-hover:text-gray-50" viewBox="0 0 20 20"
                      fill="currentColor">
                      <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" />
                      <path fill-rule="evenodd"
                        d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z"
                        clip-rule="evenodd" />
                    </svg>
                  </div>
                </div>
                <h1 class="text-3xl sm:text-4xl xl:text-5xl font-bold text-gray-700 mt-12 group-hover:text-gray-50">Inventory</h1>
              </div>
            </a>
          </div> --}}
        </div>
      </div>


  </x-admin-layout>
