$(document).on('turbolinks:load', function(){
  function addImageHtml(image){
    var html = `<li class="product-image">
                  <img src=${image}>
                  <div class="product-image__option">
                    <div class="product-image__edit" >
                      編集
                    </div>
                    <div>
                      <a class="product-image__delete">削除</a>
                    </div>
                  </div>
                </li>`
    return html;
  };
  var files_array = [];
  $('#preview').on('dragover',function(e){
    e.preventDefault();
  });
  $('#preview').on('drop',function(event){
    event.preventDefault();
    files = event.originalEvent.dataTransfer.files;
    for (var i=0; i<files.length; i++) {
      files_array.push(files[i]);
      var fileReader = new FileReader();
      fileReader.onload = function( event ) {
      var image = event.target.result;
      $(addImageHtml(image)).appendTo("#preview").trigger("create");
      };
      fileReader.readAsDataURL(files[i]);
    }
  });
  $(document).on('click','.product-image__delete', function(){
    var index = $(".product-image__delete").index(this);
    files_array.splice(index - 1, 1);
    $(this).parent().parent().parent().remove();
  });
  $(".sell-form").on('submit',function(e){
    e.preventDefault();
    var formData = new FormData(this);
    files_array.forEach(function(file){
      formData.append("product_image[image][]" , file)
    });
    $.ajax({
      url: '/products',
      type: 'POST',
      data: formData,
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
      },
      contentType: false,
      processData: false,
      async: false
    })
  })
});