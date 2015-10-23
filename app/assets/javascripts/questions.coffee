ready = ->
  $('.upload-image').on 'click', (e)->
    e.preventDefault()
    $(this).next().click()

$(document).on 'ready page:load', ready
