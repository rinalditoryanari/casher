<?php

namespace Database\Seeders;

use App\Models\Table;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tables = [
            ['name' => 'Meja 1'],
            ['name' => 'Meja 2'],
            ['name' => 'Meja 3'],
        ];

        Table::insert($tables);
    }
}
