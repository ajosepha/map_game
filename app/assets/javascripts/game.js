$(document).ready(function(){
  var $this = $(this);

  $(".borough").hide();

  $(".hood").on("click", function(event){
    alert("test");
    $(this).children().show("slow", function(){

    });
    //$(".Borough").show("slow", function(){

    //});
  });
});

