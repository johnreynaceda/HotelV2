<div>
  <div x-data>
    <div
      class="max-w-3xl px-4 py-2 mx-auto bg-white rounded-t-3xl sm:px-6 md:flex md:items-center md:justify-between md:space-x-5 lg:max-w-7xl lg:px-8 xl:rounded-3xl">
      <div class="flex items-center space-x-5">
        <div class="flex-shrink-0">
          <div class="relative">
            <img class="w-16 h-16 rounded-full" src="https://ui-avatars.com/api/?name={{ auth()->user()->name }}"
              alt="">
            <span class="absolute inset-0 rounded-full shadow-inner" aria-hidden="true"></span>
          </div>
        </div>
        <div>
          <h1 class="text-2xl font-bold text-gray-700">{{ auth()->user()->name }}</h1>
          <p class="text-sm font-medium text-gray-400 flex  items-center">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
              class="w-4 h-4 text-green-600">
              <path fill-rule="evenodd"
                d="M5.25 2.25a3 3 0 00-3 3v4.318a3 3 0 00.879 2.121l9.58 9.581c.92.92 2.39 1.186 3.548.428a18.849 18.849 0 005.441-5.44c.758-1.16.492-2.629-.428-3.548l-9.58-9.581a3 3 0 00-2.122-.879H5.25zM6.375 7.5a1.125 1.125 0 100-2.25 1.125 1.125 0 000 2.25z"
                clip-rule="evenodd" />
            </svg>


            <span class="ml-1">
              @if (auth()->user()->roomboy_assigned_floor_id == null)
                Not Assigned
              @else
                {{ App\Models\Floor::where('id', auth()->user()->roomboy_assigned_floor_id)->first()->numberWithFormat() }}
              @endif
            </span>
          </p>
        </div>
      </div>
      <div
        class="flex flex-col-reverse mt-6 space-y-4 space-y-reverse justify-stretch sm:flex-row-reverse sm:justify-end sm:space-y-0 sm:space-x-3 sm:space-x-reverse md:mt-0 md:flex-row md:space-x-3">
        <div class="flex items-center justify-center space-x-1">
          <span class="text-sm">status:</span>
          @if (auth()->user()->roomboy_cleaning_room_id == null)
            <span
              class="inline-flex items-center rounded-full bg-red-100 px-3 py-0.5 text-sm font-medium text-red-800">Not
              Cleaning</span>
          @else
            <span
              class="inline-flex items-center rounded-full bg-green-100 px-3 py-0.5 text-sm font-medium text-green-800">
              Cleaning</span>
          @endif
        </div>
      </div>
    </div>

    <div
      class="grid max-w-3xl grid-cols-1 gap-6 mx-auto mt-5 sm:px-6 lg:max-w-7xl lg:grid-flow-col-dense lg:grid-cols-3">
      <div class="space-y-6 lg:col-span-2 lg:col-start-1">
        <!-- Description list-->
        <section aria-labelledby="applicant-information-title">
          <div class="bg-white border-b border-x">
            <div class="flex px-4 py-5 space-x-2 sm:px-6">
              <h2 id="applicant-information-title" class="text-sm font-medium leading-6 text-gray-700">Legend: </h2>
              <span
                class="inline-flex items-center rounded-full bg-red-600 px-3 py-0.5 text-sm font-medium text-white">Priority</span>
              <span
                class="inline-flex items-center rounded-full bg-green-600 px-3 py-0.5 text-sm font-medium text-white">Onqueue</span>
              <span
                class="inline-flex items-center rounded-full bg-yellow-600 px-3 py-0.5 text-sm font-medium text-white">Cleaning</span>
            </div>
          </div>

          <div class="mt-3">
            <div class="">
              @if (auth()->user()->roomboy_cleaning_room_id != null)
                <div class="xl:px-2 px-4">
                  <h1 class="font-semibold">
                    Currently Cleaning
                  </h1>

                  <div class="grid grid-cols-1">
                    <div
                      class="bg-gradient-to-br from-transparent via-yellow-100 p-4 to-yellow-200 overflow-hidden relative h-36 border-yellow-600 border-2 rounded-3xl">

                      <svg class="w-40 h-40 absolute -right-5 text-gray-500 opacity-10  top-5"
                        xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M0 0h24v24H0V0z" fill="none"></path>
                        <path d="M7 19h6V5H7v14zm3-8h2v2h-2v-2z" opacity=".3"></path>
                        <path d="M19 19V4h-4V3H5v16H3v2h12V6h2v15h4v-2h-2zm-6 0H7V5h6v14zm-3-8h2v2h-2z"></path>
                      </svg>
                      <div class="px-7">
                        <h1 class="font-bold text-3xl text-gray-600">
                          sdsdsd
                        </h1>

                        <div class="flex space-x-3 mt-2">
                          <span>Time Started:</span>
                          <span>sdsdsd</span>
                        </div>
                        <div class="mt-1">
                          <x-button>
                            Finish Cleaning
                          </x-button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              @endif
              <div class="px-4 mt-4 xl:px-2">
                <h1 class="font-semibold">
                  Assigned Rooms
                </h1>
                <div class="grid xl:grid-cols-2 grid-cols-1 py-1 gap-3">
                  @forelse ($assignedRooms as $room)
                    <div
                      class=" overflow-hidden relative h-36  {{ $loop->first ? 'bg-gradient-to-br from-transparent via-red-100 p-4 to-red-200 border-red-600' : 'bg-gradient-to-br from-transparent via-green-100 p-4 to-green-200 border-green-600' }} border-2 rounded-3xl">

                      <svg class="w-40 h-40 absolute -right-5 text-gray-500 opacity-10  top-5"
                        xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M0 0h24v24H0V0z" fill="none"></path>
                        <path d="M7 19h6V5H7v14zm3-8h2v2h-2v-2z" opacity=".3"></path>
                        <path d="M19 19V4h-4V3H5v16H3v2h12V6h2v15h4v-2h-2zm-6 0H7V5h6v14zm-3-8h2v2h-2z"></path>
                      </svg>
                      <div class="px-7">
                        <h1 class="font-bold text-3xl text-gray-600">
                          {{ $room->numberWithFormat() }}
                        </h1>
                        @php
                          $expires = \Carbon\Carbon::parse($room->time_to_clean);
                        @endphp
                        <div class="flex space-x-3 mt-2">
                          <span>Time to clean:</span>
                          <x-countdown :$expires>
                            <span class="font-medium text-red-600" x-text="timer.days">{{ $component->days() }}</span>
                            :
                            <span class="font-medium text-red-600" x-text="timer.hours">{{ $component->hours() }}</span>
                            :
                            <span class="font-medium text-red-600"
                              x-text="timer.minutes">{{ $component->minutes() }}</span> :
                            <span class="font-medium text-red-600"
                              x-text="timer.seconds">{{ $component->seconds() }}</span>
                          </x-countdown>
                        </div>
                        <div class="mt-1">
                          <x-button sm dark>
                            Start Cleaning
                          </x-button>
                        </div>
                      </div>
                    </div>
                  @empty
                  @endforelse
                </div>
              </div>
              <div class="mt-4 px-4 xl:px-2">
                <h1 class="font-semibold">
                  Unassigned Rooms
                </h1>

                <div class="grid xl:grid-cols-2 grid-cols-1  gap-3 py-1">
                  @forelse ($unassignedRooms as $unassignedRoom)
                    <div
                      class="bg-gradient-to-br from-transparent via-red-100 p-4 to-red-200 overflow-hidden relative h-36 border-red-600 border-2 rounded-3xl">

                      <svg class="w-40 h-40 absolute -right-5 text-gray-500 opacity-10  top-5"
                        xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M0 0h24v24H0V0z" fill="none"></path>
                        <path d="M7 19h6V5H7v14zm3-8h2v2h-2v-2z" opacity=".3"></path>
                        <path d="M19 19V4h-4V3H5v16H3v2h12V6h2v15h4v-2h-2zm-6 0H7V5h6v14zm-3-8h2v2h-2z"></path>
                      </svg>
                      <div class="px-7">
                        <h1 class="font-bold text-3xl text-gray-600"> {{ $unassignedRoom->numberWithFormat() }}
                        </h1>
                        @php
                          $expires = \Carbon\Carbon::parse($unassignedRoom->time_to_clean);
                        @endphp
                        <div class="flex space-x-3 mt-2">
                          <span>Time to clean:</span>
                          <x-countdown :$expires>
                            <span class="font-medium text-red-600" x-text="timer.days">{{ $component->days() }}</span>
                            :
                            <span class="font-medium text-red-600"
                              x-text="timer.hours">{{ $component->hours() }}</span> :
                            <span class="font-medium text-red-600"
                              x-text="timer.minutes">{{ $component->minutes() }}</span> :
                            <span class="font-medium text-red-600"
                              x-text="timer.seconds">{{ $component->seconds() }}</span>
                          </x-countdown>
                        </div>
                        <div class="mt-1">
                          <x-button label="Start Cleaning" dark />
                        </div>
                      </div>
                    </div>
                  @empty
                    <div class="flex col-span-2 py-1 bg-gray-300 justify-center items-center">
                      <span>No Unclean room.</span>
                    </div>
                  @endforelse
                </div>
              </div>
            </div>
          </div>
          {{-- <x-confirm name="clean-assigned-room" title="Confirm"
                message="Are you sure you want to clean this room?" onConfirm="cleanAssignedRoom(params.id)" />
              <x-confirm name="finish-cleaning" title="Confirm"
                message="Are you sure you want to finish cleaning this room?" onConfirm="finishCleaing()" /> --}}
        </section>

      </div>

      <section aria-labelledby="timeline-title" class="lg:col-span-1 lg:col-start-3">
        <div class="px-4 py-5 bg-white shadow sm:rounded-lg sm:px-6">
          <h2 id="timeline-title" class="text-lg font-medium text-gray-900">Timeline</h2>

          <!-- Activity Feed -->
          {{-- <div class="flow-root mt-6">
                <ul role="list" class="">
                  @forelse (auth()->user()->cleaningHistories as $history)
                    <li>
                      <div class="relative pb-3 ">

                        <div class="relative flex space-x-3">
                          <div>
                            <span
                              class="flex items-center justify-center w-8 h-8 
                        
                        @if ($history->delayed_cleaning == 0) bg-green-500
                        @else
                            bg-red-500 @endif
                        rounded-full ring-8 ring-white">
                              <!-- Heroicon name: mini/user -->
                              <svg class="w-5 h-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none"
                                viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                  d="M12 8v5">
                                </path>
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10"
                                  stroke-width="1.5" d="M9 2h6"></path>
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                  d="M5 8a8.696 8.696 0 00-1.75 5.25C3.25 18.08 7.17 22 12 22s8.75-3.92 8.75-8.75S16.83 4.5 12 4.5c-1.26 0-2.45.26-3.53.74">
                                </path>
                              </svg>
                            </span>
                          </div>
                          <div class="flex min-w-0 flex-1 justify-between space-x-4 pt-1.5">
                            <div>
                              <p class="text-sm font-bold text-gray-500">{{ $history->room->numberWithFormat() }}</p>
                            </div>
                            <div class="text-sm text-right text-gray-500 whitespace-nowrap">
                              <time
                                datetime="2020-09-20">{{ \Carbon\Carbon::parse($history->end_date)->format('M. d, Y') }}</time>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                  @empty
                  @endforelse


                </ul>
              </div> --}}
        </div>
      </section>
    </div>
  </div>

</div>
