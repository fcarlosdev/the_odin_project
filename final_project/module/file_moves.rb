module FileMoves

  FACTORS = [-1,1,1,-1]

  def self.get_xy_moves(current_position)
    moves = get_moves(current_position)
    [(moves[0].reverse + moves[1]), (moves[3].reverse + moves[2])]
  end

  private
  def self.get_moves(current_position)
    distances = get_distances(current_position[0],current_position[1])
    4.times.collect do |x|
      start = (x%2 == 0) ? 0 : 1
      generate_moves(current_position[1], current_position[2],
                       start..distances[x],FACTORS[x],x)
    end
  end

  def self.generate_moves(file,rank,range,factor,xy)
    ((0..1).include?xy) ?
            range.collect {|x| (file.ord + (x*factor)).chr+rank.to_s} :
            range.collect {|y| file+(rank.to_i + (y*factor)).to_s}
  end

  def self.get_distances(file,rank)
    [(file.ord - "a".ord), ("h".ord - file.ord), (8 - rank.to_i), (rank.to_i - 1)]
  end

  private_class_method :get_moves
end
