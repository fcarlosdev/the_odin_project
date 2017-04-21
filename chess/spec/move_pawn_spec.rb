require "./move_pawn.rb"
require "./board.rb"
require "./modules/pieces.rb"

describe "MovePawn" do

  include Pieces

  let(:board) {Board.new(8,8)}
  let(:move_pawn) {MovePawn.new(board)}
  let(:positions) {
    ["Pa2","Pa3", "Pb3"]
  }
  let(:pieces) {
    {
      white_pawn: board.get_piece(positions[0]),
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
          expect(move_pawn.move(board.get_piece(positions[0]),positions[0],positions[1])).to eq(true)
          expect(board.get_piece(positions[0])).to be_nil
        end

      end

      context "when is a capture move" do

        it "captures the opponent piece" do
          board.update_square(positions[2],get_piece(:black_pawn))
          expect(move_pawn.move(pieces[:white_pawn],positions[0],positions[2])).to eq(true)
          expect(board.get_piece(positions[2])).to eq(pieces[:white_pawn])
        end

      end

    end

    context "when is an invalid move" do

      context "when is not a capture move and the destiny position is occupied" do

        it "doesn't moves the piece to the destiny position" do
          board.update_square(positions[1],get_piece(:black_pawn))
          expect(move_pawn.move(board.get_piece(positions[0]),positions[0],positions[1])).to eq(false)
          expect(board.get_piece(positions[0])).to_not be_nil
        end

      end

      context "when is a capture move and there is no opponent piece on capture position" do

        it "doesn't executes the capture move" do
          expect(move_pawn.move(board.get_piece(positions[0]),positions[0],positions[2])).to eq(false)
          expect(board.get_piece(positions[0])).to_not be_nil
        end

      end
    end

  end
end
