STARKupid.Views.VisitorsIndex = Backbone.View.extend({
  initialize: function () {
    this.collection.page = 1;
    this.listenTo(this.collection, 'sync', this.render)
  },

  template: JST['visitors/index'],

  className: 'col-xs-10 col-xs-offset-2',

  render: function () {
    var renderedContent = this.template({
      visitors: this.collection
    });
    this.$el.html(renderedContent);
    $('.profile-div').draggable({
      revert: 'invalid'
    });
    $(window).on('scroll', this.nextPage.bind(this));

    return this;
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
})