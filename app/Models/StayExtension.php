<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StayExtension extends Model
{
    protected $guarded = [];
    use HasFactory;

    public function guest()
    {
        return $this->belongsTo(Guest::class);
    }

    public function extensionRates()
    {
        return $this->belongsTo(ExtensionRate::class);
    }
}
