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
        Schema::create('transactions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('branch_id');
            $table->foreignId('room_id');
            $table->foreignId('guest_id');
            $table->foreignId('floor_id');
            $table->foreignId('transaction_type_id');
            $table->json('assigned_frontdesk_id');
            $table->string('description');
            $table->integer('payable_amount')->default(0);
            $table->integer('paid_amount')->default(0);
            $table->integer('change_amount')->default(0);
            $table->integer('deposit_amount')->default(0);
            $table->dateTime('paid_at')->nullable();
            $table->dateTime('override_at')->nullable();
            $table->text('remarks');
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
        Schema::dropIfExists('transactions');
    }
};
