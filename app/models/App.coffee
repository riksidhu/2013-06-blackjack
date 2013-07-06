#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on 'stand', =>
      @get('dealerHand').reveal()
      @get('dealerHand').add17()
      # logic for dealer
    @get('playerHand').on 'bust', =>
      alert 'Player Busts!'
    @get('dealerHand').on 'bust', =>
      alert 'Dealer Busts!'
    @get('dealerHand').on 'compare', =>
      if @get('dealerHand').scores()[0] > @get('playerHand').scores()[0] then alert 'Dealer Wins'
      else alert 'Player Wins'
      @set 'deck', deck = new Deck()
      @set 'playerHand', deck.dealPlayer()
      @set 'dealerHand', deck.dealDealer()
      @trigger 'resetDeck'
    @get('playerHand').on 'resetMe', =>
      @set 'deck', deck = new Deck()
      @set 'playerHand', deck.dealPlayer()
      @set 'dealerHand', deck.dealDealer()
      @trigger 'resetDeck'
    @get('dealerHand').on 'resetMe', =>
      @set 'deck', deck = new Deck()
      @set 'playerHand', deck.dealPlayer()
      @set 'dealerHand', deck.dealDealer()
      @trigger 'resetDeck'

