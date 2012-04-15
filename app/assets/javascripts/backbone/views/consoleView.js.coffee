class Codebattle.Views.ConsoleView extends Backbone.View

  id: 'console'
  template: JST['console']

  events:
    'click button#execute': 'execute'
    'click button#share': 'share'    

  render: ->
    $(@el).html @template(@options.level)
    this

  execute: ->
    @commands = @$('textarea#commands').val()
    @commandsResult = CoffeeScript.run @commands
    console.log "Result: #{@commandsResult}"

  share: ->
    @code_URI = encodeURI(@$('textarea#commands').val())
    console.log @$('#shareURI')
    $('#shareURI').val(window.location.href + '?autoplay=true&code=' + @code_URI)