$(document).on('turbolinks:load', function(){
  $('.announcement__pictures').slick({
    autoplay:true,
    dots:true,
    arrows:true,
    autoplaySpeed:5000,
    
    // appendDots:$(".announcement__pictures")
  });
})
