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

  describe '#possible_moves' do

    context "when is a valid pawn foward move" do
      it "generates the possible forward moves that the piece can do" do
        expect(white_pieces[:pawn].possible_moves(white_pieces[:pawn].position,directions[:north],2)).to eq(["a3","a4"])
        # expect(white_pieces[:pawn].possible_moves(white_pieces[:pawn].position,directions[:north],1)).to eq(["a3"])
        #
        # expect(black_pieces[:pawn].possible_moves(black_pieces[:pawn].position,directions[:south],2)).to eq(["a7","a6"])
        # expect(black_pieces[:pawn].possible_moves(black_pieces[:pawn].position,directions[:south],1)).to eq(["a7"])
      end
    end

    # context "when is a valid rook foward move" do
    #   it "generates the possible forward moves that the piece can do" do
    #     expect(white_pieces[:rook].possible_moves(white_pieces[:rook].position,directions[:north],1)).to eq(["b3"])
    #     expect(white_pieces[:rook].possible_moves(white_pieces[:rook].position,directions[:north],7)).to eq(["b3","b4","b5","b6","b7","b8"])
    #
    #     expect(black_pieces[:rook].possible_moves(black_pieces[:rook].position,directions[:south],1)).to eq(["b7"])
    #     expect(black_pieces[:rook].possible_moves(black_pieces[:rook].position,directions[:south],7)).to eq(["b7","b6","b5","b4","b3","b2","b1"])
    #   end
    # end
    #
    # context "when is a valid queen foward move" do
    #   it "generates the possible forward moves that the piece can do" do
    #     expect(white_pieces[:queen].possible_moves(white_pieces[:queen].position,directions[:north],1)).to eq(["d3"])
    #     expect(white_pieces[:queen].possible_moves(white_pieces[:queen].position,directions[:north],7)).to eq(["d3","d4","d5","d6","d7","d8"])
    #
    #     expect(black_pieces[:queen].possible_moves(black_pieces[:queen].position,directions[:south],1)).to eq(["d7"])
    #     expect(black_pieces[:queen].possible_moves(black_pieces[:queen].position,directions[:south],7)).to eq(["d7","d6","d5","d4","d3","d2","d1"])
    #   end
    # end
    #
    # context "when is a valid forward king move" do
    #   it "generates the possible forward moves that the piece can do" do
    #     expect(white_pieces[:king].possible_moves(white_pieces[:king].position,directions[:north],1)).to eq(["f3"])
    #     expect(black_pieces[:king].possible_moves(black_pieces[:king].position,directions[:south],1)).to eq(["f7"])
    #   end
    # end
    #
    # context "when is a valid side rook move" do
    #   it "generates the possible side moves that one piece can do" do
    #     expect(white_pieces[:rook].possible_moves(white_pieces[:rook].position,directions[:west],1)).to eq(["a2"])
    #     expect(white_pieces[:rook].possible_moves(white_pieces[:rook].position,directions[:east],1)).to eq(["c2"])
    #     expect(white_pieces[:rook].possible_moves(white_pieces[:rook].position,directions[:east],4)).to eq(["c2","d2","e2","f2"])
    #
    #     expect(black_pieces[:rook].possible_moves(black_pieces[:rook].position,directions[:west],1)).to eq(["a8"])
    #     expect(black_pieces[:rook].possible_moves(black_pieces[:rook].position,directions[:east],1)).to eq(["c8"])
    #     expect(black_pieces[:rook].possible_moves(black_pieces[:rook].position,directions[:east],4)).to eq(["c8","d8","e8","f8"])
    #   end
    # end
    #
    # context "when is a valid side queen move" do
    #   it "generates the possible side moves that one piece can do" do
    #     expect(white_pieces[:queen].possible_moves(white_pieces[:queen].position,directions[:west],1)).to eq(["c2"])
    #     expect(white_pieces[:queen].possible_moves(white_pieces[:queen].position,directions[:west],3)).to eq(["c2","b2","a2"])
    #     expect(white_pieces[:queen].possible_moves(white_pieces[:queen].position,directions[:east],1)).to eq(["e2"])
    #     expect(white_pieces[:queen].possible_moves(white_pieces[:queen].position,directions[:east],4)).to eq(["e2","f2","g2","h2"])
    #
    #     expect(black_pieces[:queen].possible_moves(black_pieces[:queen].position,directions[:west],1)).to eq(["c8"])
    #     expect(black_pieces[:queen].possible_moves(black_pieces[:queen].position,directions[:west],3)).to eq(["c8","b8","a8"])
    #     expect(black_pieces[:queen].possible_moves(black_pieces[:queen].position,directions[:east],1)).to eq(["e8"])
    #     expect(black_pieces[:queen].possible_moves(black_pieces[:queen].position,directions[:east],4)).to eq(["e8","f8","g8","h8"])
    #   end
    # end
    #
    # context "when is a valid side king move" do
    #   it "generates the possible side moves that one piece can do" do
    #     expect(white_pieces[:king].possible_moves(white_pieces[:king].position,directions[:west],1)).to eq(["e2"])
    #     expect(black_pieces[:king].possible_moves(black_pieces[:king].position,directions[:east],1)).to eq(["g8"])
    #   end
    # end
    #
    # context "when is a valid diagonal bishop move" do
    #   it "generates the possible diagonal moves that one piece can do" do
    #     expect(white_pieces[:bishop].possible_moves(white_pieces[:bishop].position,directions[:ne],1)).to eq(["d3"])
    #     expect(white_pieces[:bishop].possible_moves(white_pieces[:bishop].position,directions[:ne],3)).to eq(["d3","e4","f5"])
    #     expect(white_pieces[:bishop].possible_moves(white_pieces[:bishop].position,directions[:sw],1)).to eq(["b1"])
    #     expect(white_pieces[:bishop].possible_moves(white_pieces[:bishop].position,directions[:se],1)).to eq(["d1"])
    #     expect(white_pieces[:bishop].possible_moves(white_pieces[:bishop].position,directions[:nw],1)).to eq(["b3"])
    #
    #     expect(black_pieces[:bishop].possible_moves(black_pieces[:bishop].position,directions[:ne],1)).to eq([])
    #     expect(black_pieces[:bishop].possible_moves(black_pieces[:bishop].position,directions[:sw],1)).to eq(["b7"])
    #     expect(black_pieces[:bishop].possible_moves(black_pieces[:bishop].position,directions[:se],1)).to eq(["d7"])
    #     expect(black_pieces[:bishop].possible_moves(black_pieces[:bishop].position,directions[:se],3)).to eq(["d7","e6","f5"])
    #     expect(black_pieces[:bishop].possible_moves(black_pieces[:bishop].position,directions[:nw],1)).to eq([])
    #   end
    # end
    #
    # context "when is a valid diagonal queen move" do
    #   it "generates the possible diagonal moves that one piece can do" do
    #     expect(white_pieces[:queen].possible_moves(white_pieces[:queen].position,directions[:ne],1)).to eq(["e3"])
    #     expect(white_pieces[:queen].possible_moves(white_pieces[:queen].position,directions[:ne],3)).to eq(["e3","f4","g5"])
    #     expect(white_pieces[:queen].possible_moves(white_pieces[:queen].position,directions[:sw],1)).to eq(["c1"])
    #     expect(white_pieces[:queen].possible_moves(white_pieces[:queen].position,directions[:se],1)).to eq(["e1"])
    #     expect(white_pieces[:queen].possible_moves(white_pieces[:queen].position,directions[:nw],1)).to eq(["c3"])
    #
    #     expect(black_pieces[:queen].possible_moves(black_pieces[:queen].position,directions[:ne],1)).to eq([])
    #     expect(black_pieces[:queen].possible_moves(black_pieces[:queen].position,directions[:sw],1)).to eq(["c7"])
    #     expect(black_pieces[:queen].possible_moves(black_pieces[:queen].position,directions[:se],1)).to eq(["e7"])
    #     expect(black_pieces[:queen].possible_moves(black_pieces[:queen].position,directions[:nw],1)).to eq([])
    #   end
    # end
    #
    # context "when is a valid diagonal king move" do
    #   it "generates the possible diagonal moves that one piece can do" do
    #     expect(white_pieces[:king].possible_moves(white_pieces[:king].position,directions[:ne],1)).to eq(["g3"])
    #     expect(white_pieces[:king].possible_moves(white_pieces[:king].position,directions[:sw],1)).to eq(["e1"])
    #     expect(white_pieces[:king].possible_moves(white_pieces[:king].position,directions[:se],1)).to eq(["g1"])
    #     expect(white_pieces[:king].possible_moves(white_pieces[:king].position,directions[:nw],1)).to eq(["e3"])
    #
    #     expect(black_pieces[:king].possible_moves(black_pieces[:king].position,directions[:ne],1)).to eq([])
    #     expect(black_pieces[:king].possible_moves(black_pieces[:king].position,directions[:sw],1)).to eq(["e7"])
    #     expect(black_pieces[:king].possible_moves(black_pieces[:king].position,directions[:se],1)).to eq(["g7"])
    #     expect(black_pieces[:king].possible_moves(black_pieces[:king].position,directions[:nw],1)).to eq([])
    #   end
    # end
    #
    # context "when is a valid secondary diagonal move" do
    #   it "generates the special moves that the piece can do" do
    #     expect(white_pieces[:knight].possible_moves(white_pieces[:knight].position,directions[:nne],1)).to eq(["f4"])
    #     expect(white_pieces[:knight].possible_moves(white_pieces[:knight].position,directions[:ene],1)).to eq(["g3"])
    #     expect(white_pieces[:knight].possible_moves(white_pieces[:knight].position,directions[:ese],1)).to eq(["g1"])
    #     expect(white_pieces[:knight].possible_moves(white_pieces[:knight].position,directions[:sse],1)).to eq([])
    #     expect(white_pieces[:knight].possible_moves(white_pieces[:knight].position,directions[:ssw],1)).to eq([])
    #     expect(white_pieces[:knight].possible_moves(white_pieces[:knight].position,directions[:wsw],1)).to eq(["c1"])
    #     expect(white_pieces[:knight].possible_moves(white_pieces[:knight].position,directions[:wnw],1)).to eq(["c3"])
    #     expect(white_pieces[:knight].possible_moves(white_pieces[:knight].position,directions[:nnw],1)).to eq(["d4"])
    #
    #     expect(black_pieces[:knight].possible_moves(black_pieces[:knight].position,directions[:nne],1)).to eq([])
    #     expect(black_pieces[:knight].possible_moves(black_pieces[:knight].position,directions[:ene],1)).to eq([])
    #     expect(black_pieces[:knight].possible_moves(black_pieces[:knight].position,directions[:ese],1)).to eq(["g7"])
    #     expect(black_pieces[:knight].possible_moves(black_pieces[:knight].position,directions[:sse],1)).to eq(["f6"])
    #     expect(black_pieces[:knight].possible_moves(black_pieces[:knight].position,directions[:ssw],1)).to eq(["d6"])
    #     expect(black_pieces[:knight].possible_moves(black_pieces[:knight].position,directions[:wsw],1)).to eq(["c7"])
    #     expect(black_pieces[:knight].possible_moves(black_pieces[:knight].position,directions[:wnw],1)).to eq([])
    #     expect(black_pieces[:knight].possible_moves(black_pieces[:knight].position,directions[:nnw],1)).to eq([])
    #   end
    # end
  end




end
