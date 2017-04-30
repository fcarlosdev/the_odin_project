require "./lib/board.rb"
require "./cell.rb"

describe "Board" do

  let(:board) {Board.new(6,7)}
  let(:cell)  {double("Cell", :value=>"")}
  let(:symbol) {"\u26C1"}
  let(:column) { 2 }

  describe "#new" do
    it "creates the board" do
      expect(board).to be_instance_of(Board)
    end
  end

  describe "#fill" do
    context "when there is an empty cell" do
      it "fills the empty cell" do
        expect(board).to receive(:fill).with(cell,symbol).at_least(1).times
        board.fill(cell,symbol)
      end
    end
  end

  describe "#show" do
    it "shows the board" do
       expect(board).to receive(:puts).at_least(1).times
       puts board.show
    end
  end

  describe "#column_full?" do
    it "returns true when colum is full" do
      (0..5).each {|row| board.cells[row][2].value = "filled"}
      expect(board.column_full?(2)).to eql(true)
    end

    it "returns false when column is not full" do
      expect(board.column_full?(2)).to eql(false)
    end

    # it "return false when column is out of bounds" do
    #   expect(board.column_full?(7)).to eql(false)
    # end
  end

  describe "#get_empty_cell_on_column" do
    context "when there is an empty space" do
      it "returns a cell" do
        board.cells[5][2].value = "filled"
        expect(board.get_empty_cell_on_column(2)).to eql(board.cells[4][2])
      end
    end

    context "when there is no empty cell" do
      it "returns no cell" do
        (0..5).each {|row| board.cells[row][2].value = "filled"}
        expect(board.get_empty_cell_on_column(2)).to eql(nil)
      end
    end
  end

  describe "#row" do
    it "returns a row " do
      expect(board.row(5)).to eql(board.cells[5])
    end
  end

  describe "#get_position" do
    it "returns a position of a cell" do
      board.cells[2][3] = cell
      expect(board.get_position(cell)).to eql([2,3])
    end
    it "returns null when the cell doesn't exists" do
      expect(board.get_position(Cell.new)).to eql(nil)
    end
  end

end
