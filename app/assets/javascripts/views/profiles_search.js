
STARKupid.Views.ProfilesSearch = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  events: {
    'submit #search-form': 'search',
    'keyup #search-form': 'exit',
  },

  className: 'search-modal',

  template: JST['profiles/search'],

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);

    return this;
  },

  search: function (event) {
    event.preventDefault();
    var view = this;
    var searchTerms = $(event.target).serializeJSON();
    $.ajax({
      url: '/api/profiles/search',
      method: 'POST',
      data: searchTerms,
      success: function (resp) {
        view.collection.set(resp.models);
        STARKupid.Collections.profiles.add(resp.models);
        view.remove();
        Backbone.history.navigate('#/profiles/search/results');
      }
    });
  },

  exit: function (event) {
    if (event.which === 27) {
      this.remove();
      Backbone.history.history.back();
    }
  },
});