<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CheckOutGuestReport extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function checkinDetail()
    {
        return $this->belongsTo(CheckinDetail::class, 'checkin_details_id');
    }

    public function room()
    {
        return $this->belongsTo(Room::class);
    }

    public function frontdesk()
    {
        return $this->belongsTo(Frontdesk::class);
    }
}
