require "player"

describe "Player" do

  let(:players) {
    { player1: Player.new("Player1",:white),
      player2: Player.new("Player2",:black)}
  }
  let(:moves) {["a2","a3"]}
  let(:messages) {
    ["Move piece from: ", "Move pice to: "]
  }

  describe '#new' do
    it "creates a new instance of Player class" do
      expect(Player.new("Player1",:white)).to be_instance_of(Player)
    end
  end

  describe '#take_turn' do

    it "informs the moves that he wants to do" do
      allow(players[:player1]).to receive(:print).and_return(messages[0], messages[1])
      allow(players[:player1]).to receive_message_chain("gets.chomp").and_return(moves[0],moves[1])
      expect(players[:player1].take_turn).to eq(moves)
    end
  end


end
