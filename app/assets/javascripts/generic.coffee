ready = ->
  $("#logo").contents().find("path").css("fill", "white")

$(document).on 'ready page:load', ready



