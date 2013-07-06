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
      alert 'Player busted!'
    @get('dealerHand').on 'bust', =>
      alert 'Dealer busted!'