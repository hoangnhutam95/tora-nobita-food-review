# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ()->
	if $("#conversations #content").length>0
		$("#conversations #content").scrollTop($("#conversations #content")[0].scrollHeight)
	$("#conversations .panel-heading .close").click ()->
		$(this).closest(".panel").remove()
	$("#lienlac").click ()->
		$.get
			url: $(this).attr('link')
			success: (data)->								
				$("#conversations").append(data)
				if $("#conversations #content").length>0
					$("#conversations #content").scrollTop($("#conversations #content")[0].scrollHeight)
				$("#conversations .panel-heading .close").click ()->
					$(this).closest(".panel").remove()
			failure: (error)->
				console.log(error)
			dataType: 'html'
	$("#notifications ul").click (e)->
		target=e.target
		if target.nodeName.toLowerCase()=='a'
			conv_id=$(target).closest('li').attr('id')			
			$.get
				url: "/conversations/"+conv_id
				success: (data)->												
					$("#conversations").append(data)
					if $("#conversations #content").length>0
						$("#conversations #content").scrollTop($("#conversations #content")[0].scrollHeight)
					$("#conversations .panel-heading .close").click ()->
						$(this).closest(".panel").remove()
					tmp=$("li#notifications a div")
					if tmp.length>0
						conv_li=$("li#notifications ul li#"+conv_id)
						if conv_li.length>0							
							tmp.text(parseInt(tmp.text())-1)
					conv_li.remove()
				failure: (error)->
					console.log(error)
				dataType: 'html'