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
    $.ajax({
      url: 'api/answered_questions',
      type: 'POST',
      data: answerData
    });
  }
});