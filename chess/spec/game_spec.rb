require "./lib/game.rb"
require "./lib/board.rb"
require "./lib/player.rb"
require "./lib/pieces.rb"

describe "Game" do

  include Pieces

  let(:board) {Board.new(8,8)}
  let(:game) {Game.new(Board.new(8,8))}

  describe '#new' do
    it "Creates a new game" do
      expect(game).to be_instance_of(Game)
      expect(game.board).to_not be_nil
    end
  end

  describe '#make_move' do

    context "when the piece is a pawn" do

      context "when is a forward move of a pawn to empty square" do
        it "moves the pawn to the destiny given position" do
          expect(game.make_move(board.value_from("Pa2"),"Pa2","Pa3")).to eq(true)
          expect(board.value_from("Pa2")).to be_nil
        end
      end


    end

  end

end
