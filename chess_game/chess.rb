require "./lib/game.rb"
require "./lib/piece"
require "./lib/pawn"
require "./lib/rook"
require "./lib/bishop"
require "./lib/queen"
require "./lib/knight"
require "./lib/king"
require "./lib/chess_game"
require "./lib/move_piece"
require "./lib/move_pawn"
require "./lib/move_rook"
require "./lib/move_bishop"
require "./lib/move_knight"
require "./lib/move_queen"
require "./lib/move_king"
require './lib/board'
require "./lib/player"
require './lib/game_status'
require "./lib/modules/directions"
require "./lib/modules/mapper"
require "./lib/modules/coordenates"
require "./lib/modules/distance"
require "colorize"
require "yaml"
include Mapper
include Coordenates

chess_game = ChessGame.new
chess_game.start
