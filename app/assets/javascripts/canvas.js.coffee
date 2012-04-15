#
# Flower Bot Canvas Engine
# created 4/14/2012
#  note: the canvas should be a multiple of the block size (current default is 25)

# window.canvas =
#   flowervisible: true
#   blocksize: 25
# 
#   el: document.getElementById('canvas')
#   ctx: document.getElementById('canvas').getContext('2d')
# 
#   draw: ->
#     #draw the flower (should be moved to its own object, like the robot)
#     @drawFlower()
# 
#   drawFlower: () ->
#     # if flower is visible, draw it
#     if @flowervisible
#       @ctx.fillStyle = "rgb(250,80,171)"
#       @ctx.fillRect(@blocksize * 18, @blocksize * 9, @blocksize, @blocksize)
#       flowerpos = [@blocksize * 18,@blocksize * 9]
# 
#   reset: ->
#     #make flower visible
#     @flowervisible = true
#     @draw()
