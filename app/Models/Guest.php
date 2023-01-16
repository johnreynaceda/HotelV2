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

    public function rates()
    {
        return $this->hasMany(Rate::class);
    }
}
