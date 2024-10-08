<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'price', 'type'];

    public function category()
    {
        return $this->belongsTo(Category::class, 'id_category');
    }
    public function promo()
    {
        return $this->hasMany(Promo::class, 'id_promo');
    }
}
