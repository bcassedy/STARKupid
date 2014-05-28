STARKupid.Views.FavoritesIndex = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
    this.collection.page = 1;
  },

  className: 'col-xs-10 col-xs-offset-2',

  template: JST['profiles/index'],

  render: function () {
    var renderedContent = this.template({
      profiles: this.collection,
      header: 'Favorites'
    });
    this.$el.html(renderedContent);
    $(window).on('scroll', this.nextPage.bind(this));

    return this;
  },

  leave: function () {
    $(window).off('scroll');
    this.remove();
  },

  nextPage: function () {
    if ($(window).scrollTop() + $(window).height() === $(document).height()) {
      if (this.collection.page < this.collection.total_pages) {
        this.collection.page += 1
        this.collection.fetch({
          remove: false,
          data: { page: this.collection.page }
        });
      } 
    }
  }
});