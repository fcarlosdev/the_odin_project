require './game.rb'
require './lib/player.rb'

describe 'Game' do

  let(:players) {
    [Player.new("Player1",:white), Player.new("Player2",:black)]
  }
  let(:game) {Game.new(players)}
  let(:current_player) {players[0]}

  before do
    allow(game.board).to receive(:draw_board)
    allow(game).to receive(:game_over?).and_return(false)
    allow(game).to receive(:current_player).and_return(current_player)
    allow(current_player).to receive(:take_turn).and_return(["a2","a3"])
  end

  describe '#new' do
    it "creates a new instance of Game class" do
      expect(Game.new(players)).to be_instance_of(Game)
      expect(game.current_player).to eq(players[0])
    end
  end

  describe '#play' do

    subject {game.play}

    before do
      allow(game).to receive(:loop).and_yield
    end

    it 'starts the game' do
      allow(game).to receive(:take_turn)
      subject
    end

    # context "End game scenarios" do
    #
    #   context "when is checkmate" do
    #
    #   end
    # end

  end

end
