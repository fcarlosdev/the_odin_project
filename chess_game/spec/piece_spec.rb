require "pawn"
require "rook"
require "bishop"
require "queen"
require "knight"
require "king"
require "board"
require "directions_new"

describe "Piece" do

  let(:board) {Board.new}
  let(:position) {"b2"}
  let(:white_pieces) {
     {pawn: Piece.create_piece(:pawn,:white,"a2"),
      rook:  Piece.create_piece(:rook,:white,"b2"),
      bishop: Piece.create_piece(:bishop,:white,"c2"),
      queen: Piece.create_piece(:queen,:white,"d2"),
      knight: Piece.create_piece(:knight,:white,"e2"),
      king: Piece.create_piece(:king,:white,"f2")}
  }
  let(:black_pieces) {
     {pawn: Piece.create_piece(:pawn,:black,"a8"),
      rook:  Piece.create_piece(:rook,:black,"b8"),
      bishop: Piece.create_piece(:bishop,:black,"c8"),
      queen: Piece.create_piece(:queen,:black,"d8"),
      knight: Piece.create_piece(:knight,:black,"e8"),
      king: Piece.create_piece(:king,:black,"f8")}
  }

  let(:directions) {
    {north: Directions_New.north,    south: Directions_New.south,
     west:  Directions_New.west,      east: Directions_New.east,
       ne:  Directions_New.northeast,   sw: Directions_New.southwest,
       se:  Directions_New.southeast,   nw: Directions_New.northwest,
       nne: Directions_New.nne,        ene: Directions_New.ene,
       ese: Directions_New.ese,        sse: Directions_New.sse,
       ssw: Directions_New.ssw,        wsw: Directions_New.wsw,
       wnw: Directions_New.wnw,        nnw: Directions_New.nnw}
  }

  describe '#new' do

    it "creates a new instance of the Pawn class" do
      expect(Piece.create_piece(:pawn,:white,"a2")).to be_instance_of(Pawn)
    end

    it "creates a new instance of the Rook class" do
      expect(Piece.create_piece(:rook,:white,"b2")).to be_instance_of(Rook)
    end

    it "creates a new instance of the Bishop class" do
      expect(Piece.create_piece(:bishop,:white,"c2")).to be_instance_of(Bishop)
    end

    it "creates a new instance of the Queen class" do
      expect(Piece.create_piece(:queen,:white,"d2")).to be_instance_of(Queen)
    end

    it "creates a new instance of the Knight class" do
      expect(Piece.create_piece(:knight,:white,"e2")).to be_instance_of(Knight)
    end

    it "creates a new instance of the King class" do
      expect(Piece.create_piece(:king,:white,"f2")).to be_instance_of(King)
    end

  end

end
