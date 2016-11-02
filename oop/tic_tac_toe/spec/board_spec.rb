require "./board.rb"

describe "Board" do

  let(:board) {Board.new}

  let(:table) {
    {A0: "", B0: "", C0: "",
     A1: "", B1: "", C1: "",
     A2: "", B2: "", C2: ""}
  }

  def change_cell_exits(cell,to_value)
    allow(board).to receive(:cell_exists?).with(cell).and_return(to_value)
  end

  def change_cell_empty(cell,to_value)
    allow(board).to receive(:cell_empty?).with(cell).and_return(to_value)
  end

  describe "#new" do

    it "create a new instace of board" do
      expect(Board.new).to be_an_instance_of(Board)
    end

    it "initializes the positions of cells of the board" do
      expect(board.table).to eq(table)
    end

  end

  describe "#filled_out?" do

    context "when all cells of board are filled" do

      it "returns true" do
        board.table = {A0: "X", B0: "X", C0: "0",
                       A1: "X", B1: "0", C1: "0",
                       A2: "X", B2: "0", C2: "X"}
        expect(board.filled_out?).to eq(true)
      end

    end

    context "when not all cells is filled" do

      it "returns false" do
        expect(board.filled_out?).to eq(false)
      end

    end

  end

  describe "#fill_cell" do

    before do
      allow(board).to receive(:cell_exists?).with(:A0).and_return(true)
      allow(board).to receive(:cell_empty?).with(:A0).and_return(true)
    end

    context "when the given cell exists in the board" do

      it "fills the cell with the given value" do
        expect(board.fill_cell(:A0,"X")).to eql(true)
      end

    end

    context "when the given cell not exists in the board" do

      it "doesn't fill the cell and return false" do
        change_cell_exits(:A4,false)
        expect(board.fill_cell(:A4,"X")).to eql(false)
      end

    end

    context "when the given cell is empty" do

      it "fills the cell with the given value" do
        expect(board.fill_cell(:A0,"X")).to eql(true)
      end

    end

    context "when the given cell is not empty" do

      it "doesn't fills the cell with the given value" do
        change_cell_empty(:A0,false)
        expect(board.fill_cell(:A0,"X")).to eql(false)
      end

    end

  end

  describe "#draw_board" do

    let(:expected_board) {
      "   A   B   C\n"+
      "0  #{"".rjust(1)} | #{"".rjust(1)} | #{"".rjust(1)} \n"+
      "  ---+---+---\n"+
      "1  #{"".rjust(1)} | #{"".rjust(1)} | #{"".rjust(1)} \n"+
      "  ---+---+---\n"+
      "2  #{"".rjust(1)} | #{"".rjust(1)} | #{"".rjust(1)} "
    }

    it "shows the board" do
      expect(board.draw_board).to eql(expected_board)
    end

  end

  describe "#has_a_winner?" do

    context "when has a winner" do

      it "returns true" do
        board.table[:A0] = "X"
        board.table[:A1] = "X"
        board.table[:A2] = "X"
        expect(board.has_a_winner?("X")).to eql(true)
      end

    end

    context "when has no winner" do

      it "return false" do
        expect(board.has_a_winner?("X")).to eql(false)
      end
    end
  end

end
