require './lib/game_status.rb'
require './lib/board.rb'
require './lib/move_piece.rb'
require './lib/player.rb'

describe 'GameStatus' do

  let(:board) {Board.new}
  let(:movement) {MovePiece.new(board)}
  let(:game_status) {GameStatus.new(movement,board)}
  let(:players) {[Player.new("Player1",:white),Player.new("Player2",:black)]}
  let(:current_player) {players[1]}

  let(:white_pieces) {
    { pawn: Piece.create_piece(:pawn,:white,"a2"),
      rook: Piece.create_piece(:rook,:white,"a1"),
      bishop: Piece.create_piece(:bishop,:white,"c1"),
      queen: Piece.create_piece(:queen,:white,"d1"),
      knight: Piece.create_piece(:knight,:white,"b1"),
      king: Piece.create_piece(:king,:white,"e1")
    }
  }

  let(:black_pieces) {
    { pawn: Piece.create_piece(:pawn,:black,"a7"),
      rook: Piece.create_piece(:rook,:black,"a8"),
      bishop: Piece.create_piece(:bishop,:black,"c8"),
      queen: Piece.create_piece(:queen,:black,"d8"),
      knight: Piece.create_piece(:knight,:black,"b8"),
      king: Piece.create_piece(:king,:black,"e8")
    }
  }

  def clear_board
    board.squares.each do |square|
      square.each do |value|
        board.fill_square(value.position,nil) if !value.nil?
      end
    end
  end

  describe '#new' do
    it "creates a new instance of GameStatus class" do
      expect(GameStatus.new(movement,board)).to be_instance_of(GameStatus)
    end
  end

  describe '#check?' do
    it "returns true when there is a king piece in check" do
      clear_board
      board.fill_square("e1",white_pieces[:king])
      board.fill_square("e4",black_pieces[:queen])
      black_pieces[:queen].position = "e4"
      expect(game_status.check?(players[0])).to eq(true)
    end

    it "returns false when there is no king piece in check" do
      expect(game_status.check?(players[0])).to eq(false)
    end
  end

  describe '#checkmate?' do

    context "when a player is in check and has no legal escape move of check" do
      it "returns true" do
        board.move_piece(board.value_from("f2"),"f3")
        board.move_piece(board.value_from("g2"),"g4")
        board.move_piece(board.value_from("f7"),"f5")
        board.move_piece(board.value_from("d8"),"h4")
        expect(game_status.checkmate?(players[0])).to eq(true)
      end
    end

  end

end
