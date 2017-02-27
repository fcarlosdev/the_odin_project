require "./player.rb"
require "./pieces.rb"

describe "Player" do

  let(:player) {Player.new("Player1","white")}
  let(:pawn)  {Pieces::Pawn.new(color: "white" ,position: "Pf2")}
  let(:moviment) {
    {from: pawn.position, to: "Pf3"}
  }

  describe "#new" do
    it "creates a new player" do
      expect(player).to be_instance_of(Player)
    end
  end

  describe "#move_piece" do
    it "enters the location of the piece to be moved" do
      from = "pf2"
      to   = "pf3"
      allow(player).to receive(:move_one_piece).and_return(from)
      allow(player).to receive(:move_one_piece).and_return(to)
      player.move_one_piece
    end
  end
end
