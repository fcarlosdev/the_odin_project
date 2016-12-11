require "./board.rb"

describe "Board" do

  let(:board) {Board.new(8,8)}

  describe "#new" do
    it "creates a new board" do
      expect(board).to be_instance_of(Board)
    end
  end

end
