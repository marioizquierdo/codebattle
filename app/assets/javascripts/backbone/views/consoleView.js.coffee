class Codebattle.Views.ConsoleView extends Backbone.View

  id: 'console'
  template: JST['console']

  events:
    'click button#execute': 'execute'
    'click button#share': 'share'
    'click #shareURI': 'selectShareUri'

  render: ->
    $(@el).html @template(@options.level.toJSON())
    this

  execute: ->
    @commands = @$('textarea#commands').val()
    @commandsResult = CoffeeScript.run @commands
    console.log "Result: #{@commandsResult}"

  share: ->
    @commands = @$('textarea#commands').val()
    codeURI = encodeURI(@commands)
    href = window.location.host + '/game#' + codeURI
    @$('#shareURI').val(href)

  replaceCode: (code)->
    @$('textarea#commands').val(code)

  selectShareUri: ->
    @$('#shareURI').select()
