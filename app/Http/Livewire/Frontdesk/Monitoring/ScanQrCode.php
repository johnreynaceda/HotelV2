<?php

namespace App\Http\Livewire\Frontdesk\Monitoring;

use App\Models\Guest;
use Livewire\Component;
use WireUi\Traits\Actions;

class ScanQrCode extends Component
{
    public $scannedCode;
    use Actions;
    public function verifyCode()
    {
        $guest = Guest::where('branch_id', auth()->user()->branch_id)
            ->where('qr_code', $this->scannedCode)
            ->first();

        if ($guest) {
            if($guest->checkInDetail()->exists())
            {
                $this->reset('scannedCode');
               return redirect()->route('frontdesk.manage-guest', $guest);
            }
            else{
                $this->reset('scannedCode');
                return redirect()->route('frontdesk.check-in-from-kiosk', $guest->id);
            }
        }else{
            $this->reset('scannedCode');
            $this->dialog()->error(
                $title = 'QR Code Not Found!',
                $body = 'Guest is not registered.'
            );
        }
    }

    public function render()
    {
        return view('livewire.frontdesk.monitoring.scan-qr-code');
    }
}
