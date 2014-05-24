STARKupid.Routers.CupidRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.profiles = options.profiles;
  },

  routes: {
    '': 'profilesIndex',
    'profiles/search': 'searchProfiles',
    'profiles/:username': 'showProfile',
    'profiles/search/results': 'searchResults',
    'profile/new': 'newProfile',
    'profile/edit': 'editProfile',
    'messages': 'messagesIndex',
    'messages/:id': 'messageShow'
  },

  profilesIndex: function () {
    this.profiles.fetch();
    var indexView = new STARKupid.Views.ProfilesIndex({
      collection: this.profiles
    });
    this._swapView(indexView);
  },

  searchProfiles: function () {
    var searchView = new STARKupid.Views.ProfilesSearch();
    this._swapView(searchView);
  },

  searchResults: function () {
    var searchResultsView = new STARKupid.Views.ProfilesIndex({
      collection: STARKupid.Collections.searchResults
    });
    this._swapView(searchResultsView);
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
    var messages = STARKupid.Collections.messages = 
      (STARKupid.Collections.messages || new STARKupid.Collections.Messages());
    messages.fetch();
    var messagesIndexView = new STARKupid.Views.MessagesIndex({
      collection: messages
    });
    this._swapView(messagesIndexView);
  },

  messageShow: function (id) {
    var message = STARKupid.Collections.messages.get(id);
    var messageShowView = new STARKupid.Views.MessageShow({
      model: message
    });
    this._swapView(messageShowView);
  },

  _swapView: function (view) {
    if (this.currentView) {
      this.currentView.remove();
    }
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});