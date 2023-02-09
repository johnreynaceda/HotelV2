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
        Schema::create('stay_extensions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('guest_id');
            $table->foreignId('extension_id');
            $table->string('hours');
            $table->string('amount');
            $table->json('frontdesk_ids')->nullable();
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
        Schema::dropIfExists('stay_extensions');
    }
};
