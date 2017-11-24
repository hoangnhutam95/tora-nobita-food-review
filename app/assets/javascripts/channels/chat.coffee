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
