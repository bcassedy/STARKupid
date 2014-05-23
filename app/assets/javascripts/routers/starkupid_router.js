STARKupid.Routers.CupidRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.profiles = options.profiles;
  },

  routes: {
    '': 'profilesIndex',
    'profiles/:username': 'showProfile',
    'profile/new': 'newProfile',
    'profile/edit': 'editProfile',
    'messages': 'messagesIndex',
  },

  profilesIndex: function () {
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
    profile.fetch();
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
    if (profile.isNew()) {
      Backbone.history.navigate('#/profile/new');
      return;
    }
    var editView = new STARKupid.Views.ProfileEdit({
      model: profile
    });
    this._swapView(editView);
  },

  messagesIndex: function () {
    var messages = new STARKupid.Collections.Messages();
    messages.fetch();
    var messagesIndexView = new STARKupid.Views.MessagesIndex({
      collection: messages
    });
    debugger
    this._swapView(messagesIndexView);
  },

  _swapView: function (view) {
    if (this.currentView) {
      this.currentView.remove();
    }
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});