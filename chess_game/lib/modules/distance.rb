module Distance

  def file_distance(from,to)
    origin  = from[0].ord
    destiny = to[0].ord
    (destiny > origin) ? (destiny - origin) : (origin - destiny)
  end

  def rank_distance(from,to)
    origin = from[1].to_i
    destiny = to[1].to_i
    (destiny > origin) ? (destiny - origin) : (origin - destiny)
  end

  def calc_distance(from,to)
    (to[1] != from[1]) ? to[1].to_i - from[1].to_i : to[0].ord - from[0].ord
  end

  def distance_between(from,to)
    [to[0].ord - from[0].ord,from[1].to_i - to[1].to_i]
  end


end
