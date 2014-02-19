$(document).ready(function(){

  var $this = $(this);

  $(".elements").hide();

  $(".card").on("click", function(event){
    $(this).find(".elements").show();
  })

  $(".status:contains('Congrats!')").css("background-color", "#57FF97")
});