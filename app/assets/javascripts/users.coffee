# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  console.log( "ready!" )

  $('#user_avatar').on 'change', (event) ->
    files = event.target.files
    image = files[0]
    reader = new FileReader()

    reader.onload = (file) ->
      console.log(file)
      span = document.createElement('span')
      span.innerHTML = ['<img class="thumb" src="', file.target.result,
                        '" />'].join('')
      # document.getElementById('target').insertBefore(span, null)
      $('#target').html(span)

    reader.readAsDataURL(image)
    console.log(files)

