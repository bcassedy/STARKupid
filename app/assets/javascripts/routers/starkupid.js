STARKupid.Routers.CupidRouter = Backbone.Routers.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.profiles = options.profiles;
  },

  routes: {
    '': 'index',
  },

  index: function () {

  },

  _swapView: function (view) {
    if (this.currentView) {
      this.currentView.remove();
    }
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});