<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Promo extends Model
{
    use HasFactory;

    protected $fillable = [
        'id_promo', 'id_product', 'quantity'
    ];

    public function product()
    {
        $this->belongsTo(Product::class, 'id_product');
    }
}
