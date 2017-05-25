require "./lib/pieces/move_rook.rb"
require "./lib/board.rb"
require "./lib/pieces/pieces.rb"

describe "MoveRook" do

  include Pieces

  let(:board) {Board.new(8,8)}
  let(:move_rook) {MoveRook.new(board)}
  let(:pieces) {
    {
      white_rook: create_piece(:rook,"white"),
      black_rook: create_piece(:rook,"black"),
      white_pawn: create_piece(:pawn,"white")
    }
  }

  describe '#new' do

    it "creates a new instance of MoveRook" do
      expect(move_rook).to be_instance_of(MoveRook)
    end

  end

  describe '#move' do

    before(:example) do
      board.fill_square("Rd5",pieces[:white_rook])
    end

    context "when is a valid ordinary move" do

      it "moves the rook piece to the destiny given position" do
        expect(move_rook.move(board.value_from("Rd5"),"Rd5","Rd6")).to eq(true)
        expect(board.value_from("Rd5")).to be_nil
        expect(board.value_from("Rd6")).to_not be_nil
      end

    end

    context "when is a valid capture move" do

      it "allows the rook piece to capture the opponent piece" do
        board.fill_square("Rd6",pieces[:black_rook])
        expect(move_rook.move(board.value_from("Rd5"),"Rd5","Rd6")).to eq(true)
        expect(board.value_from("Rd5")).to be_nil
        expect(board.value_from("Rd6")).to eq(pieces[:white_rook])
      end

    end

    context "when is an invalid ordinary move" do

      context "when the destiny position has an ally piece" do

        it "doesn't allows the moves the rook piece to the destiny position" do
          board.fill_square("Rd6",pieces[:white_pawn])
          expect(move_rook.move(board.value_from("Rd5"),"Rd5","Rd6")).to eq(false)
          expect(board.value_from("Rd5")).to eq(pieces[:white_rook])
          expect(board.value_from("Rd6")).to eq(pieces[:white_pawn])
        end

      end

      context "when is not possible move" do

        it "doesn't allows the moves the rook piece to the destiny position" do
          expect(move_rook.move(board.value_from("Rd5"),"Rd5","Rc6")).to eq(false)
        end

      end

      context "when there is an piece between the origin and destiiny positions" do

        it "doesn't allows the moves the rook piece to the destiny position" do
          board.fill_square("Pd7",pieces[:white_pawn])
          board.fill_square("Pd4",nil)
          board.fill_square("Pd3",nil)
          board.fill_square("Pd2",pieces[:white_pawn])
          board.fill_square("Pd1",nil)
          expect(move_rook.move(board.value_from("Rd5"),"Rd5","Rd8")).to eq(false)
          expect(move_rook.move(board.value_from("Rd5"),"Rd5","Rd1")).to eq(false)
        end

      end

    end

  end

end