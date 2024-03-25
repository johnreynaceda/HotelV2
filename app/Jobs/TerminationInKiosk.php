<?php

namespace App\Jobs;

use App\Models\TemporaryCheckInKiosk;
use Carbon\Carbon;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class TerminationInKiosk implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $room_id;
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($room_id)
    {
        $this->room_id = $room_id;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        dd('test');
        // $temporaryCheckInKiosk = TemporaryCheckInKiosk::where(
        //     'room_id',
        //     $this->room_id
        // )
        //     ->first()
        //     ->delete();
    }
}
