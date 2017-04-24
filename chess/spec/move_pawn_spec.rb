require "./move_pawn.rb"
require "./board.rb"
require "./modules/pieces.rb"

describe "MovePawn" do

  include Pieces

  let(:board) {Board.new(8,8)}
  let(:move_pawn) {MovePawn.new(board)}
  let(:pieces) {
    {
      white_pawn: board.get_piece("Pa2"),
      black_pawn: get_piece(:black_pawn)
    }
  }

  describe '#new' do
    it "creates a new move pawn instance of MovePawn class" do
      expect(move_pawn).to be_instance_of(MovePawn)
    end
  end

  describe '#move' do

    context "when is valid move" do

      context "when is only a move to other position" do

        it "moves the piece from one square to another" do
          expect(move_pawn.move(board.get_piece("Pa2"),"Pa2","Pa3")).to eq(true)
          expect(board.get_piece("Pa2")).to be_nil
        end

      end

      context "when is a capture move" do

        it "captures the opponent piece" do
          board.update_square("Pb3",get_piece(:black_pawn))
          expect(move_pawn.move(pieces[:white_pawn],"Pa2","Pb3")).to eq(true)
          expect(board.get_piece("Pb3")).to eq(pieces[:white_pawn])
        end

      end

    end

    context "when is an invalid move" do

      context "when is not a capture move and the destiny position is occupied" do

        it "doesn't moves the piece to the destiny position" do
          board.update_square("Pa3",get_piece(:black_pawn))
          expect(move_pawn.move(board.get_piece("Pa2"),"Pa2","Pa3")).to eq(false)
          expect(board.get_piece("Pa2")).to_not be_nil
        end

      end

      context "when is a capture move and there is no opponent piece on capture position" do

        it "doesn't executes the capture move" do
          expect(move_pawn.move(board.get_piece("Pa2"),"Pa2","Pb3")).to eq(false)
          expect(board.get_piece("Pa2")).to_not be_nil
        end

      end

    end

    context "when is possible an enpassant move" do

      before (:example) do
        board.update_square("Pf5",get_piece(:white_pawn))
        move_pawn.move(board.get_piece("Pg7"),"Pg7","Pg5")
      end

      context "when is the next move after el_passant is possible" do
        it "allows the capture of the opponent pawn" do
          expect(move_pawn.move(board.get_piece("Pf5"),"Pf5","Pg6")).to eq(true)
        end
      end

      context "when is not the next move after el_passant is possible" do
        it "doesn't allows the capture of the opponent pawn" do
          move_pawn.move(board.get_piece("Pa2"),"Pa2","Pa3")
          expect(move_pawn.move(board.get_piece("Pf5"),"Pf5","Pg6")).to eq(false)
        end
      end

    end


  end
end
