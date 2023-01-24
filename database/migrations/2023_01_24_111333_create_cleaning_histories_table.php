<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cleaning_histories', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id');
            $table->foreignId('room_id');
            $table->foreignId('floor_id');
            $table->foreignId('branch_id');
            $table->string('start_time');
            $table->string('end_time');
            $table->boolean('current_assigned_floor_id');
            $table->string('expected_end_time');
            $table->string('cleaning_duration');
            $table->boolean('delayed_cleaning');
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
        Schema::dropIfExists('cleaning_histories');
    }
};
