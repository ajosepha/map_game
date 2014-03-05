$(document).ready(function(){

  var $this = $(this);

  $(".elements").addClass("hidden");

  $(".card").on("click", function(event){
    $(this).find(".elements").toggleClass("hidden");
  })

  

$(".things").addClass("hidden");
  $(".card").on("click", function(event){
    $(this).find(".things").toggleClass("hidden");
  });


});

$(".status:contains('Congrats!')").css("background-color", "#60ad45")
// $(".status:contains('Congrats!')").css("color", "pink")