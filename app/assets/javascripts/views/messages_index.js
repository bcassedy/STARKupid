STARKupid.Views.MessagesIndex = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  template: JST['messages/index'],

  events: {
    'mouseenter .msg-row': 'toggleDelete',
    'mouseleave .msg-row': 'toggleDelete',
    'click .button-delete': 'deleteMessage'
  },

  render: function () {
    var renderedContent = this.template({
      messages: this.collection
    });
    this.$el.html(renderedContent);

    return this;
  },

  toggleDelete: function (event) {
    $(event.currentTarget).find('.button-delete').toggleClass('hidden');
  },

  deleteMessage: function (event) {
    var view = this;
    event.preventDefault();
    var messageId = $(event.target).data('id');
    var message = this.collection.get(messageId);
    message.destroy({
      success: function () {
        view.render()
        var successDiv = "<div class='alert alert-success'>Message Deleted</div>";
        $('#messages').prepend(successDiv);
      }
    });
  }
});