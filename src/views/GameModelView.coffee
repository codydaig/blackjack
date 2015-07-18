class window.GameModelView extends Backbone.View
  template: _.template '
    <div class="gamearea">
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    </div>
    '


  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> 
      @model.get('playerHand').stand()
      @trigger "stand"
    'click .retry-button': -> @render()

  initialize: ->
    @model.on 'restart', @render, @
    @model.on 'win', @renderWin, @
    @model.on 'lose', @renderLose, @
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

 

