initial = "Kf5"

new_position = "Kf6"

move_x  = ("a".."h").to_a
move_y  = (1..8).to_a
move_dxy = [[-1,-1],[1,1],[-1,1],[1,-1]]


file_moves = move_x.collect {|x| "K"+x+initial[2].to_s}
rank_moves = move_y.collect {|y| "K"+initial[1]+y.to_s}
diagonal_moves = move_dxy.collect {|xy| "K"+(initial[1].ord + xy[0]).chr + (initial[2].to_i + xy[1]).to_s}



puts "File moves = #{file_moves}"
puts "Rank moves = #{rank_moves}"
puts "Diagonal moves = #{diagonal_moves}"

def castling_move?(position)
  (@current_position == "Ke1") && (position[1].ord - @current_position[1].ord) == 2 &&
    (position[2].to_i - @current_position[2].to_i == 0)
end
