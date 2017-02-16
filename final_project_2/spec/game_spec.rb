require './game.rb'
require './board.rb'
require './player.rb'
require './pieces.rb'

describe "Game" do

  let(:players) {
    [Player.new("Player1","white"), Player.new("Player2","black")]
  }

  let(:board) {
    [
      [Pieces::Rook.new(color:   "black", position: "Ra8"),
       Pieces::Knight.new(color: "black", position: "Nb8"),
       Pieces::Bishop.new(color: "black", position: "Bc8"),
       Pieces::Queen.new(color:  "black", position: "Qd8"),
       Pieces::King.new(color:   "black", position: "Ke8"),
       Pieces::Bishop.new(color: "black", position: "Bf8"),
       Pieces::Knight.new(color: "black", position: "Ng8"),
       Pieces::Rook.new(color:   "black", position: "Rh8")],

       [Pieces::Pawn.new(color:   "black", position: "Pa7"),
        Pieces::Pawn.new(color:   "black", position: "Pb7"),
        Pieces::Pawn.new(color:   "black", position: "Pc7"),
        Pieces::Pawn.new(color:   "black", position: "Pd7"),
        Pieces::Pawn.new(color:   "black", position: "Pe7"),
        Pieces::Pawn.new(color:   "black", position: "Pf7"),
        Pieces::Pawn.new(color:   "black", position: "Pg7"),
        Pieces::Pawn.new(color:   "black", position: "Ph7")],

       ["","","","","","","",""],
       ["","","","","","","",""],
       ["","","","","","","",""],
       ["","","","","","","",""],

       [Pieces::Pawn.new(color:   "white", position: "Pa2"),
        Pieces::Pawn.new(color:   "white", position: "Pb2"),
        Pieces::Pawn.new(color:   "white", position: "Pc2"),
        Pieces::Pawn.new(color:   "white", position: "Pd2"),
        Pieces::Pawn.new(color:   "white", position: "Pe2"),
        Pieces::Pawn.new(color:   "white", position: "Pf2"),
        Pieces::Pawn.new(color:   "white", position: "Pg2"),
        Pieces::Pawn.new(color:   "white", position: "Ph2")],

       [Pieces::Rook.new(color:   "white", position: "Ra1"),
        Pieces::Knight.new(color: "white", position: "Nb1"),
        Pieces::Bishop.new(color: "white", position: "Bc1"),
        Pieces::Queen.new(color:  "white", position: "Qd1"),
        Pieces::King.new(color:   "white", position: "Ke1"),
        Pieces::Bishop.new(color: "white", position: "Bf1"),
        Pieces::Knight.new(color: "white", position: "Ng1"),
        Pieces::Rook.new(color:   "white", position: "Rh1")]
    ]
  }

  let(:game) {Game.new(board,players)}
  let(:movement) {
    { from: "Pf2", to: "Pf3" }
  }

  before do
    allow(game).to receive(:puts).at_least(3).times
  end

  describe "#new" do
    it "Creates a new game" do
      expect(game).to be_instance_of(Game)
    end
  end

  describe "#play" do

    it "prompts to player to move one piece" do
      allow(game).to receive(:move_piece_from).and_return("Pf2")
      allow(game).to receive(:move_piece_to).and_return("Pf3")
      expect(game.play).to eq([1,5])
    end

  end


end
