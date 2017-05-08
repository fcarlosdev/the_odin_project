require "./lib/game.rb"
require "./lib/board.rb"
require "./lib/player.rb"
require "./lib/pieces/pieces.rb"

describe "Game" do

  include Pieces

  let(:board) {Board.new(8,8)}
  let(:players) { [Player.new("Player1","white"), Player.new("Player2","black")] }
  let(:game) {Game.new(board,players)}
  let(:positions) { {pa2: "Pa2", pa3: "Pa3"} }
  let(:pieces) { { white_pawn: board.value_from("Pa2") } }

  before do
    allow(game).to receive(:clear_screen)
    allow(game).to receive(:display_board)
    allow(game).to receive(:enter_move)
    allow(game).to receive(:move_piece).and_return(true)
    allow(game).to receive(:switch_players)
  end

  describe '#new' do
    it "Creates a new game" do
      expect(game).to be_instance_of(Game)
      expect(game.board).to_not be_nil
      expect(game.current_player).to eq(players[0])
    end
  end

  describe '#play' do

    subject(:play_game) {game.play}

    before do
      allow(game).to receive(:loop).and_yield
    end

    it "Goes through current player turn actions" do
      expect(game).to receive(:take_turn)
      subject
    end

    context "End game scenarios" do

      context "when checkmate" do

        it "returns the winning message" do
          game.status = "checkmate"
          expect(subject).to eql("The player #{game.current_player.name} winning the game!")
        end

      end

      context "when a draw" do

        it "returns the draw message" do
          game.status = "draw"
          expect(subject).to eql("It\'s a Draw")
        end

      end

    end

  end

end
