<?php

namespace App\Http\Livewire\Kitchen;

use App\Models\Menu;
use Livewire\Component;
use App\Models\Inventory as InventoryModel;
use WireUi\Traits\Actions;
use App\Models\MenuCategory;

class Inventory extends Component
{
    public $category;
    public $selectedItem;
    public $quantities = [];
    public $add_stock_modal = false;
    public $menu_item;
    public $menu_name;
    public $menu_price;
    public $menu_quantity;

    use Actions;

    public function mount()
    {
        $this->category = MenuCategory::all();
    }

    public function addStock($id)
    {
        $this->add_stock_modal = true;

        $this->menu_item = Menu::where('id', $id)->first();
        $this->menu_name = $this->menu_item->name;
        $this->menu_price = '₱ '.number_format($this->menu_item->price, 2);
    }

    public function saveStock()
    {
        $this->validate([
            'menu_quantity' => 'required|numeric|min:1'
        ]);

        if($this->menu_item->inventory === null)
        {
            InventoryModel::create([
                'branch_id' =>  auth()->user()->branch_id,
                'menu_id' => $this->menu_item->id,
                'number_of_serving' => $this->menu_quantity
            ]);
        }else{
            $this->menu_item->inventory->update([
                'number_of_serving' => $this->menu_item->inventory->number_of_serving + $this->menu_quantity,
            ]);
        }



        $this->add_stock_modal = false;
        $this->menu_quantity = '';

        $this->dialog()->success(
            $title = 'Success',
            $description = 'Stock added successfully',
        );
    }

    public function render()
    {
        return view('livewire.kitchen.inventory', [
            'menus' => $this->selectedItem ? Menu::where('menu_category_id', $this->selectedItem)->get() : [],
        ]);
    }
}
