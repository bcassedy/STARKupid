STARKupid.Views.ProfileShow = Backbone.View.extend({
  intialize: function () {
    this.listenTo(this.model, 'sync change', this.render);
  },

  template: JST['profiles/show'],
  render: function () {
    var renderedContent = this.template({
      profile: this.model
    });
    this.$el.html(renderedContent);

    return this;
  }
});