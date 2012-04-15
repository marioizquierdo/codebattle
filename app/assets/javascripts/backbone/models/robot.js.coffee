class Codebattle.Models.Robot extends Backbone.Model

  initialize: ->
    @boxpos = [0, 0]
    @refresh()


  step: (direction) ->
    canvas.ctx.clearRect(0,0,canvas.width,canvas.height)

    switch direction
      when "up" then @boxpos[1] -=  canvas.blocksize
      when "down" then @boxpos[1] += canvas.blocksize
      when "right" then @boxpos[0] += canvas.blocksize
      when "left" then @boxpos[0] -= canvas.blocksize

    canvas.ctx.fillStyle = "rgb(200,0,0)";
    canvas.ctx.fillRect(@boxpos[0], @boxpos[1], canvas.blocksize, canvas.blocksize)


  clear: () ->
    canvas.ctx.clearRect(0,0,canvas.width,canvas.height)

  paint: () ->
    canvas.ctx.fillStyle = "rgb(200,0,0)"
    canvas.ctx.fillRect @boxpos[0], @boxpos[1], canvas.blocksize, canvas.blocksize

  refresh: () ->
    @clear()
    @paint()


  nearFlower: ->
    # calculate distance in number of blocks
    xdiff = Math.abs((flowerpos[0]/25) - (@boxpos[0]/25))
    ydiff = Math.abs((flowerpos[1]/25) - (@boxpos[1]/25))

    return (xdiff <= 1) && (ydiff <= 1)

  pickFlower: ->
    if @nearFlower()
      alert("Picked the flower!")
      flowervisible = false

      # refresh the view
      refresh()
    else
      alert("No flower nearby!")
