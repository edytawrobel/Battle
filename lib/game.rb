class Game

  attr_reader :players, :turn

  def self.game_instance
    @game_instance
  end

  def self.game_instance=(value)
    @game_instance = value
  end

  def initialize(*players)
    @players = players
    @turn = players[0]
    self.class.game_instance = self
  end

  def attack(player)
    player.receive_damage(random_damage)
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

  private

  def random_damage
    Kernel.rand(1..40)
  end


end
