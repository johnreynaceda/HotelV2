<?php

namespace App\Http\Livewire\Admin\Manage;

use Livewire\Component;
use WireUi\Traits\Actions;
use App\Models\FrontdeskMenu;
use App\Models\FrontdeskCategory;
use App\Models\FrontdeskInventory;
use Illuminate\Support\Facades\DB;
use Livewire\WithFileUploads;

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
    public $image;
    public $branch_id;

    public $selectedMenu;

    use Actions;
    use WithFileUploads;

    public function mount()
    {
        if(auth()->user()->hasRole('superadmin'))
        {
            $this->categories = FrontdeskCategory::where('branch_id', $this->branch_id)->get();
        }else{
            $this->categories = FrontdeskCategory::where('branch_id', auth()->user()->branch_id)->get();
        }
        $this->selectedCategoryId = $this->categories->first()->id ?? null;
        $this->selectedCategory = $this->categories->first() ?? null;
    }

    public function updatedBranchId($value)
    {
       $this->mount();
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
        $this->reset(['name', 'price', 'image']);
        $this->add_modal = true;
    }

     public function saveMenu()
    {
        $this->validate([
            'name' => 'required',
            'price' => 'required|numeric',
            'image' => 'nullable|image|mimes:jpeg,png|max:25000',
        ], [
            'name.required' => 'Please enter a menu name',
            'price.required' => 'Please enter a price',
            'image.image' => 'The image must be a valid image file',
            'image.mimes' => 'The image must be a file of type: jpeg, png',
            'image.max' => 'The image must not be greater than 25MB',
        ]);

        DB::beginTransaction();
        $menu = FrontdeskMenu::create([
            'branch_id' => auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id,
            'name' => $this->name,
            'price' => $this->price,
            'image' => $this->image ? $this->image->store('menu_images', 'public') : null,
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
            'image',
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
                'branch_id' =>  auth()->user()->hasRole('superadmin') ? $this->branch_id : auth()->user()->branch_id,
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
            'image' => 'nullable|image|mimes:jpeg,png|max:25000',
        ], [
            'name.required' => 'Please enter a menu name',
            'price.required' => 'Please enter a price',
            'image.image' => 'The image must be a valid image file',
            'image.mimes' => 'The image must be a file of type: jpeg, png',
            'image.max' => 'The image must not be greater than 25MB',
        ]);

        $this->selectedMenu->name = $this->name;
        $this->selectedMenu->price = $this->price;

        if ($this->image) {
            $this->selectedMenu->image = $this->image->store('menu_images', 'public');
        }

        $this->selectedMenu->save();

        $this->edit_modal = false;
        $this->reset('name', 'price', 'image');

        $this->dialog()->success(
            $title = 'Success',
            $description = 'Menu has been updated'
        );
    }

    public function render()
    {

        return view('livewire.admin.manage.kitchen-inventory', [
            'menus' => $this->selectedCategoryId ? FrontdeskMenu::where('frontdesk_category_id', $this->selectedCategoryId)->get() : [],
            'branches' => \App\Models\Branch::all(),
        ]);
    }
}
