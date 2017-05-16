require "./lib/game.rb"
require "./lib/board.rb"
require "./lib/player.rb"
require "./lib/pieces/pieces.rb"

describe "Game" do

  include Pieces

  let(:board) {Board.new(8,8)}
  let(:players) {
    [Player.new("Player1","white"), Player.new("Player2","black")]
  }
  let(:game) {Game.new(board,players)}
  let(:current_player) {players[0]}
  let(:game_status) {"checkmate"}
  # let(:pieces) {
  #   {
  #     white_pawn_pf2: board.value_from("Pf2"),
  #     white_pawn_pg2: board.value_from("Pf2"),
  #     white_king: board.value_from("Pe1"),
  #     black_queen: board.value_from("Qd8"),
  #     black_pawn: board.value_from("Pe7")
  #   }
  # }

  before do
    allow(game).to receive(:current_player).and_return(current_player)
    allow(game).to receive(:clear_screen)
    allow(game).to receive(:display_board)
    allow(game).to receive(:enter_move)
    allow(game).to receive(:move_piece).and_return(true)
    allow(game).to receive(:game_over?).and_return(false)
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

    it "switches current player if not checkmate" do
      expect(game).to receive(:switch_players)
      subject
    end

    context "End game scenarios" do

      context "when checkmate" do

        it "returns the winning message" do
          allow(game).to receive(:game_over?).and_return(game_status)
          expect(subject).to eql("The player #{game.current_player.name} winning the game!")
        end

      end

      context "when a draw" do

        it "returns the draw message" do
          allow(game).to receive(:game_over?).and_return("draw")
          expect(subject).to eql("It\'s a Draw")
        end

      end

    end

  end

end
