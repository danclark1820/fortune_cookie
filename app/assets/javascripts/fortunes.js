// $(document).ready(function(){
//   $('.fortune').hide()
// });

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
});
