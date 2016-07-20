require_relative 'card'
class Deck
  attr_accessor :stack
  SUITS = [:clubs,:diamonds,:hearts,:spades]

  def initialize
    @stack = []
    SUITS.each do |suit|
      for val in 1..13
        @stack << Card.new(val,suit)
      end
    end
  end

  def shuffle
    rand(10).times {@stack.shuffle!}
    cut_point = @stack.length/2
    @stack  = @stack.drop(cut_point) + @stack.take(cut_point)
  end

  def get_cards(num=1)
    @stack.pop(num)
  end
end
