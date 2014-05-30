STARKupid.Views.ProfileEdit = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this.photoFields = this.model.photos().length;
  },

  events: {
    'submit .profile-form': 'submit',
    'click #add-photo': 'addPhotoUrl'
  },

  className: 'row padded-top',

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
  },

  addPhotoUrl: function (event) {
    if (this.photoFields < 3) {
      $('.profile-form').prepend('<div class="form-group"> \
              <label for="profile_photo_url">Photo URL</label> \
              <input \
                class="form-control" \
                type="text" \
                name="photo[url][]" \
                id="profile_photo_url"> \
            </div>');
      this.photoFields += 1;
    } else {
      debugger
      $('.form-container').prepend('<div class="alert alert-danger">Maximum \
        3 Photos</div>');
    }
  }
});