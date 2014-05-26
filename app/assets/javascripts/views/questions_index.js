STARKupid.Views.QuestionsIndex = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  template: JST['questions/index'],

  render: function () {
    var renderedContent = this.template({
      questions: this.collection
    });
    this.$el.html(renderedContent);

    return this;
  }
})