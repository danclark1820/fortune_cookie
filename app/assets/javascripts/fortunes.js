$(document).ready(function(){
  $('.fortune').hide();
  $('.fortune_note').hide();

  $('.fortune_cookie').click(function(){
    $('.fortune').show();
  });

  $('.fortune_cookie').click(function(){
    $('.fortune_note').show();
  });

  $('.fortune_cookie').click(function(){
    $('.fortune_cookie').hide();
  });

  function getTimezoneName(){
    timezone = jstz.determine()
    return timezone.name();
  };

  var tz = getTimezoneName();
  var $hiddenTZ = $('<input/>',{value: tz, type: 'hidden', name:'note[timezone]', id:'note_timezone'});
  window.alert(tz)
  $hiddenTZ.appendTo('#tz_input')
});
