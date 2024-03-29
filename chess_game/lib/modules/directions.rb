class Directions

  @@north     = [-1 , 0]
  @@south     = [ 1 , 0]
  @@west      = [ 0 ,-1]
  @@east      = [ 0 , 1]
  @@northeast = [-1 , 1]
  @@southeast = [ 1 , 1]
  @@southwest = [ 1 ,-1]
  @@northwest = [-1 ,-1]
  @@nne       = [-2 , 1]
  @@ene       = [-1 , 2]
  @@ese       = [ 1,  2]
  @@sse       = [ 2,  1]
  @@ssw       = [ 2, -1]
  @@wsw       = [ 1, -2]
  @@wnw       = [-1, -2]
  @@nnw       = [-2, -1]

  def self.generate_coordinates(from,max,axis)
    remove_invalid((1..max).map{|i| [(i*axis[0])+from[0], (i*axis[1])+from[1]]})
  end

  def self.all_directions
    [@@north,     @@south,     @@west,      @@east,
     @@northeast, @@southeast, @@southwest, @@northwest]
  end

  def self.cardinal
    [@@north, @@south, @@west, @@east]
  end

  def self.north_south
    cardinal[0..1]
  end

  def self.east_west
    cardinal[2..3]
  end

  def self.secondary
   [@@nne, @@nnw, @@ene, @@ese, @@sse, @@ssw, @@wsw, @@wnw]
  end

  def self.intercardinal
    [@@northeast, @@northwest, @@southeast, @@southwest]
  end

  def self.cardinal_and_ordinal
   cardinal + intercardinal
  end

  def self.norwesteast
    [choose(:north)] + intercardinal[0..1]
  end

  def self.soutwesteast
    [choose(:south)] + intercardinal[2..3]
  end

  def self.all_diagonals
    [@@southwest,@@northeast,@@northwest,@@southeast]
  end

  def self.main_diagonal
    [@@southwest,@@northeast]
  end

  def self.secondary_diagonal
    [@@northwest,@@southeast]
  end

  def self.choose(direction)
    {north:     @@north,     south:     @@south,     west:      @@west,
     east:      @@east,      northeast: @@northeast, southeast: @@southeast,
     southwest: @@southwest, northwest: @@northwest, nne:       @@nne,
     ene:       @@ene,       ese:       @@ese,       sse:       @@sse,
     ssw:       @@ssw,       wsw:       @@wsw,       wnw:       @@wnw,
     nnw:       @@nnw}[direction]
  end

  private

  def self.remove_invalid(coordinates)
    coordinates.select{|c| inside_limits?(c[0]) && inside_limits?(c[1])}
  end

  def self.inside_limits?(value)
    (0..7).include?(value)
  end


end
