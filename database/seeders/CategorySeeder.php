<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    public function run(): void
    {
        $categories = [
            ['name' => 'drink', 'promo' => false],
            ['name' => 'food', 'promo' => false],
            ['name' => 'promo', 'promo' => true],
        ];
        Category::insert($categories);
    }
}
