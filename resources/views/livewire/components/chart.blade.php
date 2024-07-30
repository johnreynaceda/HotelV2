<div>
    {{-- <div class="mt-10 flex justify-start mr-6">
        <div>
            <div class="flex space-x-3">
                <x-datetime-picker label="Date From" without-time placeholder="Date From" wire:model.defer="date_from"/>
                <x-datetime-picker label="Date To" without-time placeholder="Date To" wire:model.defer="date_to"/>
                <div class="mt-6">
                    <x-button positive label="Generate" wire:click="generateChartData"/>
                </div>
            </div>

        </div>
    </div> --}}
    <div class="flex space-x-16 mt-10" >
        <canvas class="bg-white p-4 rounded-lg" style="width: 100%; height: 300px" id="myChart"></canvas>
            <canvas class="bg-white px-4 py-6 rounded-lg" style="width: 100%; height: 350px" id="myChart2"></canvas>
      </div>

    <script>
        const ctx = document.getElementById('myChart');
        const ctx2 = document.getElementById('myChart2');

        new Chart(ctx, {
          type: 'bar',
          data: {
            labels: ['Check In Today', 'Check Out Today', 'Expected Check Out Today'],
            datasets: [{
              label: 'Total',
              data: [{{$check_in_today}}, {{$check_out_today}}, {{$expected_check_out}}],
              borderWidth: 1,
              backgroundColor: ['#fc0303', '#3b82f6', '#03fc4a']
            }]
          },
          options: {
            scales: {
              y: {
                beginAtZero: true
              }
            }
          }
        });

        new Chart(ctx2, {
          type: 'bar',
          data: {
            labels: ['Total Check In', 'Total Check Out'],
            datasets: [{
              label: 'Total',
              data: [{{$total_check_in}}, {{$total_check_out}}],
              borderWidth: 1,
              backgroundColor: ['#3b82f6', '#fcd303']
            }]
          },
          options: {
            scales: {
              y: {
                beginAtZero: true
              }
            }
          }
        });
      </script>
</div>
