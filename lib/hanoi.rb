class TowersOfHanoi

  attr_accessor :towers

  def initialize
    @towers = [[3,2,1],[],[]]
  end

  def move(start_tower,end_tower)
    if @towers[start_tower].empty?
      raise "You must choose a tower with at least one disc"
    end

    if !@towers[end_tower].empty? &&
      @towers[start_tower].last > @towers[end_tower].last
      raise "You can't move a large disc on top of a smaller one"
    end

    @towers[end_tower] << @towers[start_tower].pop
  end

  def won?
    @towers.any? {|tower| tower.length == 3} && @towers[0].empty?
  end
end
