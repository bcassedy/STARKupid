STARKupid.Views.ProfilesIndex = Backbone.View.extend({
  initialize: function () {
    this.collection.page = 1;
    this.listenTo(this.collection, 'sync', this.render);
  },

  className: 'col-xs-10 col-xs-offset-2',

  events: {
    'scroll window': 'nextPage'
  },

  template: JST['profiles/index'],

  render: function () {
    debugger
    var renderedContent = this.template({
      profiles: this.collection,
      header: 'Matches'
    });
    this.$el.html(renderedContent);
    $('.profile-div').draggable({
      revert: 'invalid'
    });
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
