STARKupid.Views.ProfileEdit = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },
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
    var model = this.model;
    this.model.save(profileData, {
      success: function (response) {
        STARKupid.Collections.profiles.add(model);
        Backbone.history.navigate('#/profiles/' + model.escape('username'));
      }
    });
  }
})