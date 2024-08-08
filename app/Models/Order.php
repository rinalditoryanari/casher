<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Order extends Model
{
    use HasFactory;

    /**
     * @var float|int|mixed
     */
    public mixed $total_price;
    public mixed $id_table;
    protected $fillable = ['id_table', 'total_price'];


    public function table(): BelongsTo
    {
        return $this->belongsTo(Table::class, 'id_table');
    }

    public function orderDetails(): HasMany
    {
        return $this->hasMany(OrderDetail::class, 'id_order');
    }
}
