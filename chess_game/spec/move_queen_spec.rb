require "./lib/pieces/move_queen.rb"
require "./lib/board.rb"
require "./lib/pieces/pieces.rb"

describe "MoveQueen" do

  include Pieces

  let(:board) {Board.new(8,8)}
  let(:move_queen) {MoveQueen.new(board)}
  let(:pieces) {
    {
      white_queen: create_piece(:queen,"white"),
      black_queen: create_piece(:queen,"black"),
      white_pawn: create_piece(:pawn,"white")
    }
  }

  describe '#new' do
    it "creates a new instance of MoveQueen" do
      expect(move_queen).to be_instance_of(MoveQueen)
    end
  end

  describe '#move' do

    before (:example) do
      board.fill_square("Qd4",pieces[:white_queen])
    end

    context "when is a valid ordinary move" do
      it "moves the queen piece to the destiny position" do
        expect(move_queen.move(pieces[:white_queen],"Qd4","Qf6")).to eq(true)
        expect(board.value_from("Qd4")).to be_nil
        expect(board.value_from("Qf6")).to_not be_nil
        expect(board.value_from("Qf6")).to eq(pieces[:white_queen])
        expect(board.value_from("Qf6").current_position).to eq("Qf6")
      end
    end

    context "when is a valid capture move" do
      it "allows the queen piece to capture the opponent piece" do
        board.fill_square("Qf6",pieces[:black_queen])
        expect(move_queen.move(pieces[:white_queen],"Qd4","Qf6")).to eq(true)
        expect(board.value_from("Qd4")).to be_nil
        expect(board.value_from("Qf6")).to_not be_nil
        expect(board.value_from("Qf6")).to eq(pieces[:white_queen])
      end
    end

    context "when is an invalid ordinary move" do
      it "doesn't moves the queen piece to the destiny position" do
        expect(move_queen.move(pieces[:white_queen],"Qd4","Qe6")).to eq(false)
        expect(board.value_from("Qd4")).to_not be_nil
        expect(board.value_from("Qe6")).to be_nil
      end
    end

    context "when is an invalid capture move" do
      it "doesn't allows the queen piece to capture the opponent piece" do
        board.fill_square("Qf6",pieces[:white_pawn])
        expect(move_queen.move(pieces[:white_queen],"Qd4","Qf6")).to eq(false)
        expect(board.value_from("Qd4")).to eq(pieces[:white_queen])
        expect(board.value_from("Qf6")).to eq(pieces[:white_pawn])
      end
    end

    context "when there is an piece between the origin and destiny positions" do
      it "doesn't allows the moves the queen piece to the destiny position" do
        board.fill_square("Qd6",pieces[:white_pawn])
        expect(move_queen.move(board.value_from("Qd4"),"Qd4","Qd7")).to eq(false)
      end
    end

  end

end