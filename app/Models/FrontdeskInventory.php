<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FrontdeskInventory extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function frontdesk_menus()
    {
        return $this->hasMany(FrontdeskMenu::class, 'id', 'frontdesk_menu_id');
    }

}
