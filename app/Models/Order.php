<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Order extends Model
{
    /**
     * @var float|int|mixed
     */

    protected $fillable = ['id_table', 'total_price'];


    public function getAllProduct()
    {
        $details = $this->order_detail;

        $edible = [];
        foreach ($details as $nonpromo) {
            $product = $nonpromo->product;
            $product->quantity = $nonpromo->quantity;
            $edible[] = $product;
        }

        return $edible;
    }

    public function getNonPromoProduct()
    {
        $id_category = Category::where('promo', true)->first()->id;
        $nonpromos = $this->order_detail->filter(function ($orderDetail) use ($id_category) {
            return $orderDetail->product->id_category != $id_category;
        });

        $edible = [];
        foreach ($nonpromos as $nonpromo) {
            $product = $nonpromo->product;
            $product->quantity = $nonpromo->quantity;
            $edible[] = $product;
        }

        return $edible;
    }

    public function getPromoProduct()
    {
        $id_category = Category::where('promo', true)->first()->id;
        $promos = $this->order_detail->filter(function ($orderDetail) use ($id_category) {
            return $orderDetail->product->id_category == $id_category;
        })->load('product.promo', 'product.promo.detail');

        $edible = [];
        foreach ($promos as $promo) {
            foreach ($promo->product->promo as $product) {
                $product->detail->quantity = $product->quantity * $promo->quantity;
                $edible[] = $product->detail;
            }
        }
        return $edible;
    }

    public function table(): BelongsTo
    {
        return $this->belongsTo(Table::class, 'id_table');
    }

    public function order_detail(): HasMany
    {
        return $this->hasMany(OrderDetail::class, 'id_order');
    }
}
