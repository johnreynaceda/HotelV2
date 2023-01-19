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
        Schema::create('checkin_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('guest_id');
            $table->foreignId('type_id');
            $table->foreignId('room_id');
            $table->foreignId('rate_id');
            $table->integer('static_amount');
            $table->integer('hours_stayed');
            $table->integer('total_deposit');
            $table->dateTime('check_in_at');
            $table->dateTime('check_out_at');
            $table->boolean('is_long_stay');
            $table->integer('number_of_days');
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
        Schema::dropIfExists('checkin_details');
    }
};
