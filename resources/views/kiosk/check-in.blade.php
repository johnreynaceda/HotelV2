<x-kiosk-layout-update>
  <div class="p-10">
    <div>
     
     <button id="print_qr" data-value="123" class="p-4 bg-green-500">Print QR</button>
      {{-- <x-button id="print_qr" href="{{ route('kiosk.dashboard') }}" label="DONE" right-icon="check" positive lg class="font-bold" /> --}}
    </div>
    @livewire('kiosk.check-in')
    {{-- <livewire:kiosk.check-in /> --}}
  </div>
</x-kiosk-layout-update>
