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
    it "fill the board with chess pieces" do
      board.load_pieces
      expect(board.cells[0][0]).to eq(PiecesUtil::ICONS[:black_rook])
      expect(board.cells[7][0]).to eq(PiecesUtil::ICONS[:white_rook])
    end
  end  

end
