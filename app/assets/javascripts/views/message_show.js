STARKupid.Views.MessageShow = Backbone.View.extend({
  template: JST['messages/show'],

  events: {
    'submit #msg-form': 'submitMessage'
  },

  render: function () {
    var renderedContent = this.template({
      message: this.model
    });
    this.$el.html(renderedContent);

    return this;
  },

  submitMessage: function (event) {
    event.preventDefault();
    var messageData = $(event.target).serializeJSON();
    var url = 'api/profiles/' + this.model.get('sender') + '/messages'
    $.ajax({
      url: url,
      type: 'POST',
      data: messageData,
      success: function () {
        $('form').prepend('<div class="alert alert-success">Message Sent</div>');
        $('#msg_body').val('')
      }
    });
  }
});