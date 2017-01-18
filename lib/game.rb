class Game

  attr_reader :players, :turn

  def initialize(*players)
    @players = players
    @k = 0
    @turn = @k % 2
  end

  def attack(player)
    player.receive_damage
  end

  def switch_turn
    @k += 1
    @turn = @k % 2
  end

end
