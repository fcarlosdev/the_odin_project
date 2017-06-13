require 'board_new'
require 'colorize'
require 'piece_new'
require 'player'

describe Board_New do

  let(:board) {Board_New.new}

  let(:white_pieces) {
    { pawn: Piece_New.create_piece(:pawn,:white,"a2"),
      rook: Piece_New.create_piece(:rook,:white,"a1"),
      bishop: Piece_New.create_piece(:bishop,:white,"c1"),
      queen: Piece_New.create_piece(:queen,:white,"d1"),
      knight: Piece_New.create_piece(:knight,:white,"b1"),
      king: Piece_New.create_piece(:king,:white,"e1")
    }
  }

  let(:black_pieces) {
    { pawn: Piece_New.create_piece(:pawn,:black,"a7"),
      rook: Piece_New.create_piece(:rook,:black,"a8"),
      bishop: Piece_New.create_piece(:bishop,:black,"c8"),
      queen: Piece_New.create_piece(:queen,:black,"d8"),
      knight: Piece_New.create_piece(:knight,:black,"b8"),
      king: Piece_New.create_piece(:king,:black,"e8")
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
    it "Creates a new board" do
      expect(board).to be_instance_of(Board_New)
    end
  end

  describe '#draw_board' do
    it "Draws a board" do
      lines = columns = 8
      expect(board).to receive(:draw_board).with(no_args).exactly(1).times
      expect(board.squares[1][0].type).to eq(:pawn)
      board.draw_board
    end
  end

  describe '#value_from' do

    context "when is given a valid location" do
      it "returns the piece on square" do
        expect(board.value_from("a2")).to_not be_nil
      end
    end

    context "when is given an invalid position" do
      it "returns nil" do
        expect(board.value_from("l2")).to be_nil
      end
    end
  end

  describe '#fill_square' do
    it "changes the value of a square" do
      board.fill_square("b3",Piece_New.create_piece(:pawn,:white,"b3"))
      expect(board.value_from("b3")).to_not be_nil
    end
  end

  describe '#move_piece' do
    context "when is a valid move" do
      it "moves the piece to the new place" do
        board.move_piece(white_pieces[:pawn],"a3")
        expect(board.value_from("a2")).to be_nil
        expect(board.value_from("a3")).to_not be_nil
      end
    end
  end

  describe '#empty_square?' do

    context "when is an empty square" do
      it "returns true" do
        expect(board.empty_square?("a3")).to eq(true)
      end
    end

    context "when is not an empty square" do
      it "returns false" do
        expect(board.empty_square?("a2")).to eq(false)
      end
    end
  end

end
