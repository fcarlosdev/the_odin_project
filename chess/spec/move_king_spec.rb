require "./move_king.rb"
require "./board.rb"
require "./modules/pieces.rb"

describe "MoveKing" do

  include Pieces

  let(:board) {Board.new(8,8)}
  let(:move_king) {MoveKing.new(board)}
  let(:pieces) {
    {
      white_king: get_piece(:white_king),
      black_king: get_piece(:black_king),
      white_pawn: get_piece(:white_pawn)
    }
  }

  describe '#new' do
    it "creates a new instance of MoveKing" do
      expect(move_king).to be_instance_of(MoveKing)
    end
  end

  describe '#move' do

    before (:example) do
      board.update_square("Kd4",pieces[:white_king])
    end

    context "when is a valid move" do

       context "when is not a capture move" do

         it "moves the king piece to the given position" do
           expect(move_king.move(pieces[:white_king],"Kd4", "Kd5")).to eq(true)
           expect(board.get_piece("Kd4")).to be_nil
           expect(board.get_piece("Kd5")).to_not be_nil
         end

       end

       context "when is a capture move" do

         it "allows the king piece to captures the opponent piece" do
           board.update_square("Kd5",get_piece(:black_king))
           expect(move_king.move(pieces[:white_king],"Kd4","Kd5")).to eq(true)
         end

       end

    end

    context "when is an invalid move" do

      context "when is a not possible move to the king piece" do
        it "doesn't moves the king piece to the destiny position" do
          expect(move_king.move(board.get_piece("Kd4"),"Kd4","Kd7")).to eq(false)
        end
      end

      context "when there is other piece of the same color on destiny position" do

        it "doesn't moves the king piece to the destiny position" do
          board.update_square("Kd5",pieces[:white_pawn])
          expect(move_king.move(board.get_piece("Kd4"),"Kd4","Kd5")).to eq(false)
          expect(board.get_piece("Kd4")).to eq(pieces[:white_king])
          expect(board.get_piece("Kd5")).to eq(pieces[:white_pawn])
        end

      end

    end

  end

end
