require './game'
require './lib/player'
require './lib/board'
require './lib/move_piece'
require './lib/move_pawn'
require './lib/move_bishop'
require './lib/move_king'
require './lib/move_queen'
require './lib/move_rook'
require './lib/move_knight'
require './lib/game_status'


describe 'Game' do

  let(:players) {
    [Player.new("Player1",:white), Player.new("Player2",:black)]
  }
  let(:game) {Game.new(players)}
  let(:current_player) {players[0]}
  let(:board) {Board.new}
  let(:move_piece) {MovePiece.new(board)}
  let(:game_status) {GameStatus.new(move_piece,board)}
  let(:messages) {
    ["The #{current_player.name} make a checkmate move, end of the game",
      "It's a draw"]
  }


  before do
    allow(game.board).to receive(:draw_board)
    allow(game).to receive(:clear_screen)
    allow(game).to receive(:current_player).and_return(current_player)
    allow(game).to receive_message_chain("gets.chomp").and_return("a2","a3")
    allow(game).to receive(:move_piece).and_return(true)
    allow(current_player).to receive(:make_move).and_return(["a2","a3"])
    allow(game).to receive(:take_turn).and_return(true)
    allow(game.game_status).to receive(:checkmate?).and_return(false)
    allow(game.game_status).to receive(:stalemate?).and_return(false)
    allow(game).to receive(:game_over?).and_return(false)
  end

  describe '#new' do
    it "creates a new instance of Game class" do
      expect(Game.new(players)).to be_instance_of(Game)
      expect(game.current_player).to eq(players[0])
    end
  end

  describe '#play' do

    subject (:play_game) {game.play}

    before (:example) do
      allow(game).to receive(:loop).and_yield
    end

    it 'goes through player turn actions' do
      expect(game).to receive(:take_turn).and_return(true)
      subject
    end

    context "End game scenarios" do

      context "when is checkmate" do
        it "returns checkmate message" do
          allow(game).to receive(:game_over?).and_return(true)
          allow(game).to receive(:status).and_return(:checkmate)
          allow(game).to receive(:display_messages).and_return(messages[0])
          expect(subject).to eql("The #{current_player.name} make a checkmate move, end of the game")
        end
      end

      context "when is a stalemate" do
        it "returns the draw message" do
          allow(game).to receive(:game_over?).and_return(true)
          allow(game).to receive(:status).and_return(:draw)
          allow(game).to receive(:display_messages).and_return(messages[1])
          expect(subject).to eql("It's a draw")
        end
      end
    end

    it "switches the players" do
      expect(game).to receive(:switch_player)
      subject
    end
  end

end
