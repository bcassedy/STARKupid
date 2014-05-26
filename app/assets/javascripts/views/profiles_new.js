STARKupid.Views.ProfileNew = Backbone.View.extend({
  events: {
    'submit .profile-form': 'submit'
  },

  template: JST['profiles/form'],

  render: function () {
    var renderedContent = this.template({
      profile: this.model
    });
    this.$el.html(renderedContent);

    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var profileData = $(event.target).serializeJSON();
    var collection = this.collection;
    this.model.save(profileData)
    collection.last().on('sync', function () {
      Backbone.history.navigate('#/profiles/' + this.escape('username'));
    });
  }
});