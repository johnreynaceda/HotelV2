@if (auth()->user()->hasRole('frontdesk'))
<x-frontdesk-layout>
    <livewire:frontdesk.monitoring.room-monitoring />
  </x-frontdesk-layout>
@elseif(auth()->user()->hasRole('kitchen'))
<x-kitchen-layout>
    <livewire:frontdesk.monitoring.room-monitoring />
</x-kitchen-layout>
@endif
