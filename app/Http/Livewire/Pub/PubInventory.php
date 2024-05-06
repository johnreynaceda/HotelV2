<?php

namespace App\Http\Livewire\Pub;

use App\Models\PubMenu;
use Livewire\Component;
use App\Models\PubInventory as InventoryModel;
use WireUi\Traits\Actions;
use App\Models\PubCategory;

class PubInventory extends Component
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
        $this->category = PubCategory::all();
    }

    public function addStock($id)
    {
        $this->add_stock_modal = true;

        $this->menu_item = PubMenu::where('id', $id)->first();
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
                'pub_menu_id' => $this->menu_item->id,
                'number_of_serving' => $this->menu_quantity
            ]);
        }else{
            $this->menu_item->pubInventory->update([
                'number_of_serving' => $this->menu_item->pubInventory->number_of_serving + $this->menu_quantity,
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
        return view('livewire.pub.pub-inventory', [
            'menus' => $this->selectedItem ? PubMenu::where('pub_category_id', $this->selectedItem)->get() : [],
        ]);
    }
}
