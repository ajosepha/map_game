

$(document).ready(function(){

  var $this = $(this);
  $(".question").hide();

$(".col4").on("click", function(event){$(this).find(".question")
  .fadeIn()});

})