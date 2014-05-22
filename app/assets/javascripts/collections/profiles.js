STARKupid.Collections.Profiles = Backbone.Collection.extend({
  model: STARKupid.Models.Profile,
  url: 'api/profiles',
  getOrFetch: function (username) {
    var profile = this.findWhere({
      username: username
    });
    if (!profile) {
      profile = new this.model({username: username});
    }
    this.add(profile)
    profile.fetch({
      error: function () {
        Backbone.history.navigate('#/', {trigger: true })
      }
    });
    return profile;
  }
});