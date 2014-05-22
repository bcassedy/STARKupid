STARKupid.Routers.CupidRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.profiles = options.profiles;
  },

  routes: {
    '': 'index',
    'profiles/:username': 'showProfile'
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

  _swapView: function (view) {
    if (this.currentView) {
      this.currentView.remove();
    }
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});