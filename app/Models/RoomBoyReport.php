<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoomBoyReport extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function room()
    {
        return $this->belongsTo(Room::class);
    }

    public function checkinDetail()
    {
        return $this->belongsTo(CheckinDetail::class, 'checkin_details_id');
    }

    public function roomboy()
    {
        return $this->belongsTo(User::class, 'roomboy_id');
    }
}
