STARKupid.Views.MessagesIndex = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  template: JST['messages/index'],

  render: function () {
    var renderedContent = this.template({
      messages: this.collection
    });
    this.$el.html(renderedContent);

    return this;
  }
});