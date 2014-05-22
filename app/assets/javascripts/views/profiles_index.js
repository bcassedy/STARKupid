STARKupid.Views.ProfilesIndex = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render)
  },
  template: JST['profiles/index'],
  render: function () {
    var renderedContent = this.template({
      profiles: this.collection
    });
    this.$el.html(renderedContent);

    return this;
  }
})