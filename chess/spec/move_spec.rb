require "./move.rb"
require "./board.rb"

describe "MovePiece" do

  let(:board) {Board.new(8,8)}
  let(:move) {Move.new(board)}

  describe '#new' do
    it "create a new move instance of class Move" do
      expect(move).to be_instance_of(Move)
    end
  end
end
