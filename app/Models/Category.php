<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = [
        'name',
        'promo',
    ];

    public function printer()
    {
         return $this->hasOne(Printer::class, 'id_category');
    }
}
