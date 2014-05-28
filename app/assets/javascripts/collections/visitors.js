STARKupid.Collections.Visitors = Backbone.Collection.extend({
  model: STARKupid.Models.Profile,

  url: 'api/visitors',

  parse: function (response) {
    if (response.total_pages) {
      this.total_pages = response.total_pages;
      delete response.total_pages;
    }

    return response.models;
  }
});