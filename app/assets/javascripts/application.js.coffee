# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require_tree ../templates
#= require underscore
#= require backbone
#= require backbone_rails_sync
#= require backbone_datalink
#= require backbone/codebattle
#= require hamlcoffee
#= require coffee-script
#= require_tree .

jQuery ($)->

  # Initialize canvas
  canvas.draw()

  # Create Robot Object
  Codebattle.Models.robot = new Codebattle.Models.Robot
  window.Phil = Codebattle.Models.robot

  # Initiate the router
  Codebattle.Routers.router = new Codebattle.Routers.AppRouter


  # Start Backbone history a neccesary step for bookmarkable URL's
  Backbone.history.start()
