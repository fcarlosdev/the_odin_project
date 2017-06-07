require "player"

describe "Player" do

  let(:players) {
    { player1: Player.new("Player1",:white),
      player2: Player.new("Player2",:black)}
  }

  describe '#new' do
    it "creates a new instance of Player class" do
      expect(Player.new("Player1",:white)).to be_instance_of(Player)
    end
  end


end
