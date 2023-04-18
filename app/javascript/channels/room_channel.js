import consumer from "./consumer"

document.addEventListener("turbolinks:load", () => {
  const roomElement = document.getElementById("room-id");
  const roomId = roomElement.getAttribute("data-room-id");
  consumer.subscriptions.create({ channel: "RoomChannel", room_id: roomId }, {
    connected() {
      console.log("connected...", roomId)
    },

    disconnected() {
    },

    received(data) {
      var conversation = $('#conversations-list').find("[data-conversation-id='" + data.conversation.id + "']");
      conversation.find('.messages-list').find('ul').append(data.html);
      conversation.find('textarea').val('');
    }
  });
})
