$(document).ready(function(){

  var $this = $(this);

  $(".elements").hide();

  $(".card").on("click", function(event){
    $(this).find(".status").css("color", "red")
    $(this).find(".elements").show();
  })


});