App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("connect")

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log("disconnect")

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log(data)
    if data.type=="message"
    	content_area=$("#conversation_"+data.conversation+" #content")
    	if data.who=="sender"
    		$("<div class='sender_body'>"+data.body+"</div>").appendTo(content_area).hide().show(1000);
    	else
    		$("<div class='reciever_body'>"+data.body+"</div>").appendTo(content_area).hide().show(1000);
    	content_area.animate({ scrollTop: content_area[0].scrollHeight}, 1000);