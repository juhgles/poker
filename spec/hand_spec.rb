require 'rspec'
require 'hand'

describe Hand do
  let(:empty_hand) {Hand.new}
  let(:s2) {double("card", :suit => :spades, :value => 2)}
  let(:s3) {double("card", :suit => :spades, :value => 3)}
  let(:s4) {double("card", :suit => :spades, :value => 4)}
  let(:s5) {double("card", :suit => :spades, :value => 5)}
  let(:s6) {double("card", :suit => :spades, :value => 6)}
  let(:sk) {double("card", :suit => :spades, :value => 13)}
  let(:h4) {double("card", :suit => :hearts, :value => 4)}
  let(:c4) {double("card", :suit => :clubs, :value => 4)}
  let(:d4) {double("card", :suit => :diamonds, :value => 4)}
  let(:c3) {double("card", :suit => :clubs, :value => 3)}

  let(:hand_pair) do hand = Hand.new
    hand.add_card(c4,d4,s3,s2,s6)
    hand
  end

  let(:two_pair) do hand = Hand.new
    hand.add_card(c4,d4,s3,c3,sk)
    hand
  end

  let(:three_of_a_kind) do hand = Hand.new
    hand.add_card(c4,d4,h4,c3,sk)
    hand
  end

  let(:straight) do hand = Hand.new
    hand.add_card(s2,s3,c4,s5,s6)
    hand
  end

  let(:flush) do hand = Hand.new
    hand.add_card(s2,s3,s4,s5,sk)
    hand
  end

  let(:full_house) do hand = Hand.new
    hand.add_card(c4,d4,h4,c3,s3)
    hand
  end

  let(:four_of_a_kind) do hand = Hand.new
    hand.add_card(c4,d4,h4,s4,s3)
    hand
  end

  let(:straight_flush) do hand = Hand.new
    hand.add_card(s2,s3,s4,s5,s6)
    hand
  end

  it "should initialize with an empty hand" do
    expect(empty_hand.current_hand).to eq []
  end

  it "should not accept more than 5 cards" do
    expect{hand_pair.add_card(s2)}.to raise_error("Your hand is full.")
  end

  it "should be able to discard up to 5 cards" do
    hand_pair.discard(c4,d4,s3,s2,s6)
    expect(hand_pair.current_hand.empty?).to be true
  end

  it "should raise error if you try to discard more cards than are in your hand" do
    expect{empty_hand.discard(c4,d4,s3,s2,s6)}.to raise_error("You don't have that many cards.")
  end

  it "should be able to find a straight flush" do

  end

  it "should be able to find a higher straight flush"

  it "should not mix up a straight flush with a straight"

  it "should not mix up a straight flush with a flush"

  it "should be able to find a four of a kind"

  it "should be able to find a higher four of a kind"

  it "should not mix up a four of a kind with two pairs"

  it "should not mix up a four of a kind with a pair"

  it "should be able to find a full house"

  it "should be able to find a higher full house"

  it "should not mix up a full house with a three of a kind"

  it "should not mix up a full house with a pairs"

  it "should be able to find a flush"

  it "should be able to find a straight"

  it "should be able to find a three of a kind"

  it "should be able to find two pairs"

  it "should be able to find one pair" do
    expect(hand_pair.find_strongest_combo).to eq(:one_pair?)
  end

  it "should find the highest card"

end
