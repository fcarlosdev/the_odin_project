require "./board.rb"

describe "Board" do

  let(:board) {Board.new(8,8)}

  describe "#new" do
    it "instantiates a new board" do
      expect(board).to be_instance_of(Board)
    end
  end

  describe "#draw_board" do
    it "draws the new board of the dimensions defined" do
      expect(board).to receive(:puts).at_least(1).times
      board.draw_board
    end
  end

end
