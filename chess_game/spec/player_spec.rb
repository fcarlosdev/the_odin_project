require "player"

describe "Player" do

  let(:players) {
    { player1: Player.new("Player1",:white),
      player2: Player.new("Player2",:black)}
  }
  let(:move) {"a2,a3"}
  let(:message) { "Enter your move (Ex.: a2,a3): " }

  describe '#new' do
    it "creates a new instance of Player class" do
      expect(Player.new("Player1",:white)).to be_instance_of(Player)
    end
  end

  describe '#make_move' do

    it "informs the moves that he wants to do" do
      allow(players[:player1]).to receive(:print).and_return(message)
      allow(players[:player1]).to receive_message_chain("gets.chomp").and_return(move)
      expect(players[:player1].make_move).to eq(move)
    end
  end


end
