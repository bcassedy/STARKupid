STARKupid.Views.ProfilesSearch = Backbone.View.extend({
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
    STARKupid.Collections.searchResults = new STARKupid.Collections.Profiles();
    $.ajax({
      url: '/api/profiles/search',
      method: 'POST',
      data: searchTerms,
      success: function (resp) {
        STARKupid.Collections.searchResults.set(resp);
        STARKupid.Collections.profiles.set(resp);
        view.remove();
        Backbone.history.navigate('#/profiles/search/results');
      }
    });
  },

  exit: function (event) {
    if (event.which === 27) {
      this.remove();
    }
  },
});