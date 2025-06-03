<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Type;
use Illuminate\Support\Facades\Auth;

class TypeController extends Controller
{
    public function index()
    {
        $types = Type::where('branch_id', Auth::user()->branch_id)->get();

        return response()->json([
            'success' => true,
            'data' => $types
        ]);
    }
}
