<?php

namespace App\Http\Livewire\BackOffice;

use App\Models\FrontdeskInventory;
use Livewire\Component;
use App\Models\Inventory;

class InventoryReport extends Component
{
    public function render()
    {
    $branchId = auth()->user()->branch_id;
    $inventories = FrontdeskInventory::with(['frontdesk_menus.frontdeskCategory'])
        ->where('branch_id', $branchId)
        ->get()
        ->map(function ($inventory) {
            $openingStock = $inventory->opening_stock ?? 0;
            $stockIn = $inventory->stock_in ?? 0;
            $stockOut = $inventory->stock_out ?? 0;
            $wastage = $inventory->wastage ?? 0;

            // Compute closing stock
            $closingStock = ($openingStock + $stockIn) - ($stockOut + $wastage);

            $unitCost = $inventory->menus->price ?? 0;
            $totalValue = $closingStock * $unitCost;

            return [
                'item_code' => $inventory->menus->item_code ?? '',
                'item_name' => $inventory->menus->name ?? '',
                'category' => $inventory->menus->menuCategory->name ?? '',
                'unit' => 'Serving',
                'opening_stock' => $openingStock,
                'stock_in' => $stockIn,
                'stock_out' => $stockOut,
                'wastage' => $wastage,
                'closing_stock' => $closingStock,
                'unit_cost' => $unitCost,
                'total_value' => $totalValue,
            ];
        });

        return view('livewire.back-office.inventory-report', compact('inventories'));
    }

    public function returnBack()
    {
        return redirect()->route('back-office.reports');
    }
}
