require 'rspec'
require 'deck'

describe Deck do
  subject(:newdeck){Deck.new}
  
  it "should contain 52 cards upon initialization" do
    expect(newdeck.stack.length).to eq 52
  end

  it "should contain 4 cards with values 1 through 13" do
    values = Hash.new(0)
    newdeck.stack.each do |card|
      values[card.value] += 1
    end
    uniq_values = values.values.uniq
    card_values = (uniq_values.length == 1 && uniq_values.first == 4)
    expect(card_values).to be true
  end

  it "should contain 13 cards with suits of clubs, diamonds, hearts, spades" do
    suits = Hash.new(0)
    newdeck.stack.each do |card|
      suits[card.suit] += 1
    end
    uniq_suits = suits.values.uniq
    card_suits = (uniq_suits.length == 1 && uniq_suits.first == 13)
    expect(card_suits).to be true
  end

  it "should have 52 unique cards" do
    expect(newdeck.stack.uniq.length).to eq 52
  end

  it "should be able to shuffle itself" do
    unshuffled = newdeck.stack.dup
    expect(newdeck.shuffle).to_not eq unshuffled
  end

  it "should pass one card by default" do
    newdeck.shuffle
    cards = newdeck.get_cards
    expect(cards.length).to eq 1
    expect(cards.first.class).to eq Card
  end

  it "should remove the card from the stack if it is passed" do
    newdeck.shuffle
    cards = newdeck.get_cards
    expect(newdeck.stack.include?(cards.first)).to eq false
  end

  it "should be able to pass multiple cards and remove them from the stack" do
    newdeck.shuffle
    cards = newdeck.get_cards(5)
    expect(cards.length).to eq 5
  end
end
