<div>
    <div>
        <dl class="mt-5 grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-4">
            <div class="relative overflow-hidden rounded-lg bg-white px-4 pt-5 shadow sm:px-6 sm:pt-6">
                <p class="truncate text-md font-semibold text-gray-500">Checked In Today</p>
                <dd class="mt-5 flex items-baseline pb-6 sm:pb-7">
                    <div class="flex space-x-4">
                        <div class="rounded-md bg-blue-600 p-3">
                            <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15M12 9l-3 3m0 0 3 3m-3-3h12.75" />
                            </svg>
                        </div>
                        <div>
                            <p class="text-5xl font-semibold text-gray-700">{{$check_in_today}}</p>
                        </div>
                    </div>
                  <div class="absolute inset-x-0 bottom-0 bg-blue-500 px-4 py-1 sm:px-6">
                    <div class="text-sm">
                      <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500"><span class="sr-only"> Total Subscribers stats</span></a>
                    </div>
                  </div>
                </dd>
              </div>
              <div class="relative overflow-hidden rounded-lg bg-white px-4 pt-5 shadow sm:px-6 sm:pt-6">
                <p class="truncate text-md font-semibold text-gray-500">Checked Out Today</p>
                <dd class="mt-5 flex items-baseline pb-6 sm:pb-7">
                    <div class="flex space-x-4">
                        <div class="rounded-md bg-blue-600 p-3">
                            <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15M12 9l-3 3m0 0 3 3m-3-3h12.75" />
                            </svg>
                        </div>
                        <div>
                            <p class="text-5xl font-semibold text-gray-700">{{$check_out_today}}</p>
                        </div>
                    </div>
                  <div class="absolute inset-x-0 bottom-0 bg-blue-500 px-4 py-1 sm:px-6">
                    <div class="text-sm">
                      <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500"><span class="sr-only"> Total Subscribers stats</span></a>
                    </div>
                  </div>
                </dd>
              </div>
              <div class="relative overflow-hidden rounded-lg bg-white px-4 pt-5 shadow sm:px-6 sm:pt-6">
                <p class="truncate text-md font-semibold text-gray-500">Total Check In</p>
                <dd class="mt-5 flex items-baseline pb-6 sm:pb-7">
                    <div class="flex space-x-4">
                        <div class="rounded-md bg-blue-600 p-3">
                            <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15M12 9l-3 3m0 0 3 3m-3-3h12.75" />
                            </svg>
                        </div>
                        <div>
                            <p class="text-5xl font-semibold text-gray-700">{{$total_check_in}}</p>
                        </div>
                    </div>
                  <div class="absolute inset-x-0 bottom-0 bg-blue-500 px-4 py-1 sm:px-6">
                    <div class="text-sm">
                      <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500"><span class="sr-only"> Total Subscribers stats</span></a>
                    </div>
                  </div>
                </dd>
              </div>
              <div class="relative overflow-hidden rounded-lg bg-white px-4 pt-5 shadow sm:px-6 sm:pt-6">
                <p class="truncate text-md font-semibold text-gray-500">Total Check Out</p>
                <dd class="mt-5 flex items-baseline pb-6 sm:pb-7">
                    <div class="flex space-x-4">
                        <div class="rounded-md bg-blue-600 p-3">
                            <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15M12 9l-3 3m0 0 3 3m-3-3h12.75" />
                            </svg>
                        </div>
                        <div>
                            <p class="text-5xl font-semibold text-gray-700">{{$total_check_out}}</p>
                        </div>
                    </div>
                  <div class="absolute inset-x-0 bottom-0 bg-blue-500 px-4 py-1 sm:px-6">
                    <div class="text-sm">
                      <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500"><span class="sr-only"> Total Subscribers stats</span></a>
                    </div>
                  </div>
                </dd>
              </div>

        </dl>
    </div>
    {{-- <div>
        <h2 class="text-sm font-medium text-gray-500">TODAY'S STATISTIC OVERVIEW</h2>
        <div>
          <dl class="mt-5 grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-3">
            <div class="relative overflow-hidden rounded-lg bg-white px-4 pb-12 pt-5 shadow sm:px-6 sm:pt-6">
              <dt>
                <div class="absolute rounded-md bg-blue-600 p-3">
                  <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15M12 9l-3 3m0 0 3 3m-3-3h12.75" />
                  </svg>
                </div>
                <p class="ml-16 truncate text-sm font-semibold text-gray-500">Checked In Today</p>
              </dt>
              <dd class="ml-16 flex items-baseline pb-6 sm:pb-7">
                <p class="text-2xl font-semibold text-gray-900">{{$check_in_today}}</p>
                <div class="absolute inset-x-0 bottom-0 bg-blue-500 px-4 py-4 sm:px-6">
                  <div class="text-sm">
                    <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500"><span class="sr-only"> Total Subscribers stats</span></a>
                  </div>
                </div>
              </dd>
            </div>
            <div class="relative overflow-hidden rounded-lg bg-white px-4 pb-12 pt-5 shadow sm:px-6 sm:pt-6">
              <dt>
                <div class="absolute rounded-md bg-blue-600 p-3">
                  <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9" />
                  </svg>
                </div>
                <p class="ml-16 truncate text-sm font-medium text-gray-500">Checked Out Today</p>
              </dt>
              <dd class="ml-16 flex items-baseline pb-6 sm:pb-7">
                <p class="text-2xl font-semibold text-gray-900">{{$check_out_today}}</p>
                <div class="absolute inset-x-0 bottom-0 bg-blue-500 px-4 py-4 sm:px-6">
                  <div class="text-sm">
                    <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500"><span class="sr-only"> Avg. Open Rate stats</span></a>
                  </div>
                </div>
              </dd>
            </div>
            <div class="relative overflow-hidden rounded-lg bg-white px-4 pb-12 pt-5 shadow sm:px-6 sm:pt-6">
              <dt>
                <div class="absolute rounded-md bg-blue-600 p-3">
                  <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 6H5.25A2.25 2.25 0 0 0 3 8.25v10.5A2.25 2.25 0 0 0 5.25 21h10.5A2.25 2.25 0 0 0 18 18.75V10.5m-10.5 6L21 3m0 0h-5.25M21 3v5.25" />
                  </svg>
                </div>
                <p class="ml-16 truncate text-sm font-medium text-gray-500">Expected Check Out Today</p>
              </dt>
              <dd class="ml-16 flex items-baseline pb-6 sm:pb-7">
                <p class="text-2xl font-semibold text-gray-900">{{$expected_check_out}}</p>
                <div class="absolute inset-x-0 bottom-0 bg-blue-500 px-4 py-4 sm:px-6">
                  <div class="text-sm">
                    <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500"><span class="sr-only"> Avg. Click Rate stats</span></a>
                  </div>
                </div>
              </dd>
            </div>
          </dl>
        </div>
      </div> --}}

      <div>
        {{-- <h2 class="text-sm font-medium text-gray-500 mt-5">TOTAL STATISTIC OVERVIEW</h2> --}}
        <dl class="mt-5 grid grid-cols-1 gap-5 sm:grid-cols-2">
          {{-- <div class="relative overflow-hidden rounded-lg bg-white px-4 pb-12 pt-5 shadow sm:px-6 sm:pt-6">
            <dt>
              <div class="absolute rounded-md bg-blue-600 p-3">
                <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15M12 9l-3 3m0 0 3 3m-3-3h12.75" />
                </svg>
              </div>
              <p class="ml-16 truncate text-sm font-semibold text-gray-500">Total Check In</p>
            </dt>
            <dd class="ml-16 flex items-baseline pb-6 sm:pb-7">
              <p class="text-2xl font-semibold text-gray-900">{{$total_check_in}}</p>
              <div class="absolute inset-x-0 bottom-0 bg-blue-500 px-4 py-4 sm:px-6">
                <div class="text-sm">
                  <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500"><span class="sr-only"> Total Subscribers stats</span></a>
                </div>
              </div>
            </dd>
          </div>

          <div class="relative overflow-hidden rounded-lg bg-white px-4 pb-12 pt-5 shadow sm:px-6 sm:pt-6">
            <dt>
              <div class="absolute rounded-md bg-blue-600 p-3">
                <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9" />
                </svg>
              </div>
              <p class="ml-16 truncate text-sm font-semibold text-gray-500">Total Check Out</p>
            </dt>
            <dd class="ml-16 flex items-baseline pb-6 sm:pb-7">
              <p class="text-2xl font-semibold text-gray-900">{{$total_check_out}}</p>
              <div class="absolute inset-x-0 bottom-0 bg-blue-500 px-4 py-4 sm:px-6">
                <div class="text-sm">
                  <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500"><span class="sr-only"> Total Subscribers stats</span></a>
                </div>
              </div>
            </dd>
          </div> --}}


          @if(auth()->user()->hasRole('admin'))
            <div class="w-full ">
                <livewire:components.chart />
            </div>
          @endif
        </dl>
        {{-- chart --}}
        @if(auth()->user()->hasRole('frontdesk'))
        <div class="px-4">
            <livewire:components.chart />
        </div>
        @endif
        {{-- @if(auth()->user()->hasRole('kitchen'))
        <div class="px-4">
            <livewire:components.chart />
        </div>
        @endif --}}
      </div>


    {{-- <div class="grid grid-cols-4 gap-4">
        <div class="col-span-3">
            <h2 class="text-sm font-medium text-gray-500">TODAY'S STATISTIC OVERVIEW</h2>
            <ul role="list" class="mt-3 grid grid-cols-2 gap-5 sm:grid-cols-2 sm:gap-6 lg:grid-cols-2">
              <li class="col-span-1 flex rounded-md shadow-sm">
                <div class="flex-shrink-0 flex items-center justify-center w-16 bg-pink-600 text-white text-sm font-medium rounded-l-md">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 3v11.25A2.25 2.25 0 006 16.5h2.25M3.75 3h-1.5m1.5 0h16.5m0 0h1.5m-1.5 0v11.25A2.25 2.25 0 0118 16.5h-2.25m-7.5 0h7.5m-7.5 0l-1 3m8.5-3l1 3m0 0l.5 1.5m-.5-1.5h-9.5m0 0l-.5 1.5M9 11.25v1.5M12 9v3.75m3-6v6" />
                  </svg>
                </div>
                <div class="flex flex-1 items-center justify-between truncate rounded-r-md border-t border-r border-b border-gray-200 bg-white">
                  <div class="flex-1 truncate px-4 py-2 text-sm">
                    <a href="#" class="font-medium text-gray-900 hover:text-gray-600">Checked In Today</a>
                    <p class="text-gray-500">{{$check_in_today}}</p>
                  </div>
                  <div class="flex-shrink-0 pr-2">
                    <button type="button" class="inline-flex h-8 w-8 items-center justify-center rounded-full bg-white bg-transparent text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                      <span class="sr-only">Open options</span>
                      <svg class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                        <path d="M10 3a1.5 1.5 0 110 3 1.5 1.5 0 010-3zM10 8.5a1.5 1.5 0 110 3 1.5 1.5 0 010-3zM11.5 15.5a1.5 1.5 0 10-3 0 1.5 1.5 0 003 0z" />
                      </svg>
                    </button>
                  </div>
                </div>
              </li>

              <li class="col-span-1 flex rounded-md shadow-sm">
                <div class="flex-shrink-0 flex items-center justify-center w-16 bg-purple-600 text-white text-sm font-medium rounded-l-md">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 3v11.25A2.25 2.25 0 006 16.5h2.25M3.75 3h-1.5m1.5 0h16.5m0 0h1.5m-1.5 0v11.25A2.25 2.25 0 0118 16.5h-2.25m-7.5 0h7.5m-7.5 0l-1 3m8.5-3l1 3m0 0l.5 1.5m-.5-1.5h-9.5m0 0l-.5 1.5M9 11.25v1.5M12 9v3.75m3-6v6" />
                  </svg>
                </div>
                <div class="flex flex-1 items-center justify-between truncate rounded-r-md border-t border-r border-b border-gray-200 bg-white">
                  <div class="flex-1 truncate px-4 py-2 text-sm">
                    <a href="#" class="font-medium text-gray-900 hover:text-gray-600">Checked Out Today</a>
                    <p class="text-gray-500">{{$check_out_today}}</p>
                  </div>
                  <div class="flex-shrink-0 pr-2">
                    <button type="button" class="inline-flex h-8 w-8 items-center justify-center rounded-full bg-white bg-transparent text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                      <span class="sr-only">Open options</span>
                      <svg class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                        <path d="M10 3a1.5 1.5 0 110 3 1.5 1.5 0 010-3zM10 8.5a1.5 1.5 0 110 3 1.5 1.5 0 010-3zM11.5 15.5a1.5 1.5 0 10-3 0 1.5 1.5 0 003 0z" />
                      </svg>
                    </button>
                  </div>
                </div>
              </li>

              <li class="col-span-1 flex rounded-md shadow-sm">
                <div class="flex-shrink-0 flex items-center justify-center w-16 bg-yellow-500 text-white text-sm font-medium rounded-l-md">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 3v11.25A2.25 2.25 0 006 16.5h2.25M3.75 3h-1.5m1.5 0h16.5m0 0h1.5m-1.5 0v11.25A2.25 2.25 0 0118 16.5h-2.25m-7.5 0h7.5m-7.5 0l-1 3m8.5-3l1 3m0 0l.5 1.5m-.5-1.5h-9.5m0 0l-.5 1.5M9 11.25v1.5M12 9v3.75m3-6v6" />
                  </svg>
                </div>
                <div class="flex flex-1 items-center justify-between truncate rounded-r-md border-t border-r border-b border-gray-200 bg-white">
                  <div class="flex-1 truncate px-4 py-2 text-sm">
                    <a href="#" class="font-medium text-gray-900 hover:text-gray-600">Expected Check Out Today</a>
                    <p class="text-gray-500">{{$expected_check_out}}</p>
                  </div>
                  <div class="flex-shrink-0 pr-2">
                    <button type="button" class="inline-flex h-8 w-8 items-center justify-center rounded-full bg-white bg-transparent text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                      <span class="sr-only">Open options</span>
                      <svg class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                        <path d="M10 3a1.5 1.5 0 110 3 1.5 1.5 0 010-3zM10 8.5a1.5 1.5 0 110 3 1.5 1.5 0 010-3zM11.5 15.5a1.5 1.5 0 10-3 0 1.5 1.5 0 003 0z" />
                      </svg>
                    </button>
                  </div>
                </div>
              </li>


            </ul>
          </div>
          <div class="col-span-1 border border-dashed border-gray-400 mt-8">

          </div>
    </div>
    <div class="mt-5">
        <h2 class="text-sm font-medium text-gray-500">TOTAL STATISTIC OVERVIEW</h2>
        <ul role="list" class="mt-3 grid grid-cols-2 gap-5 sm:grid-cols-2 sm:gap-6 lg:grid-cols-2">
          <li class="col-span-1 flex rounded-md shadow-sm">
            <div class="flex-shrink-0 flex items-center justify-center w-16 bg-pink-600 text-white text-sm font-medium rounded-l-md">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 3v11.25A2.25 2.25 0 006 16.5h2.25M3.75 3h-1.5m1.5 0h16.5m0 0h1.5m-1.5 0v11.25A2.25 2.25 0 0118 16.5h-2.25m-7.5 0h7.5m-7.5 0l-1 3m8.5-3l1 3m0 0l.5 1.5m-.5-1.5h-9.5m0 0l-.5 1.5M9 11.25v1.5M12 9v3.75m3-6v6" />
              </svg>
            </div>
            <div class="flex flex-1 items-center justify-between truncate rounded-r-md border-t border-r border-b border-gray-200 bg-white">
              <div class="flex-1 truncate px-4 py-2 text-sm">
                <a href="#" class="font-medium text-gray-900 hover:text-gray-600">Total Check In</a>
                <p class="text-gray-500">{{$total_check_in}}</p>
              </div>
              <div class="flex-shrink-0 pr-2">
                <button type="button" class="inline-flex h-8 w-8 items-center justify-center rounded-full bg-white bg-transparent text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                  <span class="sr-only">Open options</span>
                  <svg class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path d="M10 3a1.5 1.5 0 110 3 1.5 1.5 0 010-3zM10 8.5a1.5 1.5 0 110 3 1.5 1.5 0 010-3zM11.5 15.5a1.5 1.5 0 10-3 0 1.5 1.5 0 003 0z" />
                  </svg>
                </button>
              </div>
            </div>
          </li>

          <li class="col-span-1 flex rounded-md shadow-sm">
            <div class="flex-shrink-0 flex items-center justify-center w-16 bg-pink-600 text-white text-sm font-medium rounded-l-md">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 3v11.25A2.25 2.25 0 006 16.5h2.25M3.75 3h-1.5m1.5 0h16.5m0 0h1.5m-1.5 0v11.25A2.25 2.25 0 0118 16.5h-2.25m-7.5 0h7.5m-7.5 0l-1 3m8.5-3l1 3m0 0l.5 1.5m-.5-1.5h-9.5m0 0l-.5 1.5M9 11.25v1.5M12 9v3.75m3-6v6" />
              </svg>
            </div>
            <div class="flex flex-1 items-center justify-between truncate rounded-r-md border-t border-r border-b border-gray-200 bg-white">
              <div class="flex-1 truncate px-4 py-2 text-sm">
                <a href="#" class="font-medium text-gray-900 hover:text-gray-600">Total Check Out</a>
                <p class="text-gray-500">{{$total_check_out}}</p>
              </div>
              <div class="flex-shrink-0 pr-2">
                <button type="button" class="inline-flex h-8 w-8 items-center justify-center rounded-full bg-white bg-transparent text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                  <span class="sr-only">Open options</span>
                  <svg class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path d="M10 3a1.5 1.5 0 110 3 1.5 1.5 0 010-3zM10 8.5a1.5 1.5 0 110 3 1.5 1.5 0 010-3zM11.5 15.5a1.5 1.5 0 10-3 0 1.5 1.5 0 003 0z" />
                  </svg>
                </button>
              </div>
            </div>
          </li>

        </ul>
      </div> --}}

</div>
