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
        Schema::create('unoccupied_room_reports', function (Blueprint $table) {
            $table->id();
            $table->foreignId('branch_id');
            $table->string('shift');
            $table->longText('rooms');
            $table->integer('frontdesk_id');
            $table->string('partner_name');
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
        Schema::dropIfExists('unoccupied_room_reports');
    }
};
