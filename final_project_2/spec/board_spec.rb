require "./board.rb"
require "./pieces_util.rb"

describe "Board" do

  let(:board) {Board.new(Array.new(8){Array.new(8,"")})}
  let(:empty_board) {
    [
     ["","","","","","","",""],
     ["","","","","","","",""],
     ["","","","","","","",""],
     ["","","","","","","",""],
     ["","","","","","","",""],
     ["","","","","","","",""],
     ["","","","","","","",""],
     ["","","","","","","",""]
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
      expect(board.cells).to eq(empty_board)
      board.draw_board
    end
  end

  describe "#load_pieces" do
    it "fills the board with chess pieces if it is the start of the game" do
      board.load_pieces
      expect(board.cells[0][0].icon).to eq(PiecesUtil::ICONS[:black_rook])
      expect(board.cells[7][0].icon).to eq(PiecesUtil::ICONS[:white_rook])
    end

    it "updates the board with the updated pieces postition if not is the start of the game" do
      board.load_pieces
      board.cells[5][5] = board.cells[6][5]
      board.cells[6][5] = ""
      board.load_pieces(board.cells)
      expect(board.cells[6][5]).to eq("")
      expect(board.cells[5][5].type).to eq(:pawn)
    end
  end

  describe "#to_xy" do
    it "converts a board position to xy coordenates" do
      expect(board.to_xy("Pf2")).to eq([6,5])
    end
  end

  describe "#get_piece" do
    it "returns a piece on a given position" do
      board.load_pieces
      expect(board.get_piece("Pf2")).to eq board.cells[6][5]
    end
  end

  describe "#move" do
    it "moves a given piece from original position to target position" do
      board.load_pieces
      expect(board.move("Pf2","Pf3")).to eq true
    end
  end

end
