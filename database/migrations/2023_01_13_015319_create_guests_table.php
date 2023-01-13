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
        Schema::create('guests', function (Blueprint $table) {
            $table->id();
            $table->foreignId('branch_id');
            $table->string('name');
            $table->string('contact')->nullable();
            $table->string('qr_code');
            $table->foreignId('room_id');
            $table->foreignId('rate_id');
            $table->foreignId('type_id');
            $table->integer('static_amount');
            $table->boolean('is_long_stay')->default(false);
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
        Schema::dropIfExists('guests');
    }
};
