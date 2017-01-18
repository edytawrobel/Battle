require 'player'

describe Player do
  subject(:player_1) { described_class.new("Obama") }
  subject(:player_2) { described_class.new("Anna") }

  describe '#name' do
    it "returns players' names" do
      expect(player_1.name).to eq("Obama")
      expect(player_2.name).to eq("Anna")
    end
  end

  describe '#hit_points' do
    it "begins with constant-defined value" do
      expect(player_1.hit_points).to eq(described_class::HIT_POINTS)
    end
  end

  describe '#attack' do
    it "hits opponent" do
      expect(player_2).to receive(:receive_damage)
      player_1.attack(player_2)
    end
  end

  describe '#receive_damage' do
    it "reduces score when attacked by opponent" do
      expect { player_1.attack(player_2) }.to change { player_2.hit_points }.by(-10)
    end
  end

end
