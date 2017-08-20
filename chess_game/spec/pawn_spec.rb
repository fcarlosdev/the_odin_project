require "pawn"
require "board"

describe "Pawn" do

  let(:board) {Board.new}
  let(:piece) { Pawn.new(:white,"b2") }
  let(:moves){ ["a3", "b3", "c3", "b4"] }
  let(:white_pieces) {
    {pawn:Pawn.new(:white, "b2")}
  }
  let(:black_pieces) {
    {pawn:Pawn.new(:black, "c3"),
     pawn2:Pawn.new(:black, "b7") }
  }

  describe '#new' do
    it "creates a new instance of Pawn class" do
      expect(Pawn.new(:white,"b2")).to be_instance_of(Pawn)
    end
  end

  describe '#possible_moves' do
    it "returns the possible moves that the pawn piece can do" do
      expect(piece.possible_moves).to eq(moves)
    end
  end

  describe '#possible_move' do
    context "when move only one position" do
      it "confirms that the given position is a valid move" do
        expect(piece.possible_move?("b3")).to eq(true)
      end
    end

    context "when is the first move and move two positions" do
      it "confirms that the given position is a valid move" do
        expect(piece.possible_move?("b4")).to eq(true)
      end
    end
  end

  describe '#move' do

    context "when is a valid forward move" do
      it "moves to the new position" do
        expect(piece.move("b3",board)).to eq(true)
        expect(piece.position).to eq("b3")
      end
    end

    context "when is a valid capture move" do
      it "allows the pawn piece to capture the enemy piece" do
        board.fill_square("c3",black_pieces[:pawn])
        expect(piece.move("c3",board)).to eq(true)
        expect(board.value_from("c3")).to eq(piece)
      end
    end

    context "when is a valid en passant move" do
      it "allows the pawn piece to make the en passant move" do
        white_pieces[:pawn].position = "a5"
        black_pieces[:pawn2].position = "b5"
        white_pieces[:pawn].en_passant_allowed(true)
        board.fill_square("b5",black_pieces[:pawn2])
        board.fill_square("a5",white_pieces[:pawn])
        expect(white_pieces[:pawn].move("b6",board)).to eq(true)
        expect(board.value_from("b6")).to eq(white_pieces[:pawn])
        expect(board.value_from("a5")).to be_nil
      end
    end

  end

end
