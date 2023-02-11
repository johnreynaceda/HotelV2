<div>
  <div class="w-96">
    <x-native-select label="Report Type" class="font-normal" wire:model="type">
      <option selected hidden>Select Report</option>
      <option value="1">Occupied Room</option>
      <option value="2">Guest</option>
      <option value="3">Overdue Rooms</option>
      <option value="4">Roomboys</option>
      <option value="5">Sales</option>
      <option value="6">Number of Stay</option>
      <option value="7">Time Interval</option>
      <option value="8">Transfer</option>
      <option value="9">Extend</option>
    </x-native-select>
  </div>
  <div x-animate>
    @switch($type)
      @case(1)
        <livewire:back-office.reports.occupied-room />
      @break

      @case(2)
        <livewire:back-office.reports.guest />
      @break

      @default
    @endswitch
  </div>
</div>
