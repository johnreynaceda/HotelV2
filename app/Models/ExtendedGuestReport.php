<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExtendedGuestReport extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function branch()
    {
        return $this->belongsTo(Branch::class, 'branch_id');
    }

    public function checkinDetail()
    {
        return $this->belongsTo(CheckinDetail::class, 'checkin_details_id');
    }

    public function room()
    {
        return $this->belongsTo(Room::class);
    }
}
