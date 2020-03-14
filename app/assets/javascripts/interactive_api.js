$(document).ready(function () {
  $("#req-button").click(function () {
    var value = $("#req-input").val();
    var url = "/api/" + value;
    $.ajax({ url: url }).complete(function(data) {
      var content = $.parseJSON(data['responseText']);
      $("#api-output").text(JSON.stringify(content, null, '\t'));
    })
  })
})