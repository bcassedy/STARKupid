// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.draggable
//= require jquery.ui.droppable
//= require serializejson
//= require bootstrap
//= require underscore
//= require backbone
//= require star_kupid
//= require_tree ../templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers
//= require_tree .

$(document).ready(function () {
  STARKupid.Collections.searchResults = new STARKupid.Collections.Profiles();
  $('#left-nav').affix({
        offset: {
          top: $('.navbar').height() - $('#left-nav').scrollTop()
        }
  });

  $('.left-nav').on('click', function (event) {
    $('.active').removeClass('active');
    $(event.target).addClass('active');
  });

  $('.navbar-brand').on('click', function (event) {
    $('.active').removeClass('active');
    $('.matches').addClass('active');
  });

  $('.search-btn').on('click', function (event) {
    var searchView = new STARKupid.Views.ProfilesSearch({
      collection: STARKupid.Collections.searchResults
    });
    $('body').prepend(searchView.render().$el);
  });

  $('#favorites').droppable({
    drop: function (event, ui) {
      var favoriteData = { username: ui.draggable.data('username') };
      ui.draggable.hide();
      $.ajax({
        url: 'api/favorites',
        type: 'POST',
        data: favoriteData,
        success: function (resp) {
          var favorite = new STARKupid.Models.Profile(resp);
          STARKupid.Collections.favorites.add(favorite);
          $('.alert').remove();
          $('.panel').prepend('<div class="alert alert-success text-center">\
            Added Favorite</div>');
        },
        error: function (resp) {
          $('.alert').remove();
          $('.panel').prepend('<div class="alert alert-danger text-center">\
            Add Favorite Failed</div>');
        }
      });
    }
  });

  function getMessages () {
    STARKupid.Collections.messages.fetch({
      success: function () {
        if (STARKupid.Collections.messages.some(function (message) {
          return message.get('read') === false;
        })) {
          $('.glyphicon-envelope').addClass('msg-alert');
        } else {
          $('.glyphicon-envelope').removeClass('msg-alert');
        }
      }
    });
  }
  
  if (currentUserUsername) {
    STARKupid.Collections.profiles.fetch({
      success: function () {
        currentUserProfile =
          STARKupid.Collections.profiles.get(currentUserUsername);
      }
    });
    STARKupid.Collections.messages = 
      (STARKupid.Collections.messages || 
        new STARKupid.Collections.Messages());
    getMessages();
    setInterval(getMessages,
      20000
    );
    STARKupid.Collections.favorites = (STARKupid.Collections.favorites || new STARKupid.Collections.Favorites());
    STARKupid.Collections.favorites.fetch();
  }
});