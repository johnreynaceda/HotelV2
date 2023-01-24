<?php

namespace App\Http\Livewire\Kitchen;

use Livewire\Component;
use App\Models\MenuCategory;
use App\Models\Menu as menuModel;
use App\Models\Inventory;
use DB;
use WireUi\Traits\Actions;

class Menu extends Component
{
    use Actions;
    public $add_modal = false;
    public $edit_modal = false;
    public $menu_id;
    public $name, $price, $category_id, $stock, $default_serving;
    public function render()
    {
        return view('livewire.kitchen.menu', [
            'menuCategories' => MenuCategory::where(
                'branch_id',
                auth()->user()->branch_id
            )
                ->with('menus')
                ->get(),
        ]);
    }

    public function saveMenu()
    {
        $this->validate([
            'name' => 'required',
            'price' => 'required',
            'category_id' => 'required',
            'stock' => 'required',
            'default_serving' => 'required',
        ]);

        DB::beginTransaction();
        $menu = menuModel::create([
            'branch_id' => auth()->user()->branch_id,
            'name' => $this->name,
            'price' => $this->price,
            'menu_category_id' => $this->category_id,
        ]);

        Inventory::create([
            'branch_id' => auth()->user()->branch_id,
            'menu_id' => $menu->id,
            'stock' => $this->stock,
            'default_serving' => $this->default_serving,
            'number_of_serving' => $this->stock / $this->default_serving,
        ]);
        DB::commit();

        $this->add_modal = false;
        $this->reset(
            'name',
            'price',
            'category_id',
            'stock',
            'default_serving'
        );

        $this->dialog()->success(
            $title = 'Success',
            $description = 'Menu has been added'
        );
    }

    public function editItem($menu_id)
    {
        $menu = menuModel::where('id', $menu_id)->first();
        $this->menu_id = $menu->id;
        $this->name = $menu->name;
        $this->price = $menu->price;
        $this->category_id = $menu->menu_category_id;
        $this->stock = $menu->inventory->stock;
        $this->default_serving = $menu->inventory->default_serving;
        $this->edit_modal = true;
    }

    public function updateMenu()
    {
        $menu = menuModel::where('id', $this->menu_id)->first();
        $menu->update([
            'name' => $this->name,
            'price' => $this->price,
            'menu_category_id' => $this->category_id,
        ]);

        $menu->inventory->update([
            'stock' => $this->stock,
            'default_serving' => $this->default_serving,
            'number_of_serving' => $this->stock / $this->default_serving,
        ]);

        $this->edit_modal = false;
        $this->reset(
            'name',
            'price',
            'category_id',
            'stock',
            'default_serving'
        );
        $this->dialog()->success(
            $title = 'Success',
            $description = 'Menu has been updated'
        );
    }

    public function deleteMenu($menu_id)
    {
        $menu = menuModel::where('id', $menu_id)->first();
        $menu->delete();

        $menu->inventory->delete();

        $this->dialog()->success(
            $title = 'Success',
            $description = 'Menu has been deleted'
        );
    }
}
