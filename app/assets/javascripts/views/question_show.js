STARKupid.Views.QuestionShow = Backbone.View.extend({
  events: {
    'submit .question-form': 'submitQuestionForm'
  },

  template: JST['questions/show'],

  render: function () {
    var renderedContent = this.template({
      question: this.model
    });
    this.$el.html(renderedContent);

    return this;
  },

  submitQuestionForm: function (event) {
    event.preventDefault();
    var answerData = $(event.currentTarget).serializeJSON();
    var url = 'api/questions/' + this.model.id + '/answered_questions'
    $.ajax({
      url: url,
      type: 'POST',
      data: answerData,
      success: function () {
        Backbone.history.navigate('#/questions');
      }
    });
  }
});