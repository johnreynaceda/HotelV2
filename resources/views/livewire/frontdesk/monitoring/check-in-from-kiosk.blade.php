<div class="p-6">
    <h2 class="text-xl font-semibold text-gray-800 mb-6">Check In Information</h2>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        {{-- Left: Guest Details --}}
        <div class="space-y-4 text-sm text-gray-700">
            <div>
                <label class="block font-medium mb-1">QR Code</label>
                <img src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=1250001"
                     alt="QRCODE : 1250001"
                     class="border rounded-md" />
            </div>
            <div>
                <label class="block font-medium mb-1">Name</label>
                <div class="p-2 bg-gray-100 rounded-md">Test Guest</div>
            </div>
            <div>
                <label class="block font-medium mb-1">Contact Number</label>
                <div class="p-2 bg-gray-100 rounded-md">N/A</div>
            </div>
            <div>
                <label class="block font-medium mb-1">Room Number</label>
                <div class="p-2 bg-gray-100 rounded-md">123</div>
            </div>
            <div>
                <label class="block font-medium mb-1">Staying Hours</label>
                <div class="p-2 bg-gray-100 rounded-md">6</div>
            </div>
            <div class="flex items-center space-x-2">
                <input type="checkbox" checked disabled class="form-checkbox text-blue-600" />
                <span class="text-sm text-gray-700">Grant Discount</span>
            </div>
        </div>

        {{-- Right: Billing Details --}}
        <div class="border rounded-md bg-gray-50 p-4 shadow-sm text-sm text-gray-700">
            <h3 class="text-lg font-semibold text-gray-700 mb-4">Billing Statement</h3>

            <div class="flex justify-between mb-2">
                <span class="text-gray-600">Room Rate:</span>
                <span class="text-gray-800 font-medium">₱ 224.00</span>
            </div>
            <div class="flex justify-between mb-2">
                <span class="text-gray-600">Additional Charges:</span>
                <span class="text-gray-800 font-medium">₱ 200.00</span>
            </div>
            <div class="flex justify-between mb-2">
                <span class="text-red-600">Discount: (Senior & PWD)</span>
                <span class="text-red-600 font-medium">– ₱ 50.00</span>
            </div>

            <hr class="my-2">

            <div class="flex justify-between text-base font-semibold text-gray-800 mb-4">
                <span>Total:</span>
                <span>₱ 374.00</span>
            </div>

            <div>
                <label class="block font-medium mb-1">Amount Paid</label>
                <div class="p-2 bg-gray-100 rounded-md">₱ 0.00</div>
            </div>
        </div>
    </div>

    <div class="flex justify-end mt-6 space-x-2">
        {{-- <x-button.secondary>Cancel</x-button.secondary>
        <x-button.primary>Save</x-button.primary> --}}
    </div>
</div>
