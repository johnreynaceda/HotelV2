<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function guest()
    {
        return $this->belongsTo(Guest::class);
    }

    public function transaction_type()
    {
        return $this->belongsTo(TransactionType::class);
    }

    public function room()
    {
        return $this->belongsTo(Room::class);
    }

    public function assigned_frontdesk()
    {
        return $this->belongsTo(User::class, 'assigned_frontdesk_id', 'id');
    }

}
