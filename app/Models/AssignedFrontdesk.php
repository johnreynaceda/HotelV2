<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AssignedFrontdesk extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function users()
    {
        return $this->belongsTo(User::class);
    }

    public function frontdesk()
    {
        return $this->hasMany(FrontDesk::class);
    }
}