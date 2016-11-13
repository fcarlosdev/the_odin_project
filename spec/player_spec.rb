require './player.rb'
require './piece.rb'
require './board.rb'

describe "Player" do

  let(:board) {double("Board")}
  let(:piece) {Piece.new(:EMPTY_DISC)}
  let(:player) {Player.new("Player1",piece)}

  describe "#new" do

    it "creates a player" do
      expect(Player.new("Player1",piece)).to be_instance_of(Player)
    end

  end

  describe "#drop_a_piece" do

    context "when the play is valid" do

      it "drops a piece in a column" do
        allow(board).to receive(:drop_a_piece).and_return(true)
        expect(player.drop_a_piece(board,2)).to eql(true)
      end

    end

    context "when the play is invalid" do

      it "returns false" do
        allow(board).to receive(:drop_a_piece).and_return(false)
        expect(player.drop_a_piece(board,2)).to eql(false)
      end

    end

  end

end
