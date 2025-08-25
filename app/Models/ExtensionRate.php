<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExtensionRate extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function stayExtensions()
    {
        return $this->hasMany(StayExtension::class);
    }

    public function branch()
    {
        return $this->belongsTo(Branch::class);
    }
}
