ready = ->
  $('.upload-image').on 'click', ->
    $(this).siblings('input[type=file]').click()

$(document).on 'ready page:load', ready
