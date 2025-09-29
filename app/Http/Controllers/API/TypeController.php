<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Type;
use Illuminate\Support\Facades\Auth;

class TypeController extends Controller
{
    public function index($branchId)
    {
        $types = Type::where('branch_id', $branchId)->get();

        return response()->json([
            'success' => true,
            'data' => $types
        ]);
    }
}
