class Directions_New

  @@north     = [-1 , 0]
  @@south     = [ 1 , 0]
  @@west      = [ 0 ,-1]
  @@east      = [ 0 , 1]
  @@northeast = [-1 , 1]
  @@southeast = [ 1 , 1]
  @@southwest = [ 1 ,-1]
  @@northwest = [-1 ,-1]
  @@nne       = [-1, -2]
  @@nnw       = [ 1, -2]
  @@ene       = [-2, -1]
  @@ese       = [-2,  1]
  @@sse       = [-1,  2]
  @@ssw       = [ 1,  2]
  @@wsw       = [ 2,  1]
  @@wnw       = [ 2, -1]

  def self.generate_coordinates(from,max,axis)
    remove_invalid((0..max).map{|i| [(i*axis[0])+from[0], (i*axis[1])+from[1]]})
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
    [@@northeast, @@southeast, @@southwest, @@northwest]
  end

  def self.cardinal_and_ordinal
   cardinal + intercardinal
  end

  def self.north
    @@north
  end

  def self.south
    @@south
  end

  def self.west
    @@west
  end

  def self.east
    @@east
  end

  def self.northeast
    @@northeast
  end

  def self.southeast
    @@southeast
  end

  def self.southwest
    @@southwest
  end

  def self.northwest
    @@northwest
  end

  def self.nne
    @@nne
  end

  def self.nnw
    @@nnw
  end

  def self.ene
    @@ene
  end

  def self.ese
    @@ese
  end

  def self.sse
    @@sse
  end

  def self.ssw
    @@ssw
  end

  def self.wsw
    @@wsw
  end

  def self.wnw
    @@wnw
  end


  private

  def self.remove_invalid(coordinates)
    coordinates.select{|c| inside_limits?(c[0]) && inside_limits?(c[1])}
  end

  def self.inside_limits?(value)
    (0..7).include?(value)
  end


end
