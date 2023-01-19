<div>
  <div class="mt-5">
    <div>
      <h1 class="font-bold text-xl text-gray-600">ALMA RESIDENCES GENSAN</h1>
      <h1 class="text-sm text-gray-400"> Settings and cofingurations for this branch.</h1>

      <div class="mt-6">
        <div class="px-4 sm:px-6 lg:px-8">

          <div class="mt-8 flex flex-col">
            <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
              <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
                <table class="min-w-full divide-y divide-gray-300">
                  <thead>
                    <tr>
                      <th scope="col"
                        class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6 md:pl-0"></th>
                      <th scope="col" class="py-3.5 px-3 text-left text-sm font-semibold text-gray-900"></th>

                      <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6 md:pr-0">
                        <span class="sr-only">Edit</span>
                      </th>
                    </tr>
                  </thead>
                  <tbody class="divide-y divide-gray-200">
                    <tr>
                      <td
                        class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-600 uppercase sm:pl-6 md:pl-0">
                        Admin Authorization Code</td>
                      <td class="whitespace-nowrap py-4 px-3 text-lg text-green-500">***** </td>

                      <td
                        class="relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6 md:pr-0">
                        <x-button xs positive icon="pencil-alt" wire:click="editCode" spinner="editCode"
                          label="UPDATE" />
                      </td>
                    </tr>
                    <tr>
                      <td
                        class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-600 uppercase sm:pl-6 md:pl-0">
                        Extension Time Reset</td>
                      <td class="whitespace-nowrap py-4 px-3 text-sm text-gray-500">
                        {{ auth()->user()->branch->extension_time_reset }} Hours
                      <td
                        class="relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6 md:pr-0">
                        <x-button xs positive icon="pencil-alt" label="UPDATE" />
                      </td>
                    </tr>

                    <!-- More people... -->
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>

  <x-modal wire:model.defer="settings_modal">
    <x-card title="Manage Settings">
      <p class="text-gray-600">
      <div>
        <h1 class="font-bold text-gray-600">ALMA RESIDENCES GENSAN</h1>
        <h1 class="text-sm text-gray-400"> Settings and cofingurations for this branch.</h1>

        <div class="mt-6">
          sdsd
        </div>
      </div>

      <x-slot name="footer">
        <div class="flex justify-end gap-x-4">
          <x-button flat label="Cancel" x-on:click="close" />
          <x-button primary label="I Agree" />
        </div>
      </x-slot>
    </x-card>
  </x-modal>
</div>
