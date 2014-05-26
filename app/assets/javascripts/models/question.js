STARKupid.Models.Question = Backbone.Model.extend({
  answerChoices: function () {
    return this.get('answer_choices');
  }
});