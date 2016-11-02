require "./grid.rb"
require "./cell.rb"

describe "Grid" do

  let(:grid) {Grid.new(2,2)}
  let(:cell) {double("Cell", :value => "already_filled")}

  let(:cells) {
    [
      [Cell.new, Cell.new],
      [Cell.new, Cell.new]
    ]
  }

  let(:expected_grid) {
    s_grid =
    "┌───┬───┐\n"+
    "│#{cells[0][0].value.rjust(3)}│#{cells[1][0].value.rjust(3)}│\n"+
    "├───├───┤\n"+
    "│#{cells[0][1].value.rjust(3)}│#{cells[1][1].value.rjust(3)}│\n"+
    "└───┴───┘"
    s_grid
  }

  let(:expected_grid_with_cell_filled) {
    s_grid =
    "┌───┬───┐\n"+
    "│ R │#{cells[1][0].value.rjust(3)}│\n"+
    "├───├───┤\n"+
    "│#{cells[0][1].value.rjust(3)}│#{cells[1][1].value.rjust(3)}│\n"+
    "└───┴───┘"
    s_grid
  }

  describe "#new" do
    it "creates a new grid with the given cells" do
      expect(grid).to be_instance_of(Grid)
    end
  end

  describe "#fill_cell" do

    context "when the value of the cell on given position is empty" do
      it "fills the given coords on with the given value" do
        expect(grid.fill_cell(0,0,"value")).to eql(true)
      end
    end

    context "when te value of the cell on given position is not empty" do
      it "doesn't fill the value of the cell on teh given position" do
        grid.cells[0].fill(cell)
        grid.cells[1].fill(cell)
        expect(grid.fill_cell(0,0,"value")).to eql(false)
      end
    end

  end

  describe "#draw_grid" do

    context "when all cells are empty" do

     it "draw a board with all cell empty" do
       expect(grid.draw_grid).to eql(expected_grid)
     end

    end

    context "when one cell filled" do

      it "draw a board with showing the value that cell" do
        grid.cells[0][0].value = "R"
        expect(grid.draw_grid).to eq(expected_grid_with_cell_filled)
      end

    end

  end

  describe "column_full?" do

    context "when the column is not full" do
      it "returns false" do
        # (0..1).each do |i|
        #   grid.cells[i][1].value = "filled"
        # end
        expect(grid.column_full?(1)).to eq(false)
      end
    end

    context "when the column is full" do
      it "returns false" do
        (0..1).each do |i|
          grid.cells[i][1].value = "filled"
        end
        expect(grid.column_full?(1)).to eq(true)
      end
    end

  end

end
