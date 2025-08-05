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
    <div class="mt-2 w-full p-4 border border-gray-200 rounded-md shadow-lg" >
        <div class="flex justify-between items-center mb-4">
            <h2 class="text-lg font-semibold text-[#009ff4] uppercase">Guest Statistics</h2>
            <div>
                <select id="chartFilter" wire:model="chartFilter" class="w-36 border border-[#009ff4] rounded-md px-3 py-2 text-sm focus:ring-2 focus:ring-[#009ff4] focus:border-[#009ff4] text-[#009ff4] bg-white font-semibold shadow-sm transition">
                    <option value="year">This Year</option>
                    <option value="month">This Month</option>
                    <option value="week">This Week</option>
                </select>
            </div>
        </div>
        <div id="chartContainer" class="relative h-[300px] w-full">
            <canvas id="guestChart"></canvas>
        </div>
            {{-- <canvas class="bg-white p-4 rounded-lg" style="width: 100%; height: 300px" id="guestChart"></canvas> --}}
        {{-- <canvas class="bg-white p-4 rounded-lg" style="width: 100%; height: 300px" id="myChart"></canvas> --}}
            {{-- <canvas class="bg-white px-4 py-6 rounded-lg" style="width: 100%; height: 350px" id="myChart2"></canvas> --}}
      </div>

    <!-- Load Chart.js from CDN -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
    document.addEventListener('livewire:load', function () {
        let guestChart;

        function renderChart(labels, data) {
            // Remove the old canvas
            const oldCanvas = document.getElementById('guestChart');
            const parent = oldCanvas.parentNode;
            oldCanvas.remove();

            // Create new canvas
            const newCanvas = document.createElement('canvas');
            newCanvas.id = 'guestChart';
            parent.appendChild(newCanvas);

            const ctx = newCanvas.getContext('2d');

            // Re-initialize chart
            guestChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Total Guests',
                        data: data,
                        backgroundColor: '#009ff4',
                        borderRadius: 10
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    },
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top',
                            align: 'end',
                            labels: {
                                color: '#009ff4',
                                font: {
                                    size: 14,
                                    weight: 'bold'
                                }
                            }
                        }
                    }
                }
            });
        }

        // Livewire event listener
        Livewire.on('chartUpdated', (labels, data) => {
            renderChart(labels, data);
        });

        // Initial render
        renderChart(
            @json(array_keys($guests_by_month)),
            @json(array_values($guests_by_month))
        );
    });
</script>

    <script>
        // const ctx = document.getElementById('guestChart').getContext('2d');
        // const guestChart = new Chart(ctx, {
        //     type: 'bar',
        //     data: {
        //     labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        //     datasets: [{
        //         label: 'Total Guests',
        //         data: [
        //             @foreach ($guests_by_month as $month => $total)
        //                 {{ $total }},
        //             @endforeach
        //         ],
        //         borderWidth: 1,
        //         backgroundColor: '#009ff4',
        //         borderRadius: 10
        //     }]
        //     },
        //     options: {
        //     scales: {
        //         y: {
        //         beginAtZero: true
        //         }
        //     },
        //     plugins: {
        //         legend: {
        //         display: true,
        //         position: 'top',
        //         align: 'end',
        //         labels: {
        //             color: '#009ff4',
        //             font: {
        //             size: 14,
        //             weight: 'bold'
        //             }
        //         }
        //         },
        //     }
        //     }
        // });

        // const ctx = document.getElementById('myChart');
        // const ctx2 = document.getElementById('myChart2');

        // new Chart(ctx, {
        //   type: 'bar',
        //   data: {
        //     labels: ['Check In Today', 'Check Out Today', 'Expected Check Out Today'],
        //     datasets: [{
        //       label: 'Total',
        //       data: [{{$check_in_today}}, {{$check_out_today}}, {{$expected_check_out}}],
        //       borderWidth: 1,
        //       backgroundColor: ['#fc0303', '#3b82f6', '#03fc4a']
        //     }]
        //   },
        //   options: {
        //     scales: {
        //       y: {
        //         beginAtZero: true
        //       }
        //     }
        //   }
        // });

        // new Chart(ctx2, {
        //   type: 'bar',
        //   data: {
        //     labels: ['Total Check In', 'Total Check Out'],
        //     datasets: [{
        //       label: 'Total',
        //       data: [{{$total_check_in}}, {{$total_check_out}}],
        //       borderWidth: 1,
        //       backgroundColor: ['#3b82f6', '#fcd303']
        //     }]
        //   },
        //   options: {
        //     scales: {
        //       y: {
        //         beginAtZero: true
        //       }
        //     }
        //   }
        // });
      </script>

</div>
