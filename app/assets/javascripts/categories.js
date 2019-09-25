$(document).on("turbolinks:load", function(){
    var bigCategoryboxHtml = `
      <div class="select-wrap big_category_wrapper">
        <select class="default-select sell-select-box sell_bigcategory_box" name="product[bigcategory_id]" id="bigcategory_id">
          <option value="">---</option>
        <i class="select-arrow fas fa-chevron-down"></i>
      </div>
    `

    var smallCategoryboxHtml = `
    <div class="select-wrap small_category_wrapper">
      <select class="default-select sell-select-box sell_smallcategory_box " name="product[smallcategory_id]" id="smallcategory_id">
        <option value="">---</option>
      <i class="select-arrow fas fa-chevron-down"></i>
    </div>
    `

    var sizeBoxHtml = `
    <div class="size_wrapper">
      <p class="margin-2rem">
        <label class="signup-label" for="category_index_サイズ">サイズ</label>
        <span class="signup-form-container__span span-need">必須</span>
      </p>
        <div class="select-wrap size_wrapper">
        <select class="default-select sell-select-box size_box " name="product[size_id]" id="size_id">
          <option value="">---</option>
        <i class="select-arrow fas fa-chevron-down"></i>
        </div>
    </div>
    `

  function buildcategoryOptions(category){
    var optionHtml =`
    <option value="${category.id}">${category.name}</option>
  `
  return optionHtml;
  };


  // 商品出品時のカテゴリー登録
  $('.select_category_index').on('change', function(){
    var category_index_id = $('#product_category_index_id').val();
    $('.small_category_wrapper').remove();
    $('.size_wrapper').remove();
    // bigcategoryの箱を追加
    if(!($('.big_category_wrapper').length)){
      var bigBoxHtml = bigCategoryboxHtml;
      $('.category_wrapper').append(bigBoxHtml);
    };
    if(category_index_id == "") {
      $('.big_category_wrapper').remove();
    };
    $.ajax({
      url:       'products/bigcategory',
      type:      "GET",
      dataTytpe: "json",
      data:      {category_id: category_index_id}
    })
    // bigcategoryの追加
    .done(function(bigcategory_options){
      var insertHtml = "";
      $('#bigcategory_id').children('option').remove();
      var defaultOption = `
      <option value="">---</option>
      `
      $('#bigcategory_id').append(defaultOption);
      $.each(bigcategory_options, function(i, bigcategory_option){
        insertHtml = buildcategoryOptions(bigcategory_option);
        optionHtml = insertHtml;
        $('#bigcategory_id').append(optionHtml);
      });

      // smallcategoryの箱を追加
      $('.sell_bigcategory_box').on('change',function(){
        var bigCategoryId = $('#bigcategory_id').val();
        if(!($('.small_category_wrapper').length)){
          var smallBoxHtml = smallCategoryboxHtml;
          $('.category_wrapper').append(smallBoxHtml);
        };
        if( bigCategoryId == "") {
          $('.small_category_wrapper').remove();
          $('.size_wrapper').remove();
        };
        $.ajax({
          url:      'products/smallcategory',
          type:     'GET',
          dataType: 'json',
          data:     {bigcategory_id: bigCategoryId}
        })
        // smallcategoryの追加
        .done(function(smallcategory_options){
          var insertSmallCategoryHtml = "";
          $('#smallcategory_id').children('option').remove();
          $('#smallcategory_id').append(defaultOption);
          $.each(smallcategory_options, function(i, smallcategory_option){
            insertSmallCategoryHtml = buildcategoryOptions(smallcategory_option);
            smallOptionHtml = insertSmallCategoryHtml;
            $('#smallcategory_id').append(smallOptionHtml);
          });

          // sizeの箱を追加
          $('.sell_smallcategory_box').on('change',function(){
            var smallCategoryId = $('#smallcategory_id').val();
            if(!($('.size_wrapper').length)){
              var sizeHtml = sizeBoxHtml;
              $('.category_wrapper').append(sizeHtml);
            };
            if (smallCategoryId == ''){
              $('.size_wrapper').remove();
            };
            console.log(smallCategoryId)
            $.ajax({
              url:      'products/size',
              type:     'GET',
              dataType: 'json',
              data:     {smallcategory_id: smallCategoryId}
            })
            // sizeの追加
            .done(function(size_options){
              var insertSizeHtml = "";
              $('#size_id').children('option').remove();
              $('#size_id').append(defaultOption);
              $.each(size_options, function(i, size_option){
                insertSizeHtml = buildcategoryOptions(size_option);
                sizeOptionHtml = insertSizeHtml;
                $('#size_id').append(sizeOptionHtml);
              });
              if($('#size_id').children('option').length == 1) {
                $('.size_wrapper').remove();
              }
            });
          });

        });

      });
    });
  });

})