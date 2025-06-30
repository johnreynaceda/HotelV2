<div>
    {{-- <div class="grid grid-cols-3 mt-56">
        <div class="grid col-start-2">
            <img src="{{ asset('images/darbc.png') }}" class="mx-auto xl:h-24 xl:w-2h-24 sm:h-16 sm:w-24" alt="">
        </div>
    </div> --}}
    <div>
        <h1 class="text-6xl text-center font-bold text-gray-700 mt-5">SCAN QR CODE (CHECK-IN & CHECK-OUT)</h1>
    </div>
    <div class="flex justify-center mt-5">
        <input wire:model="scannedCode" wire:change="verifyCode" type="text" id="qrInput" class="text-center p-4 text-2xl focus:outline-none w-full mx-14 rounded-md" autofocus>
    </div>
    <small  class="flex justify-center mt-3 font-medium">*Scan QR Code Here*</small>
</div>

<script>
    const qrInput = document.getElementById('qrInput');
    qrInput.addEventListener('blur', () => {
        qrInput.focus();
    });
</script>
