class Codebattle.Views.ConsoleView extends Backbone.View

  id: 'console'
  template: JST['console']

  events:
    'click button#execute': 'execute'

  render: ->
    $(@el).html @template(@options.level)
    this

  execute: ->
    @commands = @$('textarea#commands').val()
    @commandsResult = CoffeeScript.run @commands
    console.log "Result: #{@commandsResult}"
