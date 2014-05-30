STARKupid.Views.ProfileNew = Backbone.View.extend({
  initialize: function () {
    this.photoFields = 0;
  },

  events: {
    'submit .profile-form': 'submit',
    'click #add-photo': 'addPhotoUrl',
    'click #fast-fill': 'populate'
  },

  template: JST['profiles/new'],

  fakeData: {
    age: 28,
    location: 'Malibu, CA',
    gender: 'Male',
    summary: "Hey there. I just wanted to see how this stuff works. Maybe I'll \
      message some of you heroes later.",
    life_direction: "I'm pretty awesome and working on being more awesome.",
    skills: 'Clicking buttons on great websites',
    interests: 'Discovering stuff before it\'s cool.',
    goals: 'I\'m not sure',
    url: 'http://img2.wikia.nocookie.net/__cb20131220014546/degrassi/images/c/c8/Smiley-face-text.jpg'
    },

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
    STARKupid.Collections.profiles.create(profileData, {
      success: function (response) {
        var username = response.attributes.username;
        Backbone.history.navigate('#/profiles/' + username);
      }
    });
  },

  populate: function (event) {
    event.preventDefault();
    $('#add-photo').click()
    $('.photo-url').val(this.fakeData.url);
    $('#profile_age').val(this.fakeData.age);
    $('#profile_gender').val(this.fakeData.gender);
    $('#profile_location').val(this.fakeData.location);
    $('#profile_summary').val(this.fakeData.summary);
    $('#profile_life_direction').val(this.fakeData.life_direction);
    $('#profile_skills').val(this.fakeData.skills);
    $('#profile_interests').val(this.fakeData.interests);
    $('#profile_goals').val(this.fakeData.goals);
  },

  addPhotoUrl: function (event) {
    if (this.photoFields < 3) {
      var photoField = this.photoFields + 1
      $('.profile-form').prepend('<div class="form-group"> \
              <label for="photo-url-' + photoField + '">Photo URL</label> \
              <input \
                class="form-control photo-url" \
                id="photo-url-' + photoField + '" \
                type="text" \
                name="photo[url][]"> \
            </div>');
      this.photoFields = photoField;
    } else {
      $('.form-container').prepend('<div class="alert alert-danger">Maximum \
        3 Photos</div>');
    }
  }
});