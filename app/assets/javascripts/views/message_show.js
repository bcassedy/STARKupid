STARKupid.Views.MessageShow = Backbone.View.extend({
  template: JST['messages/show'],

  render: function () {
    var renderedContent = this.template({
      message: this.model
    });
    this.$el.html(renderedContent);

    return this;
  }
});