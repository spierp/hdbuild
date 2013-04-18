jQuery ->
  $('#new_document').fileupload
    dataType: "script"
    add: (e, data) ->
      types = /(\.|\/)(doc|docx|pdf|xls|xlsx|txt|rtf|rvt|rte|mov|mp4|mpg|avi|wmv|zip|rar|dxf|dwg)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        data.context = $(tmpl("template-upload", file))
        $('#new_document').append(data.context)
        data.submit()
      else
        alert("#{file.name} is not a valid document file type. If you are trying to add images, please use the image section.")
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')