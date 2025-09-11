@section('breadcrumbs')
  Reservation
@endsection
@section('childBreadcrumbs')
  The reservation function should only apply to C/O guests, meaning only authorized personnel are allowed to accommodate the guest without actual cash payment
@endsection
<x-admin-layout>
  <livewire:admin.manage.reservation />
</x-admin-layout>
