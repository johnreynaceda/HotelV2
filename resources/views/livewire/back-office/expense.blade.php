<div>
  <div class="flex justify-end space-x-2 px-4">
    <x-button label="Expenses Category" icon="collection" gray wire:click=" $set('manage_modal', true)" />
    <x-button label="Add New" icon="plus" wire:click="$set('add_modal',true)" positive />
  </div>
  <div class="table w-full px-4">
    <div class=" bg-white p-4 rounded-xl mt-4">
      <div class="sm:flex sm:items-center">
        <div class="sm:flex-auto">
          <p class="mt-2 text-2xl font-bold text-gray-600">&#8369;{{ number_format($total, 2) }}</p>
          <h1 class="text-sm  text-gray-500">Total Expenses</h1>
        </div>

      </div>
      <div class="-mx-4 mt-8 flex flex-col sm:-mx-6 md:mx-0">
        <table class="min-w-full divide-y divide-gray-300">
          <thead>
            <tr>
              <th scope="col"
                class="py-3.5 w-40 pl-4 pr-3 text-left text-sm font-semibold text-gray-600 sm:pl-6 md:pl-0"></th>
              <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-600 sm:pl-6 md:pl-0">
                EMPLOYEE NAME</th>
              <th scope="col"
                class="hidden py-3.5 px-3 text-right text-sm font-semibold text-gray-600 sm:table-cell">DESCRIPTION</th>
              <th scope="col"
                class="hidden py-3.5 px-3 text-right text-sm font-semibold text-gray-600 sm:table-cell">AMOUNT</th>
            </tr>
          </thead>
          <tbody>
            @forelse ($categories as $category)
              <tr>
                <th colspan="4" class="bg-gray-200 text-left font-semibold uppercase text-gray-700 p-2">
                  {{ $category->name }}</th>
              </tr>
              @forelse ($category->expenses as $expense)
                <tr class="border-b border-gray-200">
                  <td class="hidden py-3 px-3 text-right text-sm text-gray-500 sm:table-cell"></td>
                  <td class="py-3 pl-4 pr-3 text-sm sm:pl-6 md:pl-0">
                    <div class="font-medium text-gray-500 uppercase">{{ $expense->name }}</div>
                  </td>
                  <td class="hidden py-3 px-3 text-right text-sm text-gray-500 sm:table-cell">
                    {{ $expense->description ?? null }}</td>
                  <td class="hidden py-3 px-3 text-right text-sm text-gray-500 sm:table-cell">
                    &#8369; {{ number_format($expense->amount, 2) }}</td>
                </tr>
              @empty
              @endforelse

            @empty
            @endforelse
            <!-- More projects... -->
          </tbody>

        </table>
      </div>
    </div>

  </div>

  <x-modal blur wire:model.defer="manage_modal" align="center">
    <x-card>
      <div class="header flex space-x-2 items-center">
        <svg class="w-6 h-6 text-gray-600" width="24" height="24" stroke-width="1.5" viewBox="0 0 24 24"
          fill="none" xmlns="http://www.w3.org/2000/svg">
          <path
            d="M4.62323 5.24841C2.99408 7.02743 2 9.39765 2 12C2 17.5229 6.47715 22 12 22C14.5361 22 16.8517 21.0559 18.6146 19.5"
            stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
          <path
            d="M21.3021 15.6775C21.7525 14.5392 22 13.2985 22 12C22 6.47715 17.5228 2 12 2C10.7687 2 9.58934 2.22255 8.5 2.62961"
            stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
          <path d="M9 15C9.64448 15.8593 10.8428 16.3494 12 16.391C13.1141 16.431 14.1901 16.0554 14.6973 15.1933"
            stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
          <path d="M12 16.391V18.5" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
          <path d="M9.5 9.5C9.5 10.6811 10.3525 11.1647 11.3862 11.5" stroke="currentColor" stroke-linecap="round"
            stroke-linejoin="round"></path>
          <path d="M15 8.5C14.315 7.81501 13.1087 7.33855 12 7.30872V5.5" stroke="currentColor" stroke-linecap="round"
            stroke-linejoin="round"></path>
          <path d="M3 3L21 21" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
        </svg>
        <h1 class="text-lg font-semibold uppercase text-gray-600 ">Expenses Category</h1>
      </div>
      <div class="mt-5 px-4">
        <x-input label="Category Name" wire:model.defer="category_name" placeholder="" />
      </div>

      <div class="mt-10 px-4">
        <ul role="list" class="divide-y x-animate space-y-1 divide-gray-200">
          @forelse ($categories as $category)
            <li class="py-2 px-3 rounded-lg shadow-md flex bg-gray-100 justify-between">
              <h1 class="font-medium uppercase">{{ $category->name }}</h1>
              <x-button label="Edit" positive xs wire:click="editCategory({{ $category->id }})"
                spinner="editCategory({{ $category->id }})" icon="pencil-alt" />
            </li>
          @empty
            <div class="flex space-x-1 item-end">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 text-gray-500 w-5" fill="none" viewBox="0 0 24 24"
                stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round"
                  d="M3 10h18M3 14h18m-9-4v8m-7 0h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v8a2 2 0 002 2z" />
              </svg>
              <h1 class="text-sm text-gray-500">No Data Available...</h1>
            </div>
          @endforelse
        </ul>
      </div>

      <x-slot name="footer">
        <div class="flex justify-end gap-x-4">
          <x-button flat label="Cancel" x-on:click="close" />
          <x-button positive right-icon="save-as" wire:click="saveCategory" spinner="saveCategory"
            label="Save Category" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>

  <x-modal blur wire:model.defer="edit_expense_modal" align="center" max-width="lg">
    <x-card>
      <div class="header flex space-x-2 items-center">
        <svg class="w-6 h-6 text-gray-600" width="24" height="24" stroke-width="1.5" viewBox="0 0 24 24"
          fill="none" xmlns="http://www.w3.org/2000/svg">
          <path
            d="M4.62323 5.24841C2.99408 7.02743 2 9.39765 2 12C2 17.5229 6.47715 22 12 22C14.5361 22 16.8517 21.0559 18.6146 19.5"
            stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
          <path
            d="M21.3021 15.6775C21.7525 14.5392 22 13.2985 22 12C22 6.47715 17.5228 2 12 2C10.7687 2 9.58934 2.22255 8.5 2.62961"
            stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
          <path d="M9 15C9.64448 15.8593 10.8428 16.3494 12 16.391C13.1141 16.431 14.1901 16.0554 14.6973 15.1933"
            stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
          <path d="M12 16.391V18.5" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
          <path d="M9.5 9.5C9.5 10.6811 10.3525 11.1647 11.3862 11.5" stroke="currentColor" stroke-linecap="round"
            stroke-linejoin="round"></path>
          <path d="M15 8.5C14.315 7.81501 13.1087 7.33855 12 7.30872V5.5" stroke="currentColor"
            stroke-linecap="round" stroke-linejoin="round"></path>
          <path d="M3 3L21 21" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
        </svg>
        <h1 class="text-lg font-semibold uppercase text-gray-600 ">Update Expenses Category</h1>
      </div>
      <div class="mt-5 px-4">
        <x-input label="Category Name" wire:model.defer="category_name" placeholder="" />
      </div>
      <x-slot name="footer">
        <div class="flex justify-end gap-x-4">
          <x-button flat label="Cancel" x-on:click="close" />
          <x-button negative label="Delete" right-icon="trash" spinner="deleteCategory"
            x-on:confirm="{
        title: 'Sure Delete?',
        icon: 'question',
        description: 'Are you sure you want to delete this category?',
        method: 'deleteCategory',
        params: {{ $category->id }}
    }" />
          <x-button positive right-icon="save-as" wire:click="updateCategory" spinner="updateCategory"
            label="Update Category" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>

  <x-modal blur wire:model.defer="add_modal" align="center">
    <x-card>
      <div class="header flex space-x-2 items-center">
        <svg class="w-6 h-6 text-gray-600" width="24" height="24" stroke-width="1.5" viewBox="0 0 24 24"
          fill="none" xmlns="http://www.w3.org/2000/svg">
          <path
            d="M4.62323 5.24841C2.99408 7.02743 2 9.39765 2 12C2 17.5229 6.47715 22 12 22C14.5361 22 16.8517 21.0559 18.6146 19.5"
            stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
          <path
            d="M21.3021 15.6775C21.7525 14.5392 22 13.2985 22 12C22 6.47715 17.5228 2 12 2C10.7687 2 9.58934 2.22255 8.5 2.62961"
            stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
          <path d="M9 15C9.64448 15.8593 10.8428 16.3494 12 16.391C13.1141 16.431 14.1901 16.0554 14.6973 15.1933"
            stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
          <path d="M12 16.391V18.5" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
          <path d="M9.5 9.5C9.5 10.6811 10.3525 11.1647 11.3862 11.5" stroke="currentColor" stroke-linecap="round"
            stroke-linejoin="round"></path>
          <path d="M15 8.5C14.315 7.81501 13.1087 7.33855 12 7.30872V5.5" stroke="currentColor"
            stroke-linecap="round" stroke-linejoin="round"></path>
          <path d="M3 3L21 21" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
        </svg>
        <h1 class="text-lg font-semibold uppercase text-gray-600 ">Add New Expenses</h1>
      </div>
      <div class="mt-5 px-4 grid grid-cols-2 gap-4">
        <x-input label="Employee Name" wire:model.defer="employee_name" />
        <x-native-select label="Category" wire:model="expense_category_id">
          <option selected hidden>Select Category</option>
          @foreach ($categories as $category)
            <option value="{{ $category->id }}">{{ $category->name }}</optionc>
          @endforeach
        </x-native-select>
        <div>
          <x-textarea label="Description" wire:model.defer="description" />
        </div>
        <x-input label="Amount" wire:model.defer="expense_amount" />
      </div>
      <x-slot name="footer">
        <div class="flex justify-end gap-x-4">
          <x-button flat label="Cancel" x-on:click="close" />

          <x-button positive right-icon="save-as" wire:click="saveExpense" spinner="saveExpense"
            label="Save Expense" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>
</div>
