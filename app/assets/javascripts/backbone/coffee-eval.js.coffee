CoffeeScript.eval = (code, options = {}) ->
  options.bare ?= on
  eval CoffeeScript.compile code, options



CoffeeScript.run = (code, options = {}) ->
  options.bare = on
  Function(CoffeeScript.compile code, options)()
