ready = ->
  $('.upload-image').on 'click', (e)->
    e.preventDefault()
    $(this).next('input[type=file]').click()

$(document).on 'ready page:load', ready
