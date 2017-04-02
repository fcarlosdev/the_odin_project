module DistanceCalculator

  def file_distance(from,to)
    (to[1].ord - from[1].ord)
  end

  def rank_distance(from,to)
    (to[2].to_i - from[2].to_i)
  end

end
