assert = chai.assert



  # it "should create a card collection", ->
  #   collection = new Deck()
  #   assert.strictEqual collection.length, 52


# AppSpec
# If Dealer Has high score, Dealer Wins
# If player has high score, player wins

# CardSpec
# gets proper "Best Score"

#HandView
#if Dealer busts, player wins
#if player busts, dealer wins
describe "card constructor", ->
  beforeEach ->
    card = new Card()

    describe '', ->
      it 'should give the last card from the deck', ->
        assert.strictEqual deck.length, 50
        assert.strictEqual deck.last(), hand.hit()
        assert.strictEqual deck.length, 49