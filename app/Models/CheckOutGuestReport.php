<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CheckOutGuestReport extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function check_in_details()
    {
        return $this->belongsTo(CheckinDetail::class, 'checkin_details_id');
    }
}
