App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("connect")

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log("disconnect")

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel    
    if data.type=="message"    	
    	content_area=$("#conversation_"+data.conversation+" #content")
    	if content_area.length>0
	    	if data.who=="sender"
	    		$("<div class='sender_body'>"+data.body+"</div>").appendTo(content_area).hide().show(1000);
	    	else
	    		$("<div class='reciever_body'>"+data.body+"</div>").appendTo(content_area).hide().show(1000);
	    	
	    	content_area.animate({ scrollTop: content_area[0].scrollHeight}, 1000);
	    else
	    	tmp=$("li#notifications a div")
	    	if tmp.length>0
	    		conv_id=$("li#notifications ul li#"+data.conversation)
	    		if conv_id.length>0
	    		else
	    			tmp.text(parseInt(tmp.text())+1)
	    			$("li#notifications ul").append("<li id='"+data.conversation+"'><a>"+"hehe"+"</a></li>")