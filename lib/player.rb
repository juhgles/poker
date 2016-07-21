require 'hand'
class Player
  attr_reader :name, :hand
  def initialize(name,game)
    @name = name
    @hand = Hand.new
    @game = game
  end

  def add_card(cards)
    @hand.add_card(cards)
  end

  def discard(cards)
    @hand.discard(cards)
  end

  def fold
    @hand.discard("fold")
    @game.fold(self)
  end

end
