# AppSpec
# If Dealer Has high score, Dealer Wins
# If player has high score, player wins

describe "App Test", ->

  it 'if dealer has higher than then dealer wins', ->
    deck = new Deck()
    hand = deck.deal()
    spy = sinon.spy(hand.at(0), "flip")
    hand.handleDealer()
    expect(hand.at(0).flip.callCount).to.be.equal(1)