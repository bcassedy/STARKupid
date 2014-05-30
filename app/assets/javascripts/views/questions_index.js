STARKupid.Views.QuestionsIndex = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  events: {
    'submit .question-form': 'submitQuestionForm'
  },

  render: function () {
    if (this.collection.length === 0) {
      this.template = JST['questions/index'];
    } else {
      this.template = JST['questions/show'];
    }
    var renderedContent = this.template({
      question: this.collection.first()
    });
    this.$el.html(renderedContent);

    return this;
  },

  submitQuestionForm: function (event) {
    var that = this;
    event.preventDefault();
    var answerData = $(event.currentTarget).serializeJSON();
    var url = 'api/questions/' + this.collection.first().id +
      '/answered_questions';
    $.ajax({
      url: url,
      type: 'POST',
      data: answerData,
      success: function () {
        that.collection.fetch({
          success: function () {
            Backbone.history.navigate('#/questions', { trigger: true });
          }
        });
      }
    });
  }
});
