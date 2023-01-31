<div>
  <div class="assigned">
    <ul role="list" class="divide-y divide-gray-200">
      @forelse ($get_frontdesk as $frontdesk)
        @php
          $frontdesk = \App\Models\Frontdesk::where('id', $frontdesk)->first();
        @endphp
        <li class="flex py-2">
          <img class="h-10 w-10 rounded-full"
            src="https://images.unsplash.com/photo-1491528323818-fdd1faba62cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
            alt="">
          <div class="ml-3">
            <p class="text-sm font-medium text-gray-900">{{ $frontdesk->name }}</p>
            <p class="text-sm text-gray-500">{{ $frontdesk->number }}</p>
          </div>
          <div class="ml-auto">
            <x-button flat negative label="Remove" wire:click="removeFrontdesk({{ $frontdesk->id }})"
              spinner="removeFrontdesk({{ $frontdesk->id }})" sm icon="trash" />
        </li>
      @empty
        <div>Please assign a frontdesk...</div>
      @endforelse
    </ul>
    <div class="flex justify-end  border-t pt-2 ">
      @if (collect($this->get_frontdesk)->count() > 0)
        <x-button label="Save" sm positive right-icon="save-as" wire:click="saveFrontdesk" spinner="saveFrontdesk" />
      @endif

    </div>
  </div>
  <div class="mt-10">
    <div>
      <h1 class="border-b-2 font-bold text-green-600 uppercase">Frontdesk List</h1>
      <div class="mt-6 flow-root">
        <ul role="list" class="-my-5 divide-y divide-gray-200">
          @forelse ($frontdesks as $frontdesk)
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
          @empty
            <div>No frontdesk available</div>
          @endforelse

        </ul>
      </div>

    </div>

  </div>
</div>
