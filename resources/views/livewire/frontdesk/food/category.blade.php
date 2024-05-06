<div>
    <div class="flex justify-between text-3xl text-gray-700 font-semibold">
        <div>
            Manage Category
        </div>
        <div>
            <a href="{{route('frontdesk.food-inventory')}}">
            <x-button icon="arrow-left" slate label="Return" />
            </a>
        </div>
    </div>
    <div class="mt-5">
        {{$this->table}}
    </div>
</div>
