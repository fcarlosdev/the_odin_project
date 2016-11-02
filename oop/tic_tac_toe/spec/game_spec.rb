require './game.rb'

describe "Game" do
  let(:board) {Board.new}
  let(:game) {Game.new(board)}
  let(:drawn_board) {
    "  A    B   C\n"\
    "0    |   |   \n"\
    "  ---+---+---\n"\
    "1    |   |   \n"\
    "  ---+---+---\n"\
    "2    |   |   \n"
  }

  let(:players) {
    {"X" => Player.new("X","Player_X"),
     "0" => Player.new("0","Player_0")}
  }

  let(:current_player) { players["0"] }

  let(:messages) {
    [
      "Player_X has won!!!!",
      "No winner"
    ]
  }


  def change_status_game(new_status)
    allow(game).to receive(:game_over?).and_return(new_status)
  end

  before do
    game.current_player = current_player
    allow(game).to receive(:loop).and_yield
    allow(game).to receive(:create_players)
    allow(game).to receive(:choose_a_player).and_return(game.current_player)
    allow(game).to receive(:clear_screen)
    allow(game).to receive(:make_a_play)
    allow(current_player).to receive(:make_a_play).and_return("A0")
    allow(game).to receive(:change_player)
    allow(board).to receive(:draw_board).and_return(drawn_board)
    allow(game).to receive(:finalize_game)
  end

  describe '#new' do
    it "creates a new instance of game" do
      expect(Game.new(board)).to be_an_instance_of(Game)
    end
  end

  describe '#start_game' do
    subject(:play_game) {game.start_game}

    it "creates players" do
      expect(game).to receive(:create_players)
      subject
    end

    it "prompts to user to choose a type of player" do
      expect(game).to receive(:choose_a_player)
      subject
    end

    it "makes a play" do
      expect(game).to receive(:make_a_play)
      subject
    end

    it "fill a cell on board" do
      change_status_game(true)
      while !game.game_over? do
       allow(board).to receive(:filled_out?).and_return(true)
       expect(board).to receive(:fill_cell).with("A0","X").and_return(true)
       subject
      end
    end

  end

  context "End of game " do

    context "when game has a winner" do

      before(:each) do
        change_status_game(true)
      end

      it "displays a message with the name of winner" do
        allow(game).to receive(:display_message).and_return(messages[0])
        expect(game.display_message).to eql(messages[0])
        game.start_game
      end

    end

    context "when game has no winner" do

      it "displays the no winning message" do
        allow(game).to receive(:display_message).and_return(messages[1])
        expect(game.display_message).to eql(messages[1])
        game.start_game
      end

    end

  end


end
