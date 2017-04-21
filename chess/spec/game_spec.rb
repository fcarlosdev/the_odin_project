require "./game.rb"
require "./board.rb"
require "./player.rb"
require "./modules/pieces.rb"

describe "Game" do

  include Pieces

  let(:game) {Game.new(Board.new(8,8))}
  let(:black_pawn) {Pawn.new("black", :pawn)}

  describe '#new' do
    it "Creates a new game" do
      expect(game).to be_instance_of(Game)
      expect(game.board).to_not be_nil
    end
  end

  describe '#move_piece' do
    it "moves the piece" do
      expect(game.move_piece("Pa2","Pa3")).to eq(true)
    end
  end

end
