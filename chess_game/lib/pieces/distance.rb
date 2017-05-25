module Distance

  def file_distance(from,to)
    origin  = from[1].ord
    destiny = to[1].ord
    (destiny > origin) ? (destiny - origin) : (origin - destiny)
  end

  def rank_distance(from,to)
    origin = from[2].to_i
    destiny = to[2].to_i
    (destiny > origin) ? (destiny - origin) : (origin - destiny)
  end

  def calc_distance(from,to)
    (to[2] != from[2]) ? to[2].to_i - from[2].to_i : to[1].ord - from[1].ord
  end

  def distance_between(from,to)
    [to[1].ord - from[1].ord,from[2].to_i - to[2].to_i]
  end

end