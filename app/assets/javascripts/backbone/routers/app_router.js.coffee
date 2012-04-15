class Codebattle.Routers.AppRouter extends Backbone.Router
  routes:
    "*actions": "loadApp" # matches http://example.com/#anything-here

  loadApp: ->
    Codebattle.Models.campaign = new Codebattle.Models.Campaign

    @view = new Codebattle.Views.ConsoleView level: Codebattle.Models.campaign.get('levels')[0]
    $('#main-screen').html(@view.render().el)

    if location.hash
      codeURI = location.hash.substring(1)
      code = decodeURI codeURI
      @view.replaceCode code



