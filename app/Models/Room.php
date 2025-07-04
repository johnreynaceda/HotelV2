<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function branch()
    {
        return $this->belongsTo(Branch::class);
    }
    public function type()
    {
        return $this->belongsTo(Type::class, 'type_id');
    }

    public function numberWithFormat()
    {
        return 'ROOM #' . $this->number;
    }

    public function floor()
    {
        return $this->belongsTo(Floor::class);
    }

    public function guest()
    {
        return $this->hasMany(Guest::class);
    }

    public function guestRel()
    {
        return $this->hasOneThrough(
            Guest::class,
            CheckInDetail::class,
            'room_id',   // Foreign key on CheckInDetail
            'id',        // Foreign key on Guest
            'id',        // Local key on Room
            'guest_id'   // Local key on CheckInDetail
        );
    }

    public function rates()
    {
        return $this->hasMany(Rate::class);
    }

    public function temporaryCheckInKiosk()
    {
        return $this->hasOne(TemporaryCheckInKiosk::class);
    }

    public function checkInDetail()
    {
        return $this->hasOne(CheckinDetail::class);
    }

    public function checkInDetails()
    {
        return $this->hasMany(CheckinDetail::class);
    }

    public function cleaningHistories()
    {
        return $this->hasMany(CleaningHistory::class);
    }

    public function transactions()
    {
        return $this->hasMany(Transaction::class);
    }

    public function newGuestReports()
    {
        return $this->hasMany(NewGuestReport::class);
    }
    public function checkOutGuestReports()
    {
        return $this->hasMany(CheckOutGuestReport::class);
    }
    public function roomBoyReport()
    {
        return $this->hasMany(RoomBoyReport::class);
    }

    public function extendedGuestReports()
    {
        return $this->hasMany(ExtendedGuestReport::class);
    }

    public function temporary_reserved()
    {
        return $this->hasMany(TemporaryReserve::class);
    }
}
