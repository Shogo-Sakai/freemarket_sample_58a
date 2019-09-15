$(document).on('turbolinks:load',function(){
  function addHtml(value){
    var html = `<option value=${value}>
                ${value}
                </option>`
    return html
}
  var blankHtml = `<option>--</option>`
  function addOption(value){
    $("#profile_birthday").children().remove();
    $("#profile_birthday").append(blankHtml)
    for(var i = 1;i < value + 1;i ++){
      $("#profile_birthday").append(addHtml(i))
    }
  }
  var changeDateSelect = function(){
    var year = $("#profile_birthyear").val();
    var month = $("#profile_birthmonth").val();
    var yearFourHundred = year % 400;
    var yearHundred = year % 100;
    var yearFour = year % 4;
    console.log(yearFour);
    if(yearHundred == 0 && yearFourHundred != 0 && month == 2){
      addOption(28)
    }else if(yearHundred == 0 && yearFourHundred == 0 && month == 2){
      addOption(29)
    }else if(yearFour == 0 && month == 2){
      addOption(29)
    }else if(year.length == 0 || month.length == 0){
      return false;
    }else if(month == 2){
      addOption(28)
    }else if(month == 4 || month == 6 || month == 9 || month == 11){
      addOption(30)
    }else{
      addOption(31)
    }
  }
  $("#profile_birthmonth").on("change",changeDateSelect);
  $("#profile_birthyear").on("change",changeDateSelect);
})