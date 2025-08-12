<div>
    @if (!$getState() || $getState()->isEmpty()) {
          'Not Assigned';
        }
    @endif
    <ul>
        @foreach ($getState() as $floor)
            <li>
                <span style="margin-right: 6px;">&#8226;</span>
                {{ $floor->numberWithFormat() }}
            </li>
        @endforeach
    </ul>
</div>
