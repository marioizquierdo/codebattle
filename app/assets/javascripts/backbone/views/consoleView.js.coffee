class Codebattle.Views.ConsoleView extends Backbone.View

  id: 'console'
  template: JST['console']

  render: ->
    $(@el).html @template()
    $('#main-screen').html(@el)
    this