class Codebattle.Models.Campaign extends Backbone.Model

  initialize: ->
    this.set
      levels: [
        new Codebattle.Models.Level(
          level: 1
          description: 'level one description'
          hint: 'level one hint'
        ),
        new Codebattle.Models.Level(
          level: 2
          description: 'level two description'
          hint: 'level two hint'
        )
      ]
