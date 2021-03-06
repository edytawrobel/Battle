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

  describe '#min_hit_points' do
    it "sets the losing threshold" do
      expect(described_class).to be_const_defined(:MIN_POINTS)
    end
  end

  describe '#receive_damage' do
    it {is_expected.to respond_to(:receive_damage).with(1).argument}
    it "reduces score when attacked by opponent" do
      expect { player_2.receive_damage(10) }.to change { player_2.hit_points }.by(-10)
    end
  end

  describe '#knocked_out?' do
    context 'when HIT POINTS equals 0' do
      it "player's knocked out" do
        player_2.receive_damage(100)
        expect(player_2).to be_knocked_out
      end
    end
  end



end
