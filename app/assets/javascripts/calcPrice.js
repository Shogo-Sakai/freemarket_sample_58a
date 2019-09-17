$(function(){
  var inputPrice = $('#product_price').val()
  $('.sell-container-right__price-fee__price').textContent = inputPrice * 0.1
})