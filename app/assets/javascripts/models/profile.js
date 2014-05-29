STARKupid.Models.Profile = Backbone.Model.extend({
  //need to change idAttribute back
  idAttribute: 'username',

  url: function () {
    return 'api/profiles/' + this.id;
  },

  photos: function () {
    return this.get('photos');
  }
});
