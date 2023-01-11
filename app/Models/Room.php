<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function type()
    {
        return $this->belongsTo(Type::class);
    }

    public function numberWithFormat()
    {
        return 'ROOM #' . $this->number;
    }

    public function floor()
    {
        return $this->belongsTo(Floor::class);
    }
}
