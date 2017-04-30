require "./lib/board.rb"
require "./cell.rb"

describe "Board" do

  let(:board) {Board.new(6,7)}
  let(:cell)  {double("Cell", :value=>"")}
  let(:symbol) {"\u26C1"}
  let(:spot) {board.cells[2][3]=cell}
  let(:column) { 2 }

  describe "#new" do
    it "creates the board" do
      expect(board).to be_instance_of(Board)
    end
  end

  describe "#fill_cell" do
    it "fills the spot with the given value" do
      allow(cell).to receive(:value=).with(symbol).and_return(symbol)
      allow(spot).to receive(:value).and_return(symbol)
      board.fill_cell(cell,symbol)
      expect(spot.value).to eql(symbol)
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

    it "return false when column is out of bounds" do
      expect(board.column_full?(7)).to eql(false)
    end
  end

  describe "#empty_cell_on_column" do
    context "when there is an empty space" do
      it "returns a cell" do
        allow(board).to receive(:get_empty_cell_on_column).with(2).and_return(cell)
        expect(board.get_empty_cell_on_column(2)).to eql(cell)
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

  describe "#position_of" do
    it "returns a position of a cell" do
      board.cells[2][3] = cell
      expect(board.position_of(cell)).to eql([2,3])
    end
    it "returns null when the cell doesn't exists" do
      expect(board.position_of(Cell.new)).to eql(nil)
    end
  end


end
