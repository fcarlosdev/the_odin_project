require './game.rb'
require './lib/player.rb'
require './lib/board.rb'
require './lib/move_piece'

describe 'Game' do

  let(:players) {
    [Player.new("Player1",:white), Player.new("Player2",:black)]
  }
  let(:game) {Game.new(players)}
  let(:current_player) {players[0]}
  let(:board) {Board.new}
  let(:move_piece) {MovePiece.new(board)}
  let(:game_status) {GameStatus.new(move_piece,board)}

  before do
    allow(game.board).to receive(:draw_board)
    allow(game).to receive(:current_player).and_return(current_player)
    allow(game).to receive_message_chain("gets.chomp").and_return("a2","a3")    
    allow(game).to receive(:move_piece).and_return(true)
    allow(current_player).to receive(:take_turn).and_return(["a2","a3"])
    allow(game).to receive(:checkmate?).and_return(false)
    allow(game).to receive(:stalemate?).and_return(false)
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

    context "check scenario" do
      it "display a check message" do
        allow(game.game_status).to receive(:check?).with(players[1]).and_return(true)
        allow(game).to receive(:puts).and_return("The Player2 is in check")
        subject
      end
    end

    context "End game scenarios" do

      context "when is checkmate" do
        it "returns checkmate message" do
          allow(game).to receive(:checkmate?).and_return(true)
          expect(game.play).to eql(:checkmate)
        end
      end

      context "when is a stalemate" do
        it "returns the draw message" do
          allow(game).to receive(:stalemate?).and_return(true)
          expect(game.play).to eql(:draw)
        end
      end
    end

    context "when game over don't happend" do
      it "changes the time to the other player" do
        allow(game).to receive(:switch_player).and_return(players[1])
        subject
      end
    end
  end

end
