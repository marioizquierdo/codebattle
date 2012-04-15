# 
# Flower Bot Engine
# created 4/14/2012
#  note: the canvas should be a multiple of the block size (current default is 25)


ctx = null
boxpos = []
flowerpos = [blocksize * 18, blocksize * 9] # default flower position
flowervisible = true
blocksize = 25

window.canvas =
  draw: ->
    canvas_el = document.getElementById('canvas')
    ctx = canvas_el.getContext('2d')
    #clear rect in case we're resetting
    ctx.clearRect(0,0,canvas_el.width,canvas_el.height)

    #draw the player
    ctx.fillStyle = "rgb(200,0,0)"
    ctx.fillRect 0, 0, blocksize, blocksize
    boxpos = [0, 0]

    #draw the flower
    @drawFlower(ctx)

  drawFlower: (context) ->
    # if flower is visible, draw it
    if flowervisible
      context.fillStyle = "rgb(250,80,171)"
      context.fillRect(blocksize * 18, blocksize * 9, blocksize, blocksize)
      flowerpos = [blocksize * 18,blocksize * 9]

  reset: ->
    #make flower visible
    flowervisible = true
    @draw()

window.robot =
  step: (direction) ->
    canvas_el = document.getElementById('canvas')
    ctx = canvas_el.getContext('2d')
    ctx.clearRect(0,0,canvas_el.width,canvas_el.height)
    switch direction
      when "up" then boxpos[1] -=  blocksize
      when "down" then boxpos[1] += blocksize
      when "right" then boxpos[0] += blocksize
      when "left" then boxpos[0] -= blocksize    
  
    ctx.fillStyle = "rgb(200,0,0)";
    ctx.fillRect(boxpos[0], boxpos[1], blocksize, blocksize)
    #redraw flower
    window.canvas.drawFlower(ctx)


  refresh: (context) ->
    ctx.clearRect(0,0,canvas.width,canvas.height)
    ctx.fillStyle = "rgb(200,0,0)"
    ctx.fillRect boxpos[0], boxpos[1], blocksize, blocksize
    canvas.drawFlower()


  nearFlower: ->
    # calculate distance in number of blocks
    xdiff = Math.abs((flowerpos[0]/25) - (boxpos[0]/25))
    ydiff = Math.abs((flowerpos[1]/25) - (boxpos[1]/25))

    return (xdiff <= 1) && (ydiff <= 1)

  pickFlower: ->
    if @nearFlower()
      alert("Picked the flower!")
      flowervisible = false

      # refresh the view
      canvas_el = document.getElementById('canvas')
      ctx = canvas_el.getContext('2d')
      refresh(ctx)
    else
      alert("No flower nearby!")

jQuery ->
  canvas.draw()
