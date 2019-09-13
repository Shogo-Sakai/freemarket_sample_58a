$(window).bind("load", function(){
  $("a").each(function(){
    var activeLink = $(this).attr("href")
    console.log(activeLink)
    if(document.URL.match(activeLink)){
      $(this).addClass('active')
      // return false;
    };
  });
})
