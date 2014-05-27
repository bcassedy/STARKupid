STARKupid.Views.FavoritesIndex = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  className: 'col-xs-10 col-xs-offset-2',

  template: JST['profiles/index'],

  render: function () {
    var renderedContent = this.template({
      profiles: this.collection,
      header: 'Favorites'
    });
    this.$el.html(renderedContent);

    return this;
  }
});