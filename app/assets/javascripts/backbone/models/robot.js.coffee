class Codebattle.Models.Robot extends Backbone.Model

  initialize: (name) ->
    @max_x = 6
    @max_y = 6
    @x = 1
    @y = 1
    @el = $("#robot")
    @canvas = $("#canvas")


  step: (direction) ->
    # check for edge collision 
    switch direction
      when "up" then @el = @el.animate({top: '-=50'}, 500) unless @el.position().top < 0
      when "down" then @el = @el.animate({top: '+=50'}, 500) unless @el.position().top + @el.height > @canvas.height
      when "left" then @el =  @el.animate({left: '-=50'}, 500) unless @el.position().left < 0
      when "right" then @el =  @el.animate({left: '+=50'}, 500) unless @el.position().left + @el.width > @canvas.width
      else
        alert 'I will not jump out of the screen :-)'

  pick: (object) ->
    switch object
      when 'flower' then $("#flower").fadeOut(500)

  # clear: () ->
  #   canvas.ctx.clearRect(0, 0, canvas.el.width, canvas.el.height)
  # 
  # paint: () ->
  #   
  #   canvas.ctx.fillStyle = "rgb(200,0,0)"
  #   canvas.ctx.fillRect @boxpos[0], @boxpos[1], canvas.blocksize, canvas.blocksize
  # 
  # refresh: () ->
  #   @clear()
  #   @paint()
  # 
  # 
  # nearFlower: ->
  #   # calculate distance in number of blocks
  #   xdiff = Math.abs((flowerpos[0]/25) - (@boxpos[0]/25))
  #   ydiff = Math.abs((flowerpos[1]/25) - (@boxpos[1]/25))
  # 
  #   return (xdiff <= 1) && (ydiff <= 1)
  # 
  # 
  # pickFlower: ->
  #   if @nearFlower()
  #     alert("Picked the flower!")
  #     flowervisible = false
  # 
  #     # refresh the view
  #     refresh()
  #   else
  #     alert("No flower nearby!")
