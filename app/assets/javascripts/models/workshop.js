$(document).ready(function(){
	$('#start_date_field').datetimepicker({
    language: 'en',
    pick12HourFormat: true,
    pickSeconds: false,
    autoclose: true
  });

  $('#end_date_field').datetimepicker({
    language: 'en',
    pick12HourFormat: true,
    pickSeconds: false,
    autoclose: true
  });

  $('#deadline_field').datetimepicker({
    language: 'en',
    pick12HourFormat: true,
    pickSeconds: false,
    autoclose: true
  });

  $('.datatable').dataTable({
    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    "sPaginationType": "bootstrap",
    "bPaginate": true,
    "bLength": true
  });
});
