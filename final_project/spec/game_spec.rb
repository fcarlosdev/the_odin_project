require './game.rb'
require './board.rb'
require './player.rb'
require './pieces.rb'

describe "Game" do

  let(:players) {
    [Player.new("Player1","white"),
     Player.new("Player2","black")]
  }

  let(:board) {Board.new(cells)}
  let(:cells) {
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

  let(:pieces_moved) {
    [
      Pieces::Pawn.new(color:  "white", position: "Pf3"),
      Pieces::Pawn.new(color:  "black", position: "Pe5"),
      Pieces::Pawn.new(color:  "white", position: "Pg4"),
      Pieces::Queen.new(color: "black", position: "Qh4")
    ]
  }

  describe "#new" do
    it "Creates a new game" do
      expect(game).to be_instance_of(Game)
    end
  end

  describe "#play" do

    subject(:play_game) {game.play}

    before do
      allow(game).to receive(:loop).and_yield
      allow(game).to receive(:enter_moves)
      allow(game).to receive(:clear_screen)
      allow(board).to receive(:draw_board).and_return(board)
    end

    it "lets the player move a piece" do
      allow(game).to receive(:from).and_return("Pf2")
      allow(game).to receive(:to).and_return("Pf3")
      allow(game).to receive(:take_turn)
      subject
    end

    context "end game scnearios" do

      context "when is a checkmate move" do

        it "returns the winning message" do
          4.times do |i|
            allow(game).to receive(:to).and_return(pieces_moved[i].position)
            allow(game).to receive(:empty_cell?).with(pieces_moved[i].position).and_return(false)
            allow(game).to receive(:piece_on).with(pieces_moved[i].position).and_return(pieces_moved[i])
            allow(game).to receive(:piece_on_way?).with("e1",pieces_moved[i]).and_return(false)
            allow(game).to receive(:get_opponent_king).and_return(cells[7][4])
            allow(game).to receive(:check?).with(pieces_moved[i],cells[7][4]).and_return(true)
          end
          expect(game.game_over?).to eql(true)
        end

      end
    end

  end

end
