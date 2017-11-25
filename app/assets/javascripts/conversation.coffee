# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ()->
	$("#conversations #content").scrollTop($("#conversations #content")[0].scrollHeight)
	$("#conversations .panel-heading").click ()->
		$(this).closest(".panel").find("#content").toggle(500)