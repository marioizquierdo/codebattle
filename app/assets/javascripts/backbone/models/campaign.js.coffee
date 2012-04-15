class Codebattle.Models.Campaign extends Backbone.Model

  initialize: ->
    this.set
      levels: [
        new Codebattle.Models.Level(
          level: 1
          description: 'Welcome to the far far future! Codezi needs your help finding a way to return to his family on Planet Nebulex. The Cyborg apocalypse has wiped Planet clean of all life sources - all of course except the Eureeka Flower.'
          hint: 'Codezie can only understand CoffeeScript. Type your coffeescript here to hack into Codezi'
        ),
        new Codebattle.Models.Level(
          level: 2
          description: 'level two description'
          hint: 'level two hint'
        )
      ]
