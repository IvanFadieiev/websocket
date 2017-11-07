function startChat(message_room_id) {
  App.messages = App.cable.subscriptions.create({ channel: 'MessagesChannel', room: message_room_id }, {
    received: function(data) {
      $("#messages").removeClass('hidden')
      $('#message_content').val('')
      return $('#messages').append(this.renderMessage(data));
    },

    renderMessage: function(data) {
      return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
    }
  });
};
