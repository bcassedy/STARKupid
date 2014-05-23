STARKupid.Views.ProfileShow = Backbone.View.extend({
  intialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    'click .msg-button': 'msgModal',
    'submit #msg-form': 'submitMessage'
  },

  template: JST['profiles/show'],

  render: function () {
    var renderedContent = this.template({
      profile: this.model
    });
    this.$el.html(renderedContent);
    return this;
  },

  msgModal: function (event) {
    event.preventDefault();
    var modalContent = JST['messages/compose']();
    this.$el.append(modalContent);
    $('#msg-modal').modal();
  },

  submitMessage: function (event) {
    event.preventDefault();
    var messageData = $(event.target).serializeJSON();
    var url = 'api/profiles/' + this.model.get('username') + '/messages'
    $.ajax({
      url: url,
      type: 'POST',
      data: messageData,
      success: function () {
        $('.alert-success').toggleClass('hidden');
      }
    })
  }
});