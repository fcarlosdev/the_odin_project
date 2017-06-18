require "./lib/move_rook"
require "./lib/board_new"
require "./lib/rook_new"

describe "MoveRook" do

  let(:board) {Board_New.new}
  let(:move_rook) {MoveRook.new(board)}
  let(:positions) {
    {a1: "a1", a2: "a2", a3: "a3", a4: "a4",
     a5: "a5", a6: "a6", a7: "a7", a8: "a8",
     b1: "b1", c1: "c1", d1: "d1", e1: "e1",
     f1: "f1", g1: "g1", h1: "h1", b8: "b8",
     c8: "c8", d8: "d8", e8: "e8", f8: "f8",
     g8: "g8", h8: "h8"}}

  let(:pieces) {
    {white_rook: Rook_New.new(:white,positions[:a1]),
     white_pawn: Pawn_New.new(:white,positions[:a2]),
     black_rook: Rook_New.new(:black,positions[:a8])}
  }

  describe '#new' do
    it "create a new instance of MoveRook class" do
      expect(MoveRook.new(board)).to be_instance_of(MoveRook)
    end
  end

  describe '#move' do

    context "when is a forward move" do

      before (:example) do
        board.clear_square(positions[:a2])
      end

      context "when is a valid move" do
        it "moves the rook piece to the new position" do
          expect(move_rook.move(pieces[:white_rook],positions[:a2])).to eq(true)
          expect(board.value_from(positions[:a2])).to eq(pieces[:white_rook])
        end
      end

      context "when is a move that is occupied by an ally piece" do
        it "doens't allows the rook piece to do the move" do
          board.fill_square(positions[:a2],pieces[:white_pawn])
          expect(move_rook.move(pieces[:white_rook],positions[:a2])).to eq(false)
        end
      end

      context "when is a piece between the origin and destiny positions" do
        it "doesn't allows the rook piece to do the move" do
          board.fill_square(positions[:a2],pieces[:white_pawn])
          expect(move_rook.move(pieces[:white_rook],positions[:a4])).to eq(false)
        end
      end

      context "when is an invalid move" do
        it "doesn't allows the rook piece to move to the positions" do
          expect(move_rook.move(pieces[:white_rook],positions[:b2])).to eq(false)
        end
      end

    end

    context "when is a capture move" do

      context "when is a valid move" do
        it "allows the rook to capture the opponent piece" do
          board.fill_square(positions[:a2],pieces[:black_rook])
          expect(move_rook.move(pieces[:white_rook],positions[:a2])).to eq(true)
          expect(board.value_from(positions[:a2])).to eq(pieces[:white_rook])
        end
      end

    end

    context "when is a side move" do

      context "when is a valid move" do
        it "allows the rook piece to move to the place" do
          ["b1","c1","g8","f8"].each {|place| board.clear_square(place)}
          pieces[:black_rook].position = "h8"
          expect(move_rook.move(pieces[:white_rook],positions[:b1])).to eq(true)
          expect(move_rook.move(pieces[:white_rook],positions[:c1])).to eq(true)
          expect(move_rook.move(pieces[:black_rook],positions[:f8])).to eq(true)
        end
      end
    end

  end

end
