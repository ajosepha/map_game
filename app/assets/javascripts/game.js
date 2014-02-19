$(document).ready(function(){
  var $this = $(this);

  $(".borough").hide();

  $(".hood").on("click", function(event){
    $(this).children().show("slow", function(){

    });
  
  });
});

