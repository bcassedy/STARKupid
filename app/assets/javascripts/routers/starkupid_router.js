STARKupid.Routers.CupidRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.profiles = options.profiles;
  },

  routes: {
    '': 'profilesIndex',
    'profiles/:username': 'showProfile',
    'profiles/search/results': 'searchResults',
    'profile/new': 'newProfile',
    'profile/edit': 'editProfile',
    'messages': 'messagesIndex',
    'messages/:id': 'messageShow',
    'questions': 'questionsIndex',
    'questions/:id': 'questionShow',
    'visitors': 'visitorsIndex',
    'favorites': 'favoritesIndex'
  },

  profilesIndex: function () {
    $('.matches').addClass('active');
    this.profiles.fetch({
      remove: false,

      data: { page: 1 }
    });
    var indexView = new STARKupid.Views.ProfilesIndex({
      collection: this.profiles
    });
    this._swapView(indexView);
  },

  searchResults: function () {
    var collection = STARKupid.Collections.searchResults;
    var searchResultsView = new STARKupid.Views.ProfilesIndex({
      collection: collection
    });
    this._swapView(searchResultsView);
  },

  showProfile: function (username) {
    var that = this;
    this.profiles.getOrFetch(username, function (profile) {
      var showView = new STARKupid.Views.ProfileShow({
        model: profile
      });
      that._swapView(showView);
    });
  },

  newProfile: function () {
    var profile = new STARKupid.Models.Profile();
    var newView = new STARKupid.Views.ProfileNew({
      model: profile,
    });
    this._swapView(newView);
  },

  editProfile: function () {
    if (!currentUserProfile) {
      Backbone.history.navigate('#/profile/new');
      return;
    }
    var editView = new STARKupid.Views.ProfileEdit({
      model: currentUserProfile
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
      model: message,
      read: message.get('read')
    });
    this._swapView(messageShowView);
    message.fetch();
  },

  questionsIndex: function () {
    var questions = STARKupid.Collections.questions = 
      (STARKupid.Collections.questions || new STARKupid.Collections.Questions());
    questions.fetch();
    var questionsIndexView = new STARKupid.Views.QuestionsIndex({
      collection: questions
    });
    this._swapView(questionsIndexView);
  },

  questionShow: function (id) {
    var that = this;
    var questions = STARKupid.Collections.questions = 
      (STARKupid.Collections.questions || new STARKupid.Collections.Questions());
    questions.fetch({
      success: function (resp) {
        var question = questions.get(id);
        var questionShowView = new STARKupid.Views.QuestionShow({
          model: question
        });
        that._swapView(questionShowView);
      }
    });
  },

  visitorsIndex: function () {
    var that = this;
    var visitors = STARKupid.Collections.visitors = 
      (STARKupid.Collections.visitors || new STARKupid.Collections.Visitors());
    var page = (visitors.page || 1);
    if (!visitors.total_pages) {
      visitors.fetch({
        data: { page: page }
      });
    } else {
      if (visitors.total_pages >= page) {
        visitors.fetch({
          remove: false,

          data: { page: page }
        });
      }
    }
    var visitorsIndexView = new STARKupid.Views.VisitorsIndex({
      collection: visitors
    });
    this._swapView(visitorsIndexView);
  },

  favoritesIndex: function () {
    var favorites = STARKupid.Collections.favorites = 
      (STARKupid.Collections.favorites || new STARKupid.Collections.Favorites());
    var page = (favorites.page || 1);
    if (!favorites.total_pages) {
      favorites.fetch({
        data: { page: page }
      });
    } else {
      if (favorites.total_pages >= page) {
        favorites.fetch({
          remove: false,

          data: { page: page }
        });
      }
    }
    var favoritesIndexView = new STARKupid.Views.FavoritesIndex({
      collection: favorites
    });
    this._swapView(favoritesIndexView);
  },

  _swapView: function (view) {
    if (this.currentView) {
      this.currentView.leave();
    }
    this.currentView = view;
    this.$rootEl.html(view.render().$el).hide().fadeIn();
    $(document).scrollTop(0);
  }
});