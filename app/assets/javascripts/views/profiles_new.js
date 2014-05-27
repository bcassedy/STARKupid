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
    var that = this;
    event.preventDefault();
    var profileData = $(event.target).serializeJSON();
    this.model.save(profileData, {
      success: function () {
        Backbone.history.navigate('#/profiles/' + this.escape('username'));
      }
    });
  }
});