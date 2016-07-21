require 'rspec'
require 'player'

describe Player do

  it "should initialize with a name" do
    expect do
    test = Player.new("Julia")
    expect(test.name).to eq("Julia")
  end.to_not raise_error
  end

  it "should accept a hand of cards"

  it "should be able to receive cards"

  it "should be able to make a bet"

  it "should be able to raise the best"

  it "should be able to discard"

  it "should be able to fold"

end
