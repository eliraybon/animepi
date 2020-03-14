// $(document).ready(() => {
//   $("#req-button").click(() => {
//     const value = $("#req-input").val();
//     const url = "/api/" + value;
//     $.ajax({ url }).complete(data => {
//       console.log(data);
//       const content = $.parseJSON(data['responseText']);
//       $("#api-output").text(JSON.stringify(content, null, '\t'));
//     })
//   })
// })

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