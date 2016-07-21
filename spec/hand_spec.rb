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

  it "should be able to find cards in current hand which make a straight flush" do
    expect(straight_flush.straight_flush).to eq([s2,s3,s4,s5,s6])
  end


  it "should be able to find cards in current hand which make a four of a kind" do
    expect(four_of_a_kind.four_of_a_kind).to eq([c4,d4,h4,s4])
  end

  it "should be able to find cards in current hand which make a full house" do
    expect(full_house.full_house).to eq([c4,d4,h4,c3,s3])
  end

  it "should be able to find cards in current hand which make a flush" do
    expect(flush.flush).to eq([s2,s3,s4,s5,sk])
  end

  it "should be able to find cards in current hand which make a straight" do
    expect(straight.straight).to eq([s2,s3,c4,s5,s6])
  end

  it "should be able to find cards in current hand which make a three of a kind" do
    expect(three_of_a_kind.three_of_a_kind).to eq([c4,d4,h4])
  end

  it "should be able to find cards in current hand which make a two pairs" do
    expect(two_pair.two_pair).to eq([c4,d4,s3,c3])
  end

  it "should be able to find cards in current hand which make a one pair" do
    expect(hand_pair.one_pair).to eq([c4,d4])
  end

  it "should be able to find and return the highest card" do
    expect(hand_pair.high_card).to eq([s6])
  end

  it "should not mix up a straight flush with a straight or flush" do
    expect(straight_flush.find_strongest_combo).to eq(:straight_flush)
    expect(straight_flush.winning_hand).to eq([s2,s3,s4,s5,s6])
  end

  it "should not mix up a four of a kind with two pairs"do
    expect(four_of_a_kind.find_strongest_combo).to eq(:four_of_a_kind)
    expect(four_of_a_kind.winning_hand).to eq([c4,d4,h4,s4])
  end

  it "should not mix up a full house with a three of a kind" do
    expect(full_house.find_strongest_combo).to eq(:full_house)
    expect(full_house.winning_hand).to eq([c4,d4,h4,c3,s3])
  end

end
