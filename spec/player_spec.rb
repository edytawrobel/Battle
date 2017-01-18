require 'player'

describe Player do
  let(:name) { "Obama" }
  subject(:player) { described_class.new(name) }


  it "returns player's name" do
    expect(player.name).to eq(name)
  end
end
