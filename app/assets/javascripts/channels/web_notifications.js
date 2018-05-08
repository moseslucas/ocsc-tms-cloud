App.web_notifications = App.cable.subscriptions.create("WebNotificationsChannel", {
  connected: function() {
    console.log('connected')
  },

  disconnected: function() {
    console.log('disconnected')
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    console.log('recceived: ',data)
    // Called when there's incoming data on the websocket for this channel
  }
});
