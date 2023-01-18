<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rate extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function type()
    {
        return $this->belongsTo(Type::class);
    }

    public function guest()
    {
        return $this->hasMany(Guest::class, 'rate_id');
    }

    public function stayingHour()
    {
        return $this->belongsTo(StayingHour::class);
    }
}
