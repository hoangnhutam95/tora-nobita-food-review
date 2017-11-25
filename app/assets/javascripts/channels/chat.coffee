App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("conect")

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log("disconect")

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log(data)
    if data.type=="message"
    	if data.who=="sender"
    		$("<div style='border: solid blue'>"+data.body+"</div>").appendTo($("#conversation_"+data.conversation).find('#content')).hide().show(1000);
    	else
    		$("<div style='border: solid red'>"+data.body+"</div>").appendTo($("#conversation_"+data.conversation).find('#content')).hide().show(1000);
