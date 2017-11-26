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
				conv_div=$(data).attr('id')
				if $("#conversations #"+conv_div).length==0#neu khung chat nay chua ton tai thi moi xu li tiep
					while $("#conversations .panel").length>=4#xoa bot khung chat voi cac nguoi dung cu
						$("#conversations .panel").first().remove() 								
					$("#conversations").append(data)
					new_content=$("#"+conv_div+" #content")					
					if new_content.length>0
						new_content.scrollTop(new_content[0].scrollHeight)
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
					conv_div=$(data).attr('id')
					if $("#conversations #"+conv_div).length==0#neu khung chat nay chua ton tai thi moi xu li tiep
						while $("#conversations .panel").length>=4#xoa bot khung chat voi cac nguoi dung cu
							$("#conversations .panel").first().remove() 								
						$("#conversations").append(data)
						new_content=$("#"+conv_div+" #content")					
						if new_content.length>0
							new_content.scrollTop(new_content[0].scrollHeight)
						$("#conversations .panel-heading .close").click ()->
							$(this).closest(".panel").remove()
					tmp=$("li#notifications a.dropdown")
					if tmp.length>0
						conv_li=$("li#notifications ul li#"+conv_id)
						if conv_li.length>0
							conv_li.remove()
							number_notification=parseInt(tmp.text())-1
							if number_notification>0							
								tmp.text(number_notification)
							else
								tmp.text('')
								$("li#notifications").removeClass("has_new_messages")							
				failure: (error)->
					console.log(error)
				dataType: 'html'
	if $("li#notifications ul li").length>0
		$("li#notifications").addClass("has_new_messages")