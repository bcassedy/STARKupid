STARKupid.Views.VisitorsIndex = Backbone.View.extend({
  template: JST['visitors/index'],

  className: 'col-xs-10 col-xs-offset-2',

  render: function () {
    var renderedContent = this.template({
      visitors: this.collection
    });
    this.$el.html(renderedContent);

    return this;
  }
})