window.STARKupid = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    alert('Hello from Backbone!');
    STARKupid.Collections.profiles = new STARKupid.Collections.Profiles([]);
    new STARKupid.Routers.CupidRouter({
      $rootEl: $('#container'),
      profiles: STARKupid.Collections.profiles
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  STARKupid.initialize();
});
