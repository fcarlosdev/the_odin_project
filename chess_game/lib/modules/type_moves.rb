module TypeMoves

  def forward_move?(from,to)
    (from[0] == to[0] && from[1] != to[1])
  end

  def diagonal_move?(from,to)
    (from[0] != to[0] && from[1] != to[1])
  end

end
