<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Order extends Model
{
    /**
     * @var float|int|mixed
     */

    protected $fillable = ['id_table', 'total_price'];


    public function table(): BelongsTo
    {
        return $this->belongsTo(Table::class, 'id_table');
    }

    public function order_detail(): HasMany
    {
        return $this->hasMany(OrderDetail::class, 'id_order');
    }
}
