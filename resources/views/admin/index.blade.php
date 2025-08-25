@section('breadcrumbs', 'Admin Dashboard - ' . auth()->user()->branch->name)
<x-admin-layout>
  <div>
    <livewire:components.dashboard />
  </div>
</x-admin-layout>
