require "./lib/moves/move_king.rb"
require "./lib/board.rb"
require "./lib/helpers/pieces.rb"

describe "MoveKing" do

  include Pieces

  let(:board) {Board.new(8,8)}
  let(:move_king) {MoveKing.new(board)}
  let(:pieces) {
    {
      white_king: get_piece(:white_king),
      black_king: get_piece(:black_king),
      white_pawn: get_piece(:white_pawn),
      white_rook: get_piece(:white_rook)
    }
  }

  describe '#new' do
    it "creates a new instance of MoveKing" do
      expect(move_king).to be_instance_of(MoveKing)
    end
  end

  describe '#move' do

    before (:example) do
      board.fill_square("Kd4",pieces[:white_king])
    end

    context "when is a valid move" do

       context "when is not a capture move" do

         it "moves the king piece to the given position" do
           expect(move_king.move(pieces[:white_king],"Kd4", "Kd5")).to eq(true)
           expect(board.value_from("Kd4")).to be_nil
           expect(board.value_from("Kd5")).to_not be_nil
         end

       end

       context "when is a capture move" do

         it "allows the king piece to captures the opponent piece" do
           board.fill_square("Kd5",get_piece(:black_king))
           expect(move_king.move(pieces[:white_king],"Kd4","Kd5")).to eq(true)
         end

       end

    end

    context "when is an invalid move" do

      context "when is a not possible move to the king piece" do
        it "doesn't moves the king piece to the destiny position" do
          expect(move_king.move(board.value_from("Kd4"),"Kd4","Kd7")).to eq(false)
        end
      end

      context "when there is other piece of the same color on destiny position" do

        it "doesn't moves the king piece to the destiny position" do
          board.fill_square("Kd5",pieces[:white_pawn])
          expect(move_king.move(board.value_from("Kd4"),"Kd4","Kd5")).to eq(false)
          expect(board.value_from("Kd4")).to eq(pieces[:white_king])
          expect(board.value_from("Kd5")).to eq(pieces[:white_pawn])
        end

      end

    end

    context "when is a valid castling move" do
      it "moves the king pice to the given position" do
        board.fill_square("Kg1",nil)
        board.fill_square("Ke1",pieces[:white_king])
        expect(move_king.move(board.value_from("Ke1"),"Ke1","Kg1")).to eq(true)
        expect(board.value_from("Kg1")).to eq(pieces[:white_king])
        expect(board.value_from("Ke1")).to eq(nil)
        expect(board.value_from("Rh1")).to eq(nil)
        expect(board.value_from("Rf1")).to eq(pieces[:white_rook])
      end
    end

    context "when is an invalid castling move" do
      it "moves the king pice to the given position" do
        board.fill_square("Kg1",nil)
        board.fill_square("Ke1",pieces[:white_king])
        board.fill_square("Rh1",nil)
        expect(move_king.move(board.value_from("Ke1"),"Ke1","Kg1")).to eq(false)
        expect(board.value_from("Kg1")).to be_nil
        expect(board.value_from("Ke1")).to eq(pieces[:white_king])
      end
    end
  end

end
