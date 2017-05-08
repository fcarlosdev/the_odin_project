require "./lib/pieces/move.rb"
require "./lib/board.rb"
require "./lib/pieces/pieces.rb"

describe "MovePiece" do

  include Pieces

  let(:board) {Board.new(8,8)}
  let(:move) {Move.new(board)}
  let(:pieces) {
    {
      white_pawn: create_piece(:pawn,"white"),
      black_pawn: create_piece(:pawn,"black"),
      white_rook: create_piece(:rook,"white")
    }
  }

  describe '#new' do
    it "create a new move instance of class Move" do
      expect(move).to be_instance_of(Move)
    end
  end

  describe '#update_position_of' do
    it "updates the givens positions on the board" do
      move.update_position_of(pieces[:white_pawn],"Pa2","Pa3")
      expect(board.value_from("Pa2")).to be_nil
      expect(board.value_from("Pa3")).to_not be_nil
    end
  end

  describe '#empty_square?' do

    it "returns true when the square is empty" do
      expect(move.empty_square?("Pa3")).to eq(true)
    end

    it "returns false when the square is not empty" do
      expect(move.empty_square?("Pa2")).to eq(false)
    end
  end

  describe '#opponent_of?' do

    it "returns true when is an opponent piece from current piece" do
      board.fill_square("Pa3",pieces[:black_pawn])
      expect(move.opponent_of?(pieces[:white_pawn],"Pa3")).to eq(true)
    end

    it "returns false when is not an opponent piece from current piece" do
      board.fill_square("Pa3",pieces[:white_rook])
      expect(move.opponent_of?(pieces[:white_pawn],"Pa3")).to eq(false)
    end

  end


end
