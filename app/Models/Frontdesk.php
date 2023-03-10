<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Frontdesk extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function assignedFrontdesks()
    {
        return $this->hasMany(AssignedFrontdesk::class);
    }
}
