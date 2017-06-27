require "pawn_new"
require "board_new"

describe "Pawn_New" do

  let(:board) {Board_New.new}
  let(:piece) { Pawn_New.new(:white,"b2") }
  let(:moves){ ["a3", "b3", "c3"] }

  describe '#new' do
    it "creates a new instance of Pawn class" do
      expect(Pawn_New.new(:white,"b2")).to be_instance_of(Pawn_New)
    end
  end

  describe '#possible_moves' do
    it "returns the possible moves that the pawn piece can do" do
      expect(piece.possible_moves).to eq(moves)
    end
  end

  describe '#possible_move' do
    it "confirms that the given position is a valid move" do
      expect(piece.possible_move?(moves[1])).to eq(true)
    end
  end


end
