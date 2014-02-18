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
});
