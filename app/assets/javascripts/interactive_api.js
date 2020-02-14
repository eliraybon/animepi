$(document).ready(function() {
  $("#req-button").click(function() {
    const value = $("#req-input").val();
    const url = "/api/" + value;
    $.ajax({
      dataType: 'json',
      url: url
    }).complete(data => {
      const content = $.parseJSON(data['responseText']);
      $("#api-output").text(JSON.stringify(content, null, '\t'));
    })
  })
})