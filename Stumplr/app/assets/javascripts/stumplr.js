window.Stumplr = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Stumplr.Routers.Router
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Stumplr.initialize();
});
