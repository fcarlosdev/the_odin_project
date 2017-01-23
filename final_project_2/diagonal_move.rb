module DiagonalMove

  def moved_only_along_diagonal?(current_position,new_position)
    limit_sup = (8 - current_position[2].to_i)
    limit_inf = (current_position[2].to_i - 1)
    params = [
      [(0..limit_sup),[1,1]],  [(1..limit_inf),[-1,1]],
      [(1..limit_sup),[-1,1]], [(1..limit_inf),[1,-1]]
    ]
    params.any? {|p| diagonals(current_position,p[0],p[1]).include?new_position}
  end

  def diagonals(position,range,factors)
    diagonal = []
    range.each do |i|
      pos = (position[1].ord + (i*factors[0])).chr + (position[2].to_i + (i*factors[1])).to_s
      diagonal << pos if ("a".."h").include?(pos[0])
    end
    diagonal
  end

end
