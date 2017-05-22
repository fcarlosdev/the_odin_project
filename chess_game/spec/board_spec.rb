require './lib/board.rb'
require './lib/pieces/movements.rb'
require './lib/pieces/pieces.rb'
require 'colorize'

describe Board do

  include Pieces

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

  def clean_squares
    board.squares.each do |row|
      row.each do |piece|
        board.fill_square(piece.current_position,nil) if piece != nil
      end
    end
  end


  # describe '#new' do
  #   it "Creates a new board" do
  #     expect(board).to be_instance_of(Board)
  #   end
  # end

  # describe '#draw_board' do
  #   it "Draws a board" do
  #     lines = columns = 8
  #     expect(board).to receive(:draw_board).with(no_args).exactly(1).times
  #     expect(board.squares[0][4].color).to eq(pieces[:black_king].color)
  #     expect(board.squares[0][4].type).to eq(pieces[:black_king].type)
  #     expect(board.squares[1][2].type).to eq(pieces[:black_pawn].type)
  #     expect(board.squares[1][7].type).to eq(pieces[:black_pawn].type)
  #     expect(board.squares[6][7].type).to eq(pieces[:black_pawn].type)
  #     board.draw_board
  #   end
  # end

  # describe '#value_from' do
  #
  #   context "when is given a valid location" do
  #     it "returns the piece on square" do
  #       expect(board.value_from("Pa2")).to_not be_nil
  #     end
  #   end
  #
  #   context "when is given an invalid position" do
  #     it "returns nil" do
  #       expect(board.value_from("Pl2")).to be_nil
  #     end
  #   end
  # end

  # describe '#fill_square' do
  #   it "changes the value of a square" do
  #     board.fill_square("Pb3",pieces[:black_pawn])
  #     expect(board.value_from("Pb3")).to_not be_nil
  #   end
  # end

  # describe '#position_from' do
  #   it "returns the position of a type of pice" do
  #     expect(board.position_from(:king,"white")).to eq("Ke1")
  #   end
  #
  #   it "returns nil when doesn't find the piece" do
  #     expect(board.position_from(:ace,"white")).to eq(nil)
  #   end
  # end

  describe '#game_over?' do

    context "when occur an end game situation" do

      context "when is a checkmate situation" do

        it "returns checkmate when there is a checkmate after four moves" do
          move_piece("Pf2","Pf3")
          move_piece("Pe7","Pe5")
          move_piece("Pg2","Pg4")
          move_piece("Qd8","Qh4")
          expect(board.game_over?(pieces[:white_king],movements)).to eq("checkmate")
        end

        it "returns checkmate when there is a checkmate after six moves" do
          move_piece("Pf2","Pf3")
          move_piece("Pe7","Pe5")
          move_piece("Pd2","Pd3")
          move_piece("Bf8","Bc5")
          move_piece("Pg2","Pg4")
          move_piece("Qd8","Qh4")
          expect(board.game_over?(pieces[:white_king],movements)).to eq("playing")
        end

        it "returns checkmate status after multiples moves the same to occur" do
          clean_squares
          board.fill_square("Kh1",create_piece(:king,"white","Kh1"))
          board.fill_square("Be3",create_piece(:bishop,"black","Be3"))
          board.fill_square("Bf3",create_piece(:bishop,"black","Bf3"))
          board.fill_square("Kh3",create_piece(:king,"black","Kh3"))
          board.fill_square("Qc6",create_piece(:queen,"white","Qc6"))
          expect(board.game_over?(board.value_from("Kh1"),movements)).to eq("checkmate")
        end

      end

      context "when is a draw situation" do

        context "when occurr a stalemate" do
          it "returns draw when there is a draw" do
            clean_squares
            board.fill_square("Ka5",create_piece(:king,"black","Ka5"))
            board.fill_square("Qc6",create_piece(:queen,"white","Qc6"))
            board.fill_square("Kc4",create_piece(:king,"white","Kc4"))
            expect(board.game_over?(board.value_from("Ka5"),movements)).to eq("draw")
          end
        end

        # (example: a king and a bishop vs.a king)
        # context "There are not enough pieces on the board to force a checkmate" do
        #
        # end

      end

    end

    context "when not occur an end game situation" do
      it "continues with the game" do
        move_piece("Pf2","Pf3")
        move_piece("Pe7","Pe5")
        move_piece("Pd2","Pd3")
        move_piece("Bf8","Bc5")
        expect(board.game_over?(pieces[:white_king],movements)).to eq("playing")
      end
    end

  end

end
