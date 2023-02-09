@section('breadcrumbs')
  Reports
@endsection
<x-back-office-layout>
  <div class="w-96">
    <x-native-select label="Report Type" class="font-normal" wire:model="model">
      <option>Select Report</option>
      <option>Occupied Room</option>
      <option>Guest</option>
      <option>Overdue Rooms</option>
      <option>Roomboys</option>
      <option>Sales</option>
      <option>Number of Stay</option>
      <option>Time Interval</option>
      <option>Transfer</option>
      <option>Extend</option>
    </x-native-select>
  </div>
  <div class="mt-5 bg-white rounded-lg shadow-lg p-5">
    <div class="flex justify-between items-end">
      <x-datetime-picker label="Date" wire:model.defer="normalPicker" without-time without-tips />
      <div>
        <x-button label="Print Report" icon="printer" dark />
      </div>
    </div>
    <div class="mt-5 ">
      <div class="border-2 p-5">
        <div class="flex space-x-2 items-center justify-start">
          <x-svg.hotel class="w-10 h-10 text-gray-600" />
          <div class="border-l-2 border-gray-500 pl-2">
            <div class="text-gray-500 text-xl font-bold">HIMS</div>
            <div class="text-gray-600 font-rubik border-t text-sm  leading-4">
              {{ auth()->user()->branch_name }}
            </div>
          </div>
        </div>

        <div class="pt-10 pb-5">
          <h1 class="text-2xl text-center text-gray-600 font-bold">{REPORT TYPE}</h1>
        </div>
      </div>
    </div>
  </div>
</x-back-office-layout>
