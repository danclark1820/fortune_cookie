$(document).ready(function(){

	skrollr.init({
		smoothScrolling: false,
		mobileDeceleration: 0.004
	});

  $('#fortune').hide();
  $('#fortune-note').hide();

  $('#fortune-cookie').click(function(){
    $('#fortune').show();
  });

  $('#fortune-cookie').click(function(){
    $('#fortune-note').show();
  });

  $('#fortune-cookie').click(function(){
    $('#fortune-cookie').hide();
  });

  function getTimezoneName(){
    timezone = jstz.determine()
    return timezone.name();
  };

  var tz = getTimezoneName();
  var $hiddenTZ = $('<input/>',{value: tz, type: 'hidden', name:'note[timezone]', id:'note-timezone'});
  $hiddenTZ.appendTo('#tz-input')
});
