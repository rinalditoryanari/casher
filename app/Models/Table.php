<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

    class Table extends Model
{
    public function order()
    {
        return $this->hasOne(Order::class, 'id_table');
    }
}
