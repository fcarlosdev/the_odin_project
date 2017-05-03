require "./lib/game.rb"
require "./lib/board.rb"
require "./lib/player.rb"
require "./lib/helpers/pieces.rb"

describe "Game" do

  include Pieces

  let(:board) {Board.new(8,8)}
  let(:players) {
    [Player.new("Player1","white"), Player.new("Player2","black")]
  }
  let(:game) {Game.new(board,players)}

  let(:positions) {
    {pa2: "Pa2", pa3: "Pa3"}
  }

  def new_from_to(piece,from,to)
    from_to.new(piece,from,to)
  end

  describe '#new' do
    it "Creates a new game" do
      expect(game).to be_instance_of(Game)
      expect(game.board).to_not be_nil
      expect(game.current_player).to eq(players[0])
    end
  end

  describe '#start' do

    subject(:start_game) {game.start}

    it "starts the game" do
      allow(game).to receive(:clear_screen)
      allow(game).to receive(:display_board).and_return(board)
      subject
    end
  end

  describe '#move' do

    context "when is a valid move" do

      context "when the "
      it "moves the given piece to the destiny given position" do
        piece = board.value_from(positions[:pa2])

        expect(game.move(piece, positions[:pa2], positions[:pa3])).to eq(true)
        expect(board.value_from(positions[:pa2])).to be_nil
        expect(board.value_from(positions[:pa3])).to eq(piece)
      end

    end

  end

end
