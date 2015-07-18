class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    theCard = @deck.pop()
    @add(theCard)
    if @minScore() > 21 
      @trigger "busted"
    theCard


  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  handleDealer: -> 
    if @isDealer
      @at(0).flip()
      @hit() while @minScore() < 17
      if @minScore() <= 21
          @trigger "finished"


  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  bestScore: -> Math.max(@scores()[0], @scores()[1])

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  stand: -> 
    console.log "hand to dealer"
    @trigger "handToDealer"


