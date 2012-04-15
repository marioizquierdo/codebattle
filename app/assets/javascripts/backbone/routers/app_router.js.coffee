class Codebattle.Routers.AppRouter extends Backbone.Router
  routes:
    "*actions": "loadApp" # matches http://example.com/#anything-here

  loadApp: ( actions )->
    # The variable passed in matches the variable in the route definition "actions"
    window.Codebattle.Views.console = new Codebattle.Views.ConsoleView
    window.Codebattle.Views.console.render()

