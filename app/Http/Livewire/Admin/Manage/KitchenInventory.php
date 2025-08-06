<?php

namespace App\Http\Livewire\Admin\Manage;

use Livewire\Component;
use WireUi\Traits\Actions;
use App\Models\FrontdeskMenu;
use App\Models\FrontdeskCategory;
use App\Models\FrontdeskInventory;
use Illuminate\Support\Facades\DB;

class KitchenInventory extends Component
{
    public $categories;
    public $selectedCategoryId = null;
    public $selectedCategory;
    public $menu;
    public $menu_item;
    public $menu_name;
    public $menu_price;
    public $menu_quantity;

    public $add_modal = false;
    public $edit_modal = false;
    public $name;
    public $price;

    public $selectedMenu;

    use Actions;

    public function mount()
    {
        $this->categories = FrontdeskCategory::all();
        $this->selectedCategoryId = $this->categories->first()->id ?? null;
        $this->selectedCategory = $this->categories->first() ?? null;
    }

    public function selectCategory($categoryId)
    {
        $this->selectedCategoryId = $categoryId;
        $this->menu = FrontdeskMenu::where('frontdesk_category_id', $this->selectedCategoryId)
            ->get();
        $this->selectedCategory = FrontdeskCategory::find($categoryId);
    }

     public function addMenu()
    {
        $this->add_modal = true;


        // $this->menu_item = FrontdeskMenu::where('id', $id)->first();
        // $this->menu_name = $this->menu_item->name;
        // $this->menu_price = '₱ '.number_format($this->menu_item->price, 2);
    }

     public function saveMenu()
    {
        $this->validate([
            'name' => 'required',
            'price' => 'required|numeric',
        ], [
            'category_id.required' => 'Please select a category'
        ]);

        DB::beginTransaction();
        $menu = FrontdeskMenu::create([
            'branch_id' => auth()->user()->branch_id,
            'name' => $this->name,
            'price' => $this->price,
            'frontdesk_category_id' => $this->selectedCategory->id,
        ]);

        // Inventory::create([
        //     'branch_id' => auth()->user()->branch_id,
        //     'menu_id' => $menu->id,
        //     'number_of_serving' => $this->stock,
        // ]);
        DB::commit();

        $this->add_modal = false;
        $this->reset(
            'name',
            'price',
        );

        $this->dialog()->success(
            $title = 'Success',
            $description = 'Menu has been added'
        );
    }

      public function saveStock()
    {
        $this->validate([
            'menu_quantity' => 'required|numeric|min:1'
        ]);

        if($this->menu_item->inventory === null)
        {
            FrontdeskInventory::create([
                'branch_id' =>  auth()->user()->branch_id,
                'frontdesk_menu_id' => $this->menu_item->id,
                'number_of_serving' => $this->menu_quantity
            ]);
        }else{
            $this->menu_item->inventory->update([
                'number_of_serving' => $this->menu_item->inventory->number_of_serving + $this->menu_quantity,
            ]);
        }



        $this->add_modal = false;
        $this->menu_quantity = '';

        $this->dialog()->success(
            $title = 'Success',
            $description = 'Stock added successfully',
        );
    }

    public function editMenu($id)
    {
        $this->edit_modal = true;
        $this->selectedMenu = FrontdeskMenu::find($id);
        $this->name = $this->selectedMenu->name;
        $this->price = $this->selectedMenu->price;
    }

    public function updateMenu(){
        $this->validate([
            'name' => 'required',
            'price' => 'required|numeric',
        ]);

        $this->selectedMenu->name = $this->name;
        $this->selectedMenu->price = $this->price;
        $this->selectedMenu->save();

        $this->edit_modal = false;
        $this->reset('name', 'price');

        $this->dialog()->success(
            $title = 'Success',
            $description = 'Menu has been updated'
        );
    }

    public function render()
    {

        return view('livewire.admin.manage.kitchen-inventory', [
            'menus' => $this->selectedCategoryId ? FrontdeskMenu::where('frontdesk_category_id', $this->selectedCategoryId)->get() : [],
        ]);
    }
}
