require "./game.rb"
require "./board.rb"

describe "Game" do

  let(:game) {Game.new(board,players)}
  let(:board) {Board.new(6,7)}
  let(:cell) {board.cells[5][2]}
  let(:cell_filled) {double("Cell", :symbol =>pieces[0].symbol)}
  let(:spot) {[5,2]}
  let(:pieces) {
      [ double("Piece1", :symbol =>:EMPTY_DISC),
        double("Piece2", :symbol =>:FILLED_DISC)
      ]
  }

  let(:players) {
    [
     double("Player1", :name =>"Player1", :piece => pieces[0]),
     double("Player2", :name =>"Player2", :piece => pieces[1])
    ]
  }

  def set_position(row,col)
    game.position = [row,col]
  end

  def set_cell(row,col,value)
    game.board.cells[row][col].value = value
  end

  describe "#new" do
    it "create a new instance of game" do
      expect(Game.new(board,players)).to be_instance_of(Game)
    end
  end

  describe "#change_player" do
    it "changes the current player" do
      game.current_player = players[0]
      expect(game.change_player).to eql(players[1])
    end
  end

  describe "#fill_position" do

    context "when position is not full" do
      it "fills the given position" do
        expect(game.fill_position(2,pieces[1].symbol)).to eql(true)
      end
    end

    context "when position is full" do
      it "returns false" do
        (0..5).each {|row| game.board.cells[row][2].value = pieces[1].symbol}
        expect(game.fill_position(2,pieces[1].symbol)).to eql(false)
      end
    end

  end

  describe "#over?" do

    context "when the column has the winning move" do
      it "returns true" do
        set_position(3,2)
        set_cell(3,2,pieces[0].symbol)
        (0..2).each {|row| game.board.cells[row][2].value = pieces[0].symbol}
        expect(game.over?).to eql(true)
      end
    end

    context "when the row has the winning move" do
      it "returns true" do
        set_position(3,2)
        set_cell(3,2,pieces[0].symbol)
        (0..6).each {|col| game.board.cells[3][col].value = pieces[0].symbol}
        expect(game.over?).to eql(true)
      end
    end

    context "when the left diagonal has the winning move" do
      it "returns true" do
        col = 2
        row = 2
        set_position(row,col)
        (0..row).each {|i| set_cell(row-i,col-i,pieces[0].symbol) if (row-i).between?(0,5) && (col-i).between?(0,6)}
        (1..game.board.rows-row).each {|i| set_cell((row+i),(col+i),pieces[0].symbol) if (row+i).between?(0,5) && (col+i).between?(0,6) }
        expect(game.over?).to eql(true)
      end
    end

    context "when right diagonal has winning move" do
      it "returns true" do
        col = 6
        row = 2
        set_position(row,col)
        (0..game.board.rows-row).each {|i| set_cell((row+i),(col-i),pieces[0].symbol) if (row+i).between?(0,5) && (col-i).between?(0,6)}
        (1..row).each {|i| set_cell((row-i),(col+i),pieces[0].symbol) if (row-i).between?(0,5) && (col+i).between?(0,6)}
        expect(game.over?).to eql(true)
      end
    end

  end

  describe "#draw?" do
    context "when the board is full" do
      it "returns true" do
        game.board.cells.each {|row| row.each {|cell| cell.value = pieces[rand(2)].symbol}}
        expect(game.draw?).to eql(true)
      end
    end

    context "when the board is not full" do
      it "returns false" do
        set_cell(3,2,pieces[0].symbol)
        expect(game.draw?).to eql(false)
      end
    end

  end

end
