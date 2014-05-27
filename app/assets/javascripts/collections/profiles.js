STARKupid.Collections.Profiles = Backbone.Collection.extend({
  model: STARKupid.Models.Profile,

  url: 'api/profiles',

  getOrFetch: function (username) {
    var that = this;
    var profile = this.findWhere({
      username: username
    });
    if (!profile) {
      profile = new this.model({username: username});
    }
    profile.fetch({
      success: function () {
        if (profile.get('username') !== currentUserUsername) {
          that.add(profile);
        }
      },
      error: function () {
        Backbone.history.navigate('#/', {trigger: true })
      }
    });
    return profile;
  }
});