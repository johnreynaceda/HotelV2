<div>
  <div class="flex mb-3">
    <x-button label="New Reservation" icon="plus" positive wire:click="$set('add_modal', true)"
      spinner="$set('add_modal', true)" />
  </div>
  <div>
    {{ $this->table }}
  </div>

  <x-modal wire:model.defer="add_modal" align="center">
    <x-card title="Add New Reservation">
      <div>
        <div class="header font-bold text-gray-700">GUEST INFORMATION</div>
        <div class="mt-2 grid grid-cols-2 gap-4">
          <x-input label="Guest Name" wire:model.defer="name" placeholder="" />
          <x-input right-icon="user" wire:model="contact_number" label="Contact Number" placeholder="09" />
        </div>
      </div>
      <div class="mt-5">
        <div x-animate>
          <div class="header font-bold text-green-700">CHECK-IN INFORMATION</div>
          <div class="mt-2 grid grid-cols-2 gap-4">
            <x-native-select label="Room Type" wire:model="type_id">
              <option hidden selected>Select Room Type</option>
              @foreach ($types as $type)
                <option value="{{ $type->id }}">{{ $type->name }}</option>
              @endforeach
            </x-native-select>
            <x-native-select label="Room " wire:model="room_id">
              <option hidden selected>Select Room </option>
              @foreach ($rooms as $room)
                <option value="{{ $room->id }}">{{ $room->numberWithFormat() }}</option>
              @endforeach
            </x-native-select>
            @if (!$is_longStay)
              <x-native-select label="Rate " wire:model="rate_id">
                <option hidden selected>Select Rate</option>
                @foreach ($rates as $rate)
                  <option value="{{ $rate->id }}">
                    {{ $rate->stayingHour->number . ' Hours - ₱' . number_format($rate->amount, 2) }}</option>
                @endforeach
              </x-native-select>

            @endif
            <div class="flex items-end">
              <x-checkbox id="right-label" label="Long Stay" wire:model="is_longStay" />
            </div>
            @if ($is_longStay)
              <x-input label="Number of Days" placeholder="" />
            @endif
          </div>
        </div>
      </div>

      <x-slot name="footer">
        <div class="flex justify-end gap-x-4">
          <x-button flat label="Cancel" x-on:click="close" />
          <x-button positive label="Save" right-icon="save-as" wire:click="saveReservation"
            spinner="saveReservation" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>
</div>
