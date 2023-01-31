<div>
  <div class="assigned">

  </div>
  <div class="mt-10">
    <div>
      <h1 class="border-b-2 uppercase">Frontdesk List</h1>
      <div class="mt-6 flow-root">
        <ul role="list" class="-my-5 divide-y divide-gray-200">
          @foreach ($frontdesks as $frontdesk)
            <li class="py-3">
              <div class="flex items-center space-x-4">
                <div class="flex-shrink-0">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="h-8 fill-green-600">
                    <path fill="none" d="M0 0h24v24H0z" />
                    <path d="M5 20h14v2H5v-2zm7-2a8 8 0 1 1 0-16 8 8 0 0 1 0 16z" />
                  </svg>
                </div>
                <div class="min-w-0 flex-1">
                  <p class="truncate text-sm font-medium text-gray-900">{{ $frontdesk->name }}</p>
                  <p class="truncate text-sm text-gray-500">{{ $frontdesk->number }}</p>
                </div>
                <div>
                  <x-button rounded label="Assign" wire:click="assignFrontdesk({{ $frontdesk->id }})"
                    spinner="assignFrontdesk({{ $frontdesk->id }})" slate sm right-icon="arrow-narrow-right" />
                </div>
              </div>
            </li>
          @endforeach

        </ul>
      </div>

    </div>

  </div>
</div>
