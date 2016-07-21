require 'rspec'
require 'player'

describe Player do
  let(:game){double("Game")}

  it "should initialize with a name and a game" do
    expect do
    test = Player.new("Julia",game)
    expect(test.name).to eq("Julia")
    end.to_not raise_error
  end

  it "should initialize with a hand of cards" do
    test = Player.new("Julia",game)
    expect(test.hand.class).to eq(Hand)
  end
end

describe "Player#accept_cards" do
  let(:game){double("Game")}
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



  it "should be able to accept anywhere between 1 and 5 cards"do
    expect do
    test = Player.new("Julia",game)
    test.add_card([s2,s3,h4,c3,sk])
    end.to_not raise_error

    expect do
      test = Player.new("Julia",game)
      test.add_card([s2,s3,h4,c3,sk, d4])
    end.to raise_error "Your hand is full."
  end

  it "should add new cards to the hand" do
    test = Player.new("Julia",game)
    test.add_card([s2,sk])
    expect(test.hand.current_hand).to eq([s2,sk])
  end

end

describe "Player#discard" do
  let(:game){double("Game")}
  let(:c4) {double("card", :suit => :clubs, :value => 4)}
  let(:d4) {double("card", :suit => :diamonds, :value => 4)}
  let(:c3) {double("card", :suit => :clubs, :value => 3)}

  it "should have a method of removing cards from the hand" do
    test = Player.new("Julia",game)
    test.add_card([c4,d4,c3])
    test.discard([c4])
    expect(test.hand.current_hand).to eq([d4,c3])
  end

  it "should not do anything if user discards a card not in the hand" do
    test = Player.new("Julia",game)
    test.add_card([d4,c3])
    test.discard([c4])
    expect(test.hand.current_hand).to eq([d4,c3])
  end
end

describe "Player fold" do
  let(:game){double("Game",:fold => true)}
  let(:c4) {double("card", :suit => :clubs, :value => 4)}
  let(:d4) {double("card", :suit => :diamonds, :value => 4)}
  let(:c3) {double("card", :suit => :clubs, :value => 3)}

  it "should have a method of folding" do
    test = Player.new("Julia",game)
    test.add_card([c4,d4,c3])
    test.fold
    expect(test.hand.current_hand).to eq([])
    expect(game).to receive(:fold).with(test)
  end

  it "should push itself as an argument to the game class"

end
#
#   it "should be able to make a bet"
#
#   it "should be able to raise the best"
#
#   it "should be able to discard"
#
#   it "should be able to fold"
# #
# end
