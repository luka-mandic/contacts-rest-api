<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0');
        DB::table('users')->truncate();
        DB::table('contacts')->truncate();
        DB::table('phone_numbers')->truncate();
        DB::statement('SET FOREIGN_KEY_CHECKS=1');
        $this->call(ContactSeeder::class);
    }
}
