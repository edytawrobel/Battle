class Game

  attr_reader :players

  def initialize(*players)
    @players = players
  end

  def attack(player)
    player.receive_damage
  end

end
