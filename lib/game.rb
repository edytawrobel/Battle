class Game

  attr_reader :players, :turn

  def initialize(*players)
    @players = players
    @turn = players[0]
  end

  def attack(player)
    player.receive_damage
  end

  def switch_turn
    @turn = opponent_of(turn)
  end

  private

  def opponent_of(the_player)
    @players.find { |player| player != the_player}
  end
end
