<?php

use Illuminate\Database\Seeder;

class ProvinceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('articles')->delete();
        for ($i=0; $i < 10; $i++) {
            \App\Article::create([
                'name'   => 'Title '.$i,
            ]);
        }
    }
}
