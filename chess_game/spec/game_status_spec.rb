require './lib/game_status'
require './lib/board'
require './lib/player'
require './lib/move_piece'
require './lib/move_pawn'
require './lib/move_bishop'
require './lib/move_king'
require './lib/move_queen'
require './lib/move_rook'
require './lib/move_knight'

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
      clear_board
      white_pieces[:pawn].position = "e2"
      black_pieces[:queen].position = "e4"

      board.fill_square("e1",white_pieces[:king])
      board.fill_square("e2",white_pieces[:pawn])
      board.fill_square("e4",black_pieces[:queen])
      expect(game_status.check?(players[0])).to eq(false)
    end
  end

  describe '#checkmate?' do

    context "when a player is in check and has no legal escape move" do
      it "returns true" do
        board.move_piece(board.value_from("f2"),"f3")
        board.move_piece(board.value_from("g2"),"g4")
        board.move_piece(board.value_from("f7"),"f5")
        board.move_piece(board.value_from("d8"),"h4")
        expect(game_status.checkmate?(players[0])).to eq(true)
      end
    end

    context "when a player is in check and has a legal escape move" do
      it "returns false" do
        board.move_piece(board.value_from("f2"),"f3")
        board.move_piece(board.value_from("g2"),"g4")
        board.move_piece(board.value_from("f7"),"f5")
        board.move_piece(board.value_from("e2"),"e3")
        board.move_piece(board.value_from("d8"),"h4")
        expect(game_status.checkmate?(players[0])).to eq(false)
      end
    end

  end

  describe '#stalemate' do

    context "when a palyer is no in check but has no legal escape move" do
      it "indicates that a stalemate situation occurred" do
        clear_board
        black_pieces[:king].position = "h8"
        white_pieces[:king].position = "f7"
        white_pieces[:queen].position = "g6"

        board.fill_square("h8",black_pieces[:king])
        board.fill_square("f7",white_pieces[:king])
        board.fill_square("g6",white_pieces[:queen])

        expect(game_status.stalemate?(players[1])).to eq(true)
      end
    end

    context "when a palyer is no in check but has a legal escape move" do
      it "doesn't indicates that a stalemate situation occurred" do
        clear_board
        black_pieces[:king].position = "e8"
        white_pieces[:king].position = "f7"
        white_pieces[:queen].position = "g6"

        board.fill_square("e8",black_pieces[:king])
        board.fill_square("f7",white_pieces[:king])
        board.fill_square("g6",white_pieces[:queen])

        expect(game_status.stalemate?(players[1])).to eq(false)
      end
    end

  end

end
