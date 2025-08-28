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
        Schema::create('transfer_reasons', function (Blueprint $table) {
            $table->id();
            $table->foreignId('branch_id')->constrained()->onDelete('cascade');
            $table->text('reason');
            $table->timestamps();
        });

        //add column to transactions table transfer_reason_id
        Schema::table('transactions', function (Blueprint $table) {
            $table->foreignId('transfer_reason_id')->nullable()->after('remarks');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transfer_reasons');
        Schema::table('transactions', function (Blueprint $table) {
            $table->dropForeign(['transfer_reason_id']);
            $table->dropColumn('transfer_reason_id');
        });
    }
};
