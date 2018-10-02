$(document).on("turbolinks:load", function(){

  $('.alert').hide().delay(500).slideDown(400)

  $(".alert").delay(4000).slideUp(200, function() {
      $(this).alert('close');
  });
});
