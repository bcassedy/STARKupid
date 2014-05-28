window.STARKupid = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    STARKupid.Collections.profiles = new STARKupid.Collections.Profiles([]);
    new STARKupid.Routers.CupidRouter({
      $rootEl: $('#content'),
      profiles: STARKupid.Collections.profiles
    });
    Backbone.Model.prototype.isNew = function () {
      return this.get('created_at') == null;
    };
    Backbone.View.prototype.leave = function () {
      this.remove();
    };
  }
};

$(document).ready(function(){
  STARKupid.initialize();
});
