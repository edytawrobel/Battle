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

  def game_over?
    players[0].knocked_out? || players[1].knocked_out?
  end

  def opponent_of(the_player)
    @players.find { |player| player != the_player}
  end


end
