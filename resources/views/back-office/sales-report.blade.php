@section('breadcrumbs')
  Sales Report
@endsection
<x-back-office-layout>
  <livewire:back-office.sales-report />

    <script>
    function printOut(data) {
      var mywindow = window.open('', '', 'height=1000,width=1000');
      mywindow.document.write('<html><head>');
      mywindow.document.write('<title></title>');
      mywindow.document.write(`<link rel="stylesheet" href="{{ Vite::asset('resources/css/app.css') }}" />`);
      mywindow.document.write('</head><body >');
      mywindow.document.write(data);
      mywindow.document.write('</body></html>');

      mywindow.document.close();
      mywindow.focus();
      setTimeout(() => {
        mywindow.print();
        return true;
      }, 1000)


    }
  </script>
</x-back-office-layout>
