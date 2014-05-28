STARKupid.Collections.Favorites = Backbone.Collection.extend({
  model: STARKupid.Models.Profile,

  url: 'api/favorites',

  parse: function (response) {
    this.total_pages = response.total_pages;

    return response.models;
  }
});