STARKupid.Collections.Profiles = Backbone.Collection.extend({
  model: STARKupid.Models.Profile,

  url: 'api/profiles',

  getOrFetch: function (username, callback) {
    var that = this;
    var user_profile = this.findWhere({
      username: username
    });
    if (!user_profile) {
      user_profile = new STARKupid.Models.Profile({username: username});
    }
    this.add(user_profile);
    user_profile.fetch({
      success: function () {
        callback(user_profile);
      },
      error: function () {
        Backbone.history.navigate('#/', {trigger: true })
      }
    });
  },

  parse: function (response) {
    if (response.total_pages) {
      this.total_pages = response.total_pages;
      delete response.total_pages;
    }

    return response.models;
  }
});