require "./lib/board.rb"
require "./pieces_helper.rb"

describe "Board" do

  let(:board) {Board.new(cells)}
  let(:cells) {
    [
      [Pieces::Rook.new(color:   "black", position: "Ra8"),
       Pieces::Knight.new(color: "black", position: "Nb8"),
       Pieces::Bishop.new(color: "black", position: "Bc8"),
       Pieces::Queen.new(color:  "black", position: "Qd8"),
       Pieces::King.new(color:   "black", position: "Ke8"),
       Pieces::Bishop.new(color: "black", position: "Bf8"),
       Pieces::Knight.new(color: "black", position: "Ng8"),
       Pieces::Rook.new(color:   "black", position: "Rh8")],

       [Pieces::Pawn.new(color:   "black", position: "Pa7"),
        Pieces::Pawn.new(color:   "black", position: "Pb7"),
        Pieces::Pawn.new(color:   "black", position: "Pc7"),
        Pieces::Pawn.new(color:   "black", position: "Pd7"),
        Pieces::Pawn.new(color:   "black", position: "Pe7"),
        Pieces::Pawn.new(color:   "black", position: "Pf7"),
        Pieces::Pawn.new(color:   "black", position: "Pg7"),
        Pieces::Pawn.new(color:   "black", position: "Ph7")],

       ["","","","","","","",""],
       ["","","","","","","",""],
       ["","","","","","","",""],
       ["","","","","","","",""],

       [Pieces::Pawn.new(color:   "white", position: "Pa2"),
        Pieces::Pawn.new(color:   "white", position: "Pb2"),
        Pieces::Pawn.new(color:   "white", position: "Pc2"),
        Pieces::Pawn.new(color:   "white", position: "Pd2"),
        Pieces::Pawn.new(color:   "white", position: "Pe2"),
        Pieces::Pawn.new(color:   "white", position: "Pf2"),
        Pieces::Pawn.new(color:   "white", position: "Pg2"),
        Pieces::Pawn.new(color:   "white", position: "Ph2")],

       [Pieces::Rook.new(color:   "white", position: "Ra1"),
        Pieces::Knight.new(color: "white", position: "Nb1"),
        Pieces::Bishop.new(color: "white", position: "Bc1"),
        Pieces::Queen.new(color:  "white", position: "Qd1"),
        Pieces::King.new(color:   "white", position: "Ke1"),
        Pieces::Bishop.new(color: "white", position: "Bf1"),
        Pieces::Knight.new(color: "white", position: "Ng1"),
        Pieces::Rook.new(color:   "white", position: "Rh1")]
    ]
  }

  describe "#new" do
    it "creates a new board" do
      expect(board).to be_instance_of(Board)
      expect(board.columns).to eq(8)
      expect(board.rows).to eq(8)
    end
  end

  describe "#draw_board" do
    it "expects that draw board was called" do
      expect(board).to receive(:draw_board).with(no_args).at_least(1).times
      expect(board.cells).to eq(cells)
      board.draw_board
    end
  end

  describe "#to_xy" do
    it "converts a board position to xy coordenates" do
      expect(board.to_xy("Pf2")).to eq([6,5])
      expect(board.to_xy("f2")).to eq([6,5])
    end
  end

  describe "#get_piece" do
    it "returns a piece on a given position" do
      expect(board.value_from("Pf2")).to eq board.cells[6][5]
    end
  end

  describe "#move" do

    context "when is an invalid move" do
      it "doesn't moves the given piece to the target positon" do
        expect(board.move("Pf2","Pe2")).to eq false
      end
    end

    context "when is the actual positon of the piece" do
      it "doesn't moves the given pice" do
        expect(board.move("Pf2","Pf2")).to eq false
      end
    end


  end

  describe "#get_king_color" do
    it "returns the king piece of the given color" do
      expect(board.get_king_color("black")).to_not be_nil
      expect(board.get_king_color("black")).to eq(board.cells[0][4])
    end
  end

end
