STARKupid.Models.Profile = Backbone.Model.extend({
  //need to change idAttribute back
  idAttribute: 'username',

  url: function () {
    if (this.created_at) {
      return 'api/profiles/' + this.id;
    } else {
      return 'api/profiles'
    }
  },

  photos: function () {
    return this.get('photos');
  }
});
