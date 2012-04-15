jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  
  # CoffeeScript = require './coffee-script'
  # CoffeeScript.require = require
  # 
  # 
  CoffeeScript.eval = (code, options = {}) ->
    options.bare ?= on
    eval CoffeeScript.compile code, options
  
  
  
  CoffeeScript.run = (code, options = {}) ->
    options.bare = on
    Function(CoffeeScript.compile code, options)()


  $("#play").click ->
    console.log('Button clicked')
    console.log $("#commands")
    commands = $("#commands").val()
    console.log('Commands: ' + commands)
    res = CoffeeScript.run commands
    console.log 'Result:' + res

return unless window?