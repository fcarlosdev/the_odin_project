require "./game.rb"
require "./lib/board.rb"

describe "Game" do

  let(:game) {Game.new(board,players)}
  let(:board) {Board.new(6,7)}
  let(:cell) {board.cells[5][2]}
  let(:pieces) {
      [ double("Piece1", :symbol =>:EMPTY_DISC),
        double("Piece2", :symbol =>:FILLED_DISC)
      ]
  }

  let(:players) {
    [
     double("Player1", :name =>"Player1", :piece => pieces[0]),
     double("Player2", :name =>"Player2", :piece => pieces[1])
    ]
  }

  describe "#new" do
    it "create a new instance of game" do
      expect(Game.new(board,players)).to be_instance_of(Game)
    end
  end

  describe "#change_player" do
    it "changes the current player" do
      game.current_player = players[0]
      expect(game.change_player).to eql(players[1])
    end
  end

  describe "#drop_a_piece" do

    context "when the column is not full" do
      it "fills the last empty cell" do
        expect(game.drop_a_piece(2,pieces[0].symbol)).to eql(true)
      end
    end

    context "when the column is full" do
      it "doesn't fills the column" do
        allow(game.board).to receive(:column_full?).with(2).and_return(true)
        expect(game.drop_a_piece(2,pieces[0].symbol)).to eql(false)
      end
    end

  end

  describe "#over?" do

    context "when has a winning move" do
      it "return true" do
        game.current_player = players[1]
        game.position = [5,2]
        (0..6).each {|c| game.board.cells[5][c].value = pieces[1].symbol }
        expect(game.over?).to eql(true)
      end
    end

  end
end
