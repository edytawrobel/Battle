class Player
  HIT_POINTS = 100
  attr_reader :name, :hit_points

  def initialize(name, hit_points = HIT_POINTS)
    @name = name
    @hit_points = hit_points
  end

  def receive_damage
    @hit_points -= 10
  end

end
