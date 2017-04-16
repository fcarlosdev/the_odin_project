require "./game.rb"
require "./board.rb"
require "./player.rb"
require "./modules/pieces.rb"

describe "Game" do

  include Pieces

  let(:game) {Game.new(Board.new(8,8),players)}

  let(:players) {
    [ Player.new("Player1","white"),
      Player.new("Computer","black")
    ]
  }

  # let(:board) {
  #   [
  #     [create_piece(:black_rook), create_piece(:black_knight),
  #      create_piece(:black_bishop), create_piece(:black_queen),
  #      create_piece(:black_king), create_piece(:black_bishop),
  #      create_piece(:black_knight), create_piece(:black_rook)],
  #
  #     [create_piece(:black_pawn), create_piece(:black_pawn),
  #      create_piece(:black_pawn), create_piece(:black_pawn),
  #      create_piece(:black_pawn), create_piece(:black_pawn),
  #      create_piece(:black_pawn), create_piece(:black_pawn)],
  #
  #     ["","","","","","","",""],
  #     ["","","","","","","",""],
  #     ["","","","","","","",""],
  #     ["","","","","","","",""],
  #
  #     [create_piece(:white_pawn), create_piece(:white_pawn),
  #      create_piece(:white_pawn), create_piece(:white_pawn),
  #      create_piece(:white_pawn), create_piece(:white_pawn),
  #      create_piece(:white_pawn), create_piece(:white_pawn)],
  #
  #     [create_piece(:white_rook), create_piece(:white_knight),
  #      create_piece(:white_bishop), create_piece(:white_queen),
  #      create_piece(:white_king), create_piece(:white_bishop),
  #      create_piece(:white_knight), create_piece(:white_rook)]
  #   ]
  # }

  describe '#new' do
    it "Creates a new game" do
      expect(game).to be_instance_of(Game)
      expect(game.board).to_not be_nil
    end
  end

  describe '#move_piece' do

    context "when is a pawn piece" do

      context "when is a valid movement" do
        it "moves a piece from current position to a given position" do
          expect(game.move_piece("Pa2","Pa3")).to eq(true)
          expect(game.move_piece("Pb2","Pb4")).to eq(true)
        end
      end

      context "when is an invalid movment" do

        it "doens't moves a piece from its current position to the new one" do
          game.move_piece("Pb2","Pb4")
          game.move_piece("Pb4","Pb5")
          game.move_piece("Pb5","Pb6")
          expect(game.move_piece("Pb6","Pb7")).to eq(false)
          expect(game.move_piece("Pa2","Pa5")).to eq(false)
        end
      end

    end

    context "when is a rook piece" do

      context "when is a valid movement" do
        it "moves a piece from current position to a given position" do
          expect(game.move_piece("Ra1","Ra2")).to eq(true)
          expect(game.move_piece("Rh1","Rh6")).to eq(true)
        end
      end

    end
  end

end
