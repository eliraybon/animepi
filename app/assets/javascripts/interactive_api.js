$(document).ready(() => {
  $("#req-button").click(() => {
    const value = $("#req-input").val();
    const url = "/api/" + value;
    $.ajax({ url }).complete(data => {
      console.log(data);
      const content = $.parseJSON(data['responseText']);
      $("#api-output").text(JSON.stringify(content, null, '\t'));
    })
  })
})