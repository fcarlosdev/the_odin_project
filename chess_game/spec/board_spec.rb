require './lib/board.rb'
require './lib/pieces/movements.rb'
require 'colorize'

describe Board do

  let(:board) {Board.new(8,8)}
  let(:movements) {Movements.new(board)}
  let(:pieces) {
    {
      black_king:board.value_from("Ke8"),
      white_king:board.value_from("Ke1"),
      black_pawn:board.value_from("Pa7"),
      white_pawn:board.value_from("Pa2"),
      black_bishop_1:board.value_from("Bf8"),
      black_bishop_2:board.value_from("Bc8")
    }
  }

  def move_piece(from,to)
    board.fill_square(to,board.value_from(from))
    board.fill_square(from,nil)
    board.value_from(to).current_position = to
  end

  describe '#new' do
    it "Creates a new board" do
      expect(board).to be_instance_of(Board)
    end
  end

  describe '#draw_board' do
    it "Draws a board" do
      lines = columns = 8
      expect(board).to receive(:draw_board).with(no_args).exactly(1).times
      expect(board.squares[0][4].color).to eq(pieces[:black_king].color)
      expect(board.squares[0][4].type).to eq(pieces[:black_king].type)
      expect(board.squares[1][2].type).to eq(pieces[:black_pawn].type)
      expect(board.squares[1][7].type).to eq(pieces[:black_pawn].type)
      expect(board.squares[6][7].type).to eq(pieces[:black_pawn].type)
      board.draw_board
    end
  end

  describe '#value_from' do

    context "when is given a valid location" do
      it "returns the piece on square" do
        expect(board.value_from("Pa2")).to_not be_nil
      end
    end

    context "when is given an invalid position" do
      it "returns nil" do
        expect(board.value_from("Pl2")).to be_nil
      end
    end
  end

  describe '#fill_square' do
    it "changes the value of a square" do
      board.fill_square("Pb3",pieces[:black_pawn])
      expect(board.value_from("Pb3")).to_not be_nil
    end
  end

  describe '#position_from' do
    it "returns the position of a type of pice" do
      expect(board.position_from(:king,"white")).to eq("Ke1")
    end

    it "returns nil when doesn't find the piece" do
      expect(board.position_from(:ace,"white")).to eq(nil)
    end
  end

  describe '#game_over?' do

    context "when occur an end game situation" do

      context "when is a checkmate situation" do
        context "when few moves" do
          context "with checkamate case one" do
            it "returns checkmate when there is a checkmate move" do
              move_piece("Pf2","Pf3")
              move_piece("Pe7","Pe5")
              move_piece("Pg2","Pg4")
              move_piece("Qd8","Qh4")
              expect(board.game_over?(pieces[:white_king],movements)).to eq("checkmate")
            end
          end

          context "with checkamate case one" do
            it "returns checkmate when there is a checkmate move" do
              move_piece("Pf2","Pf3")
              move_piece("Pe7","Pe5")
              move_piece("Pd2","Pd3")
              move_piece("Bf8","Bc5")
              move_piece("Pg2","Pg4")
              move_piece("Qd8","Qh4")
              expect(board.game_over?(pieces[:white_king],movements)).to eq(nil)
            end
          end

        end

        context "after multiples moves" do
          it "returns checkmate status" do

            ["Pa1","Pb1","Pc1","Pd1","Pf1","Pg1",
              "Ph1","Pa2", "Pb2","Pc2", "Pd2", "Pe2",
              "Pf2", "Pg2", "Ph2","Rh8","Ng8", "Nb8" ].each {|position| board.fill_square(position,nil)}

              board.fill_square("Kh1",pieces[:white_king])
              pieces[:white_king].current_position = "Kh1"

              board.fill_square("Be3",pieces[:black_bishop_1])
              pieces[:black_bishop_1].current_position = "Be3"
              board.fill_square("Bf3",pieces[:black_bishop_2])
              pieces[:black_bishop_2].current_position = "Bf3"
              board.fill_square("Kh3",pieces[:black_king])
              pieces[:black_king].current_position = "Kh3"
              expect(board.game_over?(pieces[:white_king],movements)).to eq("checkmate")
          end
        end

      end

      # context "when is a draw situation" do
      #   it "returns draw when there is a draw" do
      #     allow(board).to receive(:game_over?).with(pieces[:black_pawn],nil).and_return("draw")
      #     expect(board.game_over?(pieces[:black_pawn],nil)).to eq("draw")
      #   end
      # end

    end

    context "when not occur an end game situation" do
      it "continues with the game" do
        move_piece("Pf2","Pf3")
        move_piece("Pe7","Pe5")
        move_piece("Pd2","Pd3")
        move_piece("Bf8","Bc5")
        expect(board.game_over?(pieces[:white_king],movements)).to eq(nil)
      end
    end

  end

end
