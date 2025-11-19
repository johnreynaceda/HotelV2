@section('breadcrumbs')
  Check In C/O
@endsection
@section('childBreadcrumbs')
  This check-in function should only apply to C/O guests, meaning only authorized personnel are allowed to accommodate the guest without actual cash payment
@endsection
<x-admin-layout>
  <livewire:admin.check-in-co />
</x-admin-layout>
