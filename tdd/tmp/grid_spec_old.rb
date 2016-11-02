require "./grid.rb"
require "./piece.rb"

describe "Grid" do

  let(:grid) {Grid.new}
  let(:board) {Array.new(6){Array.new(7)}}
  let(:piece) {Piece.new("Blue")}
  let(:columns) {[0,1,2,3,4,5,6]}

  describe "#new" do

    it "creates a new grid" do
      expect(Grid.new).to be_instance_of(Grid)
    end

    it "initializes the board of the grid" do
      expect(grid.board).to eql(board)
    end

  end

  context "when a player drop a piece" do

    context "when the column not is filled" do

      it "puts the piece in the last space empty of the column chosen by the player"  do
        expect(grid.drop_piece(columns[0],piece)).to eql(true)
      end

    end

    context "when the column is filled" do

      it "doesn't puts the piece in the column chosen by the player" do
        (0..5).each {|i| grid.board[i][columns[0]] = piece}
        expect(grid.drop_piece(columns[0],piece)).to eql(false)
      end

    end

  end

  describe "#winning_move?" do

    context "when found a line with a winning move" do

      it "returns true" do
        grid.board[0] = [piece,piece,piece,piece,nil,nil,nil]
        expect(grid.winning_move?(piece)).to eq(true)
      end
    end

    context "when found a column with a winning move" do

      it "returns true" do
        grid.board.each_index do |line|
          grid.board[line][0] = piece
        end
        expect(grid.winning_move?(piece)).to eq(true)
      end

    end

    context "when a diagonal with winning move is found" do

      it "returns true" do
        grid.board.each_index do |index|
          grid.board[index][index] = piece
        end
        expect(grid.winning_move?(piece)).to eq(true)
      end

    end

    context "when no one wins the game" do

      it "returns false if doesn't found a wining move" do
        grid.board[0] = [piece,piece,nil,piece,nil,nil,nil]
        expect(grid.winning_move?(piece)).to eq(false)
      end

    end

  end

  # describe "#draw_board" do
  #   it "draw a board" do
  #     expect(grid.draw_board).to eq(expected_board)
  #   end
  # end

end
