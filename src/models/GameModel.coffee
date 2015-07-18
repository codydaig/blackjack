
class window.GameModel extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    
    hand = @get 'playerHand'
    hand.on 'handToDealer', => 
      dealer = @get 'dealerHand' 
      dealer.handleDealer()
    @get('dealerHand').on "finished", => 
      if @get('dealerHand').bestScore() == @get('playerHand').bestScore()
        alert "Tie!"
      else if @get('dealerHand').bestScore() > @get('playerHand').bestScore()
        alert "Dealer wins with high score"
      else
        alert "Player wins with high score"

      