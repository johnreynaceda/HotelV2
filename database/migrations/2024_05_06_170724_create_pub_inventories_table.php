<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pub_inventories', function (Blueprint $table) {
            $table->id();
            $table->foreignId('branch_id');
            $table->foreignId('pub_menu_id');
            $table->double('number_of_serving');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pub_inventories');
    }
};
