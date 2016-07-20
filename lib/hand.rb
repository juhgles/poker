class Hand
  attr_accessor :current_hand

  HAND_STRENGTH = {
    :high_card? =>1,
    :one_pair? => 2,
    :two_pair? => 3,
    :three_of_a_kind? => 4,
    :straight? => 5,
    :flush? => 6,
    :full_house? => 7,
    :four_of_a_kind? => 8,
    :straight_flush? => 9
  }

  def initialize
    @current_hand = []
    @winning_hand = []
    @winning_hand_type = :highcard
  end

  def add_card(*cards)
    raise "Your hand is full." if @current_hand.length >= 5
    cards.each {|card| @current_hand << card }
  end

  def discard(*cards)
    raise "You don't have that many cards." if cards.length > @current_hand.length
    cards.each {|card| @current_hand.delete(card) }
    end

  def find_strongest_combo
    highest_val = 0
    HAND_STRENGTH.each do |k, v|
      test_hand = self.send k
      if test_hand == []
        next
      elsif v > highest_val
        highest_val = v
        @winning_hand = test_hand
        @winning_hand_type = k
      end
    end
    @winning_hand_type
  end

  def straight_flush?
    (flush? == straight?) ? @current_hand : []
  end

  def four_of_a_kind?
    four_kind = []
    @current_hand.each do |card|
      four_kind << card if @current_hand.count(card.value) == 4
    end
    four_kind.length == 4 ? four_kind : []
  end

  def full_house?
    trio = three_of_a_kind?
    duo = one_pair?
    if trio != [] && duo != []
      trio+duo
    else
      []
    end
  end

  def flush?
    suits = @current_hand.map{|x|x.suit}
    suits.uniq.length == 1 ? @current_hand : []
  end

  def straight?
    card_values = @current_hand.map{|x|x.value}.sort
    straight = true
    card_values.each_with_index do |el,index|
      unless index == card_values.length
        straight = straight && card_values[index]+1 == card_values[index+1]
      end
    end
    straight ? @current_hand : []
  end

  def three_of_a_kind?
    trio = []
    @current_hand.each do |card|
      trio << card if @current_hand.count(card.value) == 3
    end
    trio
  end

  def two_pair?
    pair = []
    @current_hand.each do |card|
      pair << card if @current_hand.count(card.value) == 2
    end
    pair.length == 4 ? pair : []
  end

  def one_pair?
    pair = []
    @current_hand.each do |card|
      pair << card if @current_hand.count(card.value) == 2
    end
    pair.length == 2 ? pair : []
  end

  def high_card?
    @current_hand.max_by{ |card| card.value }
  end
end
