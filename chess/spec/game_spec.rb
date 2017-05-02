require "./lib/game.rb"
require "./lib/board.rb"
require "./lib/player.rb"
require "./lib/helpers/pieces.rb"

describe "Game" do

  include Pieces

  let(:board) {Board.new(8,8)}
  let(:game) {Game.new(board)}
  let(:from_to) {Struct.new(:piece, :from, :to)}

  def new_from_to(piece,from,to)
    from_to.new(piece,from,to)
  end

  describe '#new' do
    it "Creates a new game" do
      expect(game).to be_instance_of(Game)
      expect(game.board).to_not be_nil
    end
  end

  describe '#start' do
    subject(:start_game) {game.start}
    it "shows the board" do
      allow(game).to receive(:display_board).and_return(board)
    end
  end

  describe '#make_move' do

    context "when is a valid move" do

      it "moves the given piece to the destiny given position" do
        move = new_from_to(board.value_from("Pa2"), "Pa2", "Pa3")
        expect(game.make_move(move.piece,move.from,move.to)).to eq(true)
        expect(board.value_from(move.from)).to be_nil
        expect(board.value_from(move.to)).to eq(move.piece)
      end

    end

    # context "when "
  end

end
