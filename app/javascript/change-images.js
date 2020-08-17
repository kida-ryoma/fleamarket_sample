$(function (){
  $(".smallImage").first().addClass("active");
  $(".smallImage").click(function(){
    image_url = $(this).attr("src");
    $(".bigImage").attr("src", image_url).hide().fadeIn();
    $(".smallImage.active").removeClass(".active");
    $(this).addClass("active");
  });
});