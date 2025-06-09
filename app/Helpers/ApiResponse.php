<?php

namespace App\Helpers;

use Illuminate\Pagination\LengthAwarePaginator;

class ApiResponse
{
    // Success response
    public static function success($data, $message = 'Success', $code = 200)
    {
        return response()->json([
            'status' => true,
            'message' => $message,
            'data' => $data,
        ], $code);
    }

    // Error response
    public static function error($message = 'Error', $code = 400)
    {
        return response()->json([
            'status' => false,
            'message' => $message,
            'data' => null,
        ], $code);
    }

    // Paginated response
    public static function paginated(LengthAwarePaginator $data, $message = 'Data retrieved successfully', $resource = null, $code = 200)
    {
        // Check if a resource is provided; otherwise, use the plain items.
        $dataItems = $resource ? $resource::collection($data) : $data->items();

        return response()->json([
            'status' => true,
            'message' => $message,
            'data' => $dataItems,
            'pagination' => [
                'current_page' => $data->currentPage(),
                'last_page' => $data->lastPage(),
                'per_page' => $data->perPage(),
                'total' => $data->total(),
                'next_page_url' => $data->nextPageUrl(),
                'prev_page_url' => $data->previousPageUrl(),
            ],
        ], $code);
    }

    // Paginated response with additional data
    public static function paginatedWithData(LengthAwarePaginator $paginator, $message = 'Data retrieved successfully', $resource = null, $additionalData = [], $code = 200)
    {
        // If additionalData contains a 'pagination' key, we'll use that instead of generating it
        $pagination = $additionalData['pagination'] ?? [
            'current_page' => $paginator->currentPage(),
            'last_page' => $paginator->lastPage(),
            'per_page' => $paginator->perPage(),
            'total' => $paginator->total(),
            'next_page_url' => $paginator->nextPageUrl(),
            'prev_page_url' => $paginator->previousPageUrl(),
        ];

        // Remove pagination from additionalData if it exists to avoid duplication
        if (isset($additionalData['pagination'])) {
            unset($additionalData['pagination']);
        }

        // Prepare the response data
        $responseData = [
            'success' => true,
            'message' => $message,
            'pagination' => $pagination,
        ];

        // Merge the additional data into the response
        $responseData = array_merge($responseData, $additionalData);

        return response()->json($responseData, $code);
    }

}
