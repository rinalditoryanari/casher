<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Printer extends Model
{
    protected $fillable = [
        'name',
        'id_category',
        'promo',
    ];

    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }
}
