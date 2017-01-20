require 'game'

describe Game do
  let(:player_1) { double :player1 }
  let(:player_2) { double :player2 }
  subject(:game) { described_class.new(player_1, player_2) }

  describe "upon initialization" do
    it "it starts with two players" do
      expect(game.players).to include(player_1, player_2)
    end

    it 'the turn belongs to the first player' do
      expect(game.turn).to eq player_1
    end
  end

  describe '#attack' do
    it "hits opponent" do
      allow(game).to receive(:random_damage).and_return(30)
      expect(player_2).to receive(:receive_damage).with(30)
      game.attack(player_2)
    end
  end

  describe '#switch_turn' do
    it "switches the player's turn" do
      game.switch_turn
      expect(game.turn).to eq player_2
    end
  end

  describe '#game_over' do
    context 'when the Player2 hit points equals 0' do
      it "should end the game" do
        allow(player_2).to receive(:knocked_out?).and_return(true)
        allow(player_1).to receive(:knocked_out?).and_return(false)
        game.game_over?
      end
    end
  end

end
