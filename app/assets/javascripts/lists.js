// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/





// $(function() {
//     if($("#drop").val() === "Random") //I'm supposing the "Other" option value is 0.
//          $("#yourTextBox").hide();
// });



$('#yourTextBox, input[type="text"]').change(function () {
  if ($('#drop').val() == "Random") {
    $('#yourTextBox').show();
  } else {
    $('#yourTextBox').hide();
  }
});