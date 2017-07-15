require './game.rb'
require './lib/player.rb'

describe 'Game' do

  let(:players) {
    [Player.new("Player1",:white), Player.new("Player2",:black)]
  }
  let(:game) {Game.new(players)}
  let(:current_player) {players[0]}

  describe '#new' do
    it "creates a new instance of Game class" do
      expect(Game.new(players)).to be_instance_of(Game)
      expect(game.current_player).to eq(players[0])
    end
  end

  describe '#play' do

    subject {game.play}

    it 'starts the game' do
      allow(game.board).to receive(:draw_board)
      allow(game).to receive(:print).and_return("Move the piece at:", "Move the pice Pawn to: ")
      allow(game).to receive_message_chain("gets.chomp").and_return("a2","a3")
      subject
    end
  end

end
