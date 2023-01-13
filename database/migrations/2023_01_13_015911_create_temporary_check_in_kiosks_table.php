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
        Schema::create('temporary_check_in_kiosks', function (
            Blueprint $table
        ) {
            $table->id();
            $table->foreignId('branch_id');
            $table->foreignId('room_id');
            $table->foreignId('guest_id');
            $table->dateTime('terminated_at');
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
        Schema::dropIfExists('temporary_check_in_kiosks');
    }
};
