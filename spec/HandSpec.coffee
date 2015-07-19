assert = chai.assert
expect = chai.expect

# AppSpec
# If Dealer Has high score, Dealer Wins
# If player has high score, player wins

# CardSpec
# gets proper "Best Score"

# HandView
# if Dealer busts, player wins
# if player busts, dealer wins


# check that stand trigger stand
# handleDealer check
#   flip the first card over
#   check that it hit whenthe score is less than 17
#   trigger finished only if dealer does not break
# check that best score return best of two score
# 



describe "Hand Test", ->

  it 'should trigger handToDealer', (done)->
    hand = new Hand()
    hand.on 'handToDealer', ->
      assert(true);
      done();
    hand.stand();

  it 'should flip the card when called handleDealer', ->
    deck = new Deck()
    hand = deck.dealDealer()
    spy = sinon.spy(hand.at(0), "flip")
    hand.handleDealer()
    expect(hand.at(0).flip.callCount).to.be.equal(1)

  it 'should do the same thing like above', ->
    deck = new Deck()
    hand = deck.dealDealer()
    expect(hand.at(0).get('revealed')).to.be.false
    hand.handleDealer()
    expect(hand.at(0).get('revealed')).to.be.true

  it 'should not flip the card when called handleDealer', ->
    deck = new Deck()
    hand = deck.dealPlayer()
    spy = sinon.spy(hand.at(0), "flip")
    hand.handleDealer()
    expect(hand.at(0).flip.callCount).to.be.equal(0)

  it 'best score should be less than 17', ->
    deck = new Deck()
    hand = deck.dealPlayer()
    # Override the cards in the hard with set values (5,2)
    hand.at(0).set('value', 5)
    hand.at(1).set('value', 2)
    spy = sinon.spy(hand, "handleDealer")
    hand.handleDealer()
    expect(hand.bestScore()).to.be.below(17)


  it 'should hit the card when score is less than 17', ->
    # Set a spy on hit()

    # call handleDealer()

    # check to make sure score is >=17

    # check to make sure hit has been called at least once

    # 
    deck = new Deck()
    hand = deck.dealDealer()
    # Override the cards in the hard with set values (5,2)
    hand.at(0).set('value', 5)
    hand.at(1).set('value', 2)
    spy = sinon.spy(hand, "hit")
    hand.handleDealer()
    expect(hand.hit.callCount).to.be.above(0)

  it 'trigger finished when score as soon as score goes over 21', ->
    deck = new Deck()
    hand = deck.dealDealer()
 
    hand.on 'finished', ->
      assert(true);
    hand.handleDealer();

  it 'bestScore should return best of two score', ->
    deck = new Deck()
    hand = deck.dealPlayer()
 
    hand.at(0).set('value', 2)
    hand.at(1).set('value', 1)
    spy = sinon.spy(hand, "bestScore")
    expect(hand.bestScore()).to.be.equal(13)

  it 'should trigger finished if initial score is a Blackjack', ->
    deck = new Deck()
    desk.at()
    hand = deck.dealPlayer()

    #spy = sinon.spy(hand.at(0), "flip")
    #hand.handleDealer()
    #expect(hand.at(0).flip.callCount).to.be.equal(0)

    #   handleDealer: -> 
    # console.log('handling dealer')
    # @at(0).flip()
    # @hit() while @minScore() < 17
    # if @minScore() <= 21
    #     @trigger "finished"
