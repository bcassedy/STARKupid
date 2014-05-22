STARKupid.Views.ProfileNew = Backbone.View.extend({
  template: JST['profiles/new'],
  render: function () {
    var renderedContent = this.template({
      profile: this.model
    });
    this.$el.html(renderedContent);

    return this;
  }
});