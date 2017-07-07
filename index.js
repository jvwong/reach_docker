$('document').ready(function () {
  $('#results-div').collapse('hide');
  $(document).ajaxStart(function () {
    $('#loading').modal('show');
    $('#results-div').collapse('hide');
    }).ajaxStop(function () {
    $('#loading').modal('hide');
    $('#results-div').css("display", "initial");
    $('#results-div').collapse('show');
  });

  var baseURL = location.protocol + '//' + location.hostname + (location.port ? ':'+location.port: '') + "/process/pa
  per/";

  // Dispatch submission
  $("#paper-reader-form").submit(function(event) {
    event.preventDefault();

    var formData = new FormData();
    //var formData = new FormData($("#paper-reader-form")[0]);
    formData.append("input-type", $("#input-type").val());
    // get file
    formData.append("paper-upload", $("#paper-upload")[0].files[0]);

    var outputType = $("#output-type").val();
    var postURL = baseURL + outputType;

    console.log("postURL: " + postURL);
    // console.log("output-type: " + outputType);

    $.ajax({
      url: postURL,
      type: "POST",
      data: formData,
      processData: false,
      contentType: false,
      success: function(response) { $('#results').val(response) }
    });
  });

});
