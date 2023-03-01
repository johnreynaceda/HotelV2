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
        Schema::create('room_boy_reports', function (Blueprint $table) {
            $table->id();
            $table->foreignId('room_id');
            $table->foreignId('checkin_details_id');
            $table->foreignId('roomboy_id');
            $table->dateTime('cleaning_start');
            $table->dateTime('cleaning_end');
            $table->integer('total_hours_spent');
            $table->integer('interval');
            $table->string('shift');
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
        Schema::dropIfExists('room_boy_reports');
    }
};
