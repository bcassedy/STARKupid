STARKupid.Routers.CupidRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.profiles = options.profiles;
  },

  routes: {
    '': 'index',
    'profiles/:username': 'showProfile',
    'profile/new': 'newProfile',
    'profile/edit': 'editProfile'
  },

  index: function () {
    this.profiles.fetch();
    var indexView = new STARKupid.Views.ProfilesIndex({
      collection: this.profiles
    });
    this._swapView(indexView);
  },

  showProfile: function (username) {
    var profile = this.profiles.getOrFetch(username);
    var showView = new STARKupid.Views.ProfileShow({
      model: profile
    });
    this._swapView(showView);
  },

  newProfile: function () {
    var profile = new STARKupid.Models.Profile();
    var newView = new STARKupid.Views.ProfileNew({
      model: profile,
      collection: this.profiles
    });
    this._swapView(newView);
  },

  editProfile: function () {
    var profile = this.profiles.getOrFetch(currentUserUsername);
    var editView = new STARKupid.Views.ProfileEdit({
      model: profile,
    });
    this._swapView(editView);
  },

  _swapView: function (view) {
    if (this.currentView) {
      this.currentView.remove();
    }
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});