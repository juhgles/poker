require 'rspec'
require 'card'

describe Card do
  let(:threeofclubs){Card.new(3,:clubs)}

  it "should have a card value" do
    expect(threeofclubs.value).to eq(3)
  end

  it "should have a suit" do
    expect(threeofclubs.suit).to eq(:clubs)
  end

  it "should take two arguments to initialize" do
    expect{Card.new("arg1","arg2")}.to_not raise_error
  end

  it "should set it's own values upon initialization" do
    card = Card.new("arg1","arg2")
    expect(card.value).to eq("arg1")
    expect(card.suit).to eq("arg2")
  end

end
