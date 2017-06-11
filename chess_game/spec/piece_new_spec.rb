require "pawn_new"
require "rook"
require "bishop"
require "queen"
require "knight"
require "king"
require "board_new"

describe "Piece_New" do

  let(:board) {Board_New.new}
  let(:position) {"b2"}
  let(:piece) {Piece_New.create_piece(:pawn,:white,position)}

  # describe '#new' do
  #
  #   it "creates a new instance of the Pawn class" do
  #     expect(Piece.create_piece(:pawn,:white,position)).to be_instance_of(Pawn)
  #   end
  #
  #   it "creates a new instance of the Rook class" do
  #     expect(Piece.create_piece(:rook,:white,position)).to be_instance_of(Rook)
  #   end
  #
  #   it "creates a new instance of the Bishop class" do
  #     expect(Piece.create_piece(:bishop,:white,position)).to be_instance_of(Bishop)
  #   end
  #
  #   it "creates a new instance of the Queen class" do
  #     expect(Piece.create_piece(:queen,:white,position)).to be_instance_of(Queen)
  #   end
  #
  #   it "creates a new instance of the Knight class" do
  #     expect(Piece.create_piece(:knight,:white,position)).to be_instance_of(Knight)
  #   end
  #
  #   it "creates a new instance of the King class" do
  #     expect(Piece.create_piece(:king,:white,position)).to be_instance_of(King)
  #   end
  #
  #
  #
  # end

  describe '#move' do

    context "when is a valid pawn move" do

      it "allows the piece to move to the given position" do
        expect(piece.move("b3",board)).to eq(true)
      end

    end

  end

end
