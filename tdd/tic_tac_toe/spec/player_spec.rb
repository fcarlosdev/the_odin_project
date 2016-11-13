require "./player.rb"

describe "Player" do

  let(:player) {Player.new("X", "Player_X")}

  describe "#new" do

    it "creates a new player" do
      expect(Player.new("X", "Player_X")).to be_an_instance_of(Player)
    end

    it "creates a player of type x" do
      expect(player.type).to eql("X")
    end

    it "creates a player with name Player_X" do
      expect(player.name).to eql("Player_X")
    end

  end

  describe "#make_a_play" do
    
    it "returns the position of the move" do
      allow(player).to receive(:print).and_return("Make a move Player Player_X}: ")
      allow(player).to receive(:gets).and_return("a0")
      expect(player.make_a_play).to eql(:A0)
    end
  end


end
