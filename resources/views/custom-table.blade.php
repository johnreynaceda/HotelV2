<div>
  <div class="">

    <div class=" flex flex-col">
      <div class="">
        <div class="inline-block min-w-full align-middle ">
          <div class="overflow-hidden">
            <table class="min-w-full">
              <thead class="bg-white">
                <tr>
                  <th scope="col" class="py-3.5 w-56 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">
                  </th>
                  <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">STAYING HOUR</th>
                  <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">AMOUNT</th>
                  <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">TYPE</th>
                  <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">STATUS</th>
                   <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">APPLY DISCOUNT</th>
                  <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                    <span class="sr-only">Edit</span>
                  </th>
                </tr>
              </thead>
              <tbody class="bg-white">
                @forelse ($records as $record)
                  <tr class="border-t border-gray-200">
                    <th colspan="7" scope="colgroup"
                      class="bg-blue-500 uppercase px-4 py-2 text-left text-sm font-semibold text-white sm:px-6">
                      {{ $record->name }}</th>
                  </tr>
                  @forelse ($record->rates as $rate)
                    <tr class="border-t border-gray-300">
                      <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-6">
                      </td>
                      <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-600">{{ $rate->stayingHour->number }}
                        HOURS
                      </td>
                      <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-600">
                        &#8369;{{ number_format($rate->amount, 2) }}</td>
                      <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-600">{{ $rate->type->name }}</td>
                      <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-600">
                        @switch($rate->is_available)
                          @case(1)
                            <x-button xs icon="users" positive label="Available" />
                          @break

                          @case(2)
                            <x-button xs icon="users" negative label="Unavailable" />
                          @break

                          @default
                        @endswitch
                      </td>
                      {{-- add another column toggle for has_discount --}}
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-left text-gray-600">
                            <input type="checkbox" class="toggle toggle-lg accent-[#1877F3] focus:outline-none"
                                {{ $rate->has_discount ? 'checked' : '' }}
                                wire:change="toggleDiscount({{ $rate->id }})">
                            <label class="sr-only">Apply Discount</label>
                        </td>
                      <td class="relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
                        <x-button icon="pencil-alt" spinner="editRate({{ $rate->id }})"
                          wire:click="editRate({{ $rate->id }})" label="Edit" xs />
                      </td>
                    </tr>
                    @empty
                    @endforelse
                    @empty
                    @endforelse





                    <!-- More people... -->
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
