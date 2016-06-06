$(function() {
  $('.directUpload').find("input:file").each(function(i, elem) {
    var fileInput    = $(elem);
    var counter      = 1;
    var form         = $(fileInput.parents('form:first'));
    var submitButton = form.find('input[type="submit"]');
    var progressBar  = $("<div class='bar'></div>");
    var barContainer = $("<div class='progress'></div>").append(progressBar);
    fileInput.after(barContainer);
    fileInput.fileupload({
      acceptFileTypes:          /(\.|\/)(gif|jpe?g|png|bmp|pdf|docx?|pages|numbers|key|md)$/i,
      fileInput:                fileInput,
      url:                      form.data('url'),
      type:                     'POST',
      autoUpload:               true,
      limitMultiFileUploads:    3,
      maxNumberOfFiles:         10,
      maxFileSize:              10000000,
      sequentialUploads:        true,
      formData:                 form.data('form-data'),
      paramName:                'file', // S3 does not like nested name fields i.e. name="user[avatar_url]"
      dataType:                 'XML',  // S3 returns XML if success_action_status is set to 201
      replaceFileInput:         false,
      progressall: function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        progressBar.css('width', progress + '%')
      },
      start: function (e) {
        submitButton.prop('disabled', true);
        progressBar.
          css('background', 'green').
          css('display', 'block').
          css('width', '0%').
          text("Loading...");
      },
      done: function(e, data) {
        submitButton.prop('disabled', false);
        progressBar.text("Uploading done");

        // extract key and generate URL from response
        var key   = $(data.jqXHR.responseXML).find("Key").text();
        var url   = '//' + form.data('host') + '/' + key;

        // create hidden field
        var input = $("<input />", { type:'hidden', name: 'parchment[parchment[' + counter +']]', value: url })
        counter++
        form.append(input);
      },
      fail: function(e, data) {
        submitButton.prop('disabled', false);
        console.log(data)
        progressBar.
          css("background", "red").
          text("Failed");
      }
    });
  });
});
