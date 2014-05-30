STARKupid.Views.ProfileShow = Backbone.View.extend({
  intialize: function () {
    this.listenTo(this.model, 'sync change', this.render);
  },

  className: 'row padded-top',

  events: {
    'click .msg-button': 'msgModal',
    'click .Remove': 'removeFavorite',
    'click .Add': 'addFavorite',
    'submit #msg-form': 'submitMessage',
    'mouseenter #lead-photo': 'showPhotos',
    'mouseleave #lead-photo': 'showPhotos'
  },

  template: JST['profiles/show'],

  render: function () {
    debugger
    var renderedContent = this.template({
      profile: this.model
    });
    this.$el.html(renderedContent);
    return this;
  },

  msgModal: function (event) {
    event.preventDefault();
    var modalContent = JST['messages/compose']();
    this.$el.append(modalContent);
    $('#msg-modal').modal();
  },

  submitMessage: function (event) {
    event.preventDefault();
    var messageData = $(event.target).serializeJSON();
    var url = 'api/profiles/' + this.model.get('username') + '/messages';
    $.ajax({
      url: url,
      type: 'POST',
      data: messageData,
      success: function () {
        $('.alert-success').toggleClass('hidden');
      }
    });
  },

  showPhotos: function (event) {
    $('.sub-photo').toggleClass('hidden');
  },

  removeFavorite: function (event) {
    var username = this.model.id;
    var url = 'api/favorites/' + username;
    $.ajax({
      url: url,
      type: 'DELETE',
      success: function (resp) {
        var favorite = STARKupid.Collections.favorites.findWhere(
          { username: username }
        )
        STARKupid.Collections.favorites.remove(favorite);
        $(event.target).text('Add Favorite');
        $('.fav').addClass('Add');
        $('.fav').removeClass('Remove');
      }
    });
  },

  addFavorite: function (event) {
    var favoriteData = { username: this.model.id };
    $.ajax({
      url: 'api/favorites',
      type: 'POST',
      data: favoriteData,
      success: function (resp) {
        var favorite = new STARKupid.Models.Profile(resp);
        STARKupid.Collections.favorites.add(favorite);
        $(event.target).text('Remove Favorite');
        $('.fav').addClass('Remove');
        $('.fav').removeClass('Add');
      }
    });
  }
});