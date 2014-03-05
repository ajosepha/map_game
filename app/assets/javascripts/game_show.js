$(document).ready(function(){

  var $this = $(this);

  $(".elements").addClass("hidden");

  $(".card").on("click", function(event){
    $(this).find(".elements").toggleClass("hidden");
  })

  $(".status:contains('Congrats!')").css("background-color", "#57FF97")
});

$(".things").addClass("hidden");
  $(".card").on("click", function(event){
    $(this).find(".things").toggleClass("hidden");
  });