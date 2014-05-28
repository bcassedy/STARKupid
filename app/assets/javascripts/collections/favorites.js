STARKupid.Collections.Favorites = Backbone.Collection.extend({
  model: STARKupid.Models.Profile,

  url: 'api/favorites',

  parse: function (response) {
    debugger
    this.total_pages = response.total_pages;
    this.page = response.page

    return response.models;
  }
});