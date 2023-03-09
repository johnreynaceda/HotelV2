<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Guest extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function temporaryCheckInKiosks()
    {
        return $this->hasMany(TemporaryCheckInKiosk::class);
    }

    public function room()
    {
        return $this->belongsTo(Room::class);
    }

    public function rates()
    {
        return $this->belongsTo(Rate::class, 'rate_id');
    }

    public function checkInDetail()
    {
        return $this->hasOne(CheckinDetail::class, 'guest_id');
    }

    public function transactions()
    {
        return $this->hasMany(Transaction::class);
    }

    public function stayExtensions()
    {
        return $this->hasMany(StayExtension::class);
    }

    public function temporary_reserved()
    {
        return $this->hasMany(TemporaryReserve::class);
    }
}
