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
        Schema::create('rooms', function (Blueprint $table) {
            $table->id();
            $table->foreignId('branch_id');
            $table->foreignId('floor_id');
            $table->integer('number');
            $table->string('area')->nullable()->default('Main');
            $table->string('status')->default('available');
            $table->foreignId('type_id');
            $table->boolean('is_priority')->default(false);
            $table->date('last_checkin_at')->nullable();
            $table->date('last_checkout_at')->nullable();
            $table->string('time_to_terminate_queue')->nullable();
            $table->date('check_out_time')->nullable();
            $table->dateTime('time_to_clean')->nullable();
            $table->dateTime('started_cleaning_at')->nullable();
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
        Schema::dropIfExists('rooms');
    }
};
