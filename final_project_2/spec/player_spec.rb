require "./player.rb"
require "./pieces.rb"

describe "Player" do

  let(:player) {Player.new("Player1",:white_pieces)}
  let(:pawn)  {Pieces::Pawn.new(color: :white ,position: "Pf2")}
  let(:moviment) {
    {from: pawn.position, to: "Pf3"}
  }

  describe "#new" do
    it "creates a new player" do
      expect(player).to be_instance_of(Player)
    end
  end

  describe "#move_piece_from" do
    it "moves one piece from given position" do
      allow(player).to receive(:move_piece_from).and_return("Pf2")
      player.move_piece_from
    end
  end

  describe "#move_piece_to" do
    it "moves one piece to give destination position" do
      allow(player).to receive(:move_piece_to).and_return("Pf3")
      player.move_piece_to
    end
  end
end
