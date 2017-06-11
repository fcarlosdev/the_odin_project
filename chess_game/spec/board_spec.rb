require 'board'
require 'colorize'
require 'piece'
require 'player'

describe Board do

  let(:board) {Board.new}

  let(:white_pieces) {
    { pawn: Piece.create_piece(:pawn,:white,"a2"),
      rook: Piece.create_piece(:rook,:white,"a1"),
      bishop: Piece.create_piece(:bishop,:white,"c1"),
      queen: Piece.create_piece(:queen,:white,"d1"),
      knight: Piece.create_piece(:knight,:white,"b1"),
      king: Piece.create_piece(:king,:white,"e1")
    }
  }

  let(:black_pieces) {
    { pawn: Piece.create_piece(:pawn,:black,"a7"),
      rook: Piece.create_piece(:rook,:black,"a8"),
      bishop: Piece.create_piece(:bishop,:black,"c8"),
      queen: Piece.create_piece(:queen,:black,"d8"),
      knight: Piece.create_piece(:knight,:black,"b8"),
      king: Piece.create_piece(:king,:black,"e8")
    }
  }

  let(:players) {
    {player1: Player.new("player1",:"white"),
     player2: Player.new("playr2", :black)}
  }

  def clear_board
    board.squares.each do |square|
      square.each do |value|
        board.fill_square(value.position,nil) if !value.nil?
      end
    end
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
      expect(board.squares[1][0].type).to eq(:pawn)
      board.draw_board
    end
  end

  describe '#value_from' do

    context "when is given a valid location" do
      it "returns the piece on square" do
        expect(board.value_from("a2")).to_not be_nil
      end
    end

    context "when is given an invalid position" do
      it "returns nil" do
        expect(board.value_from("l2")).to be_nil
      end
    end
  end

  describe '#fill_square' do
    it "changes the value of a square" do
      board.fill_square("b3",Piece.create_piece(:pawn,:white,"b3"))
      expect(board.value_from("b3")).to_not be_nil
    end
  end

  describe '#move_piece' do

    context "when is a pawn piece" do

      context "when is a a valid forward move" do
        it "moves a piece to the new position" do
          moved = board.move_piece(white_pieces[:pawn],"a3")
          expect(moved).to eq(true)
          expect(board.value_from("a3")).to eq(white_pieces[:pawn])
        end
      end

      context "when is a valid capture move" do
        it "captures the opponent piece on the destiny square" do
          board.fill_square("b3",black_pieces[:pawn])
          expect(board.move_piece(white_pieces[:pawn],"b3")).to eq(true)
        end
      end

      context "when is an invalid move to a position that is not possible move" do
        it "doesn't moves the piece to the new position" do
          expect(board.move_piece(white_pieces[:pawn],"b2")).to eq(false)
        end
      end

      context "when is a capture move to an empty position and is not an en passant move" do
        it "doesn't allows the capture move" do
          expect(board.move_piece(white_pieces[:pawn],"b3")).to eq(false)
        end
      end

      context "when is an en passant move" do
        it "allows the piece execute special capture move" do
          board.move_piece(board.value_from("f2"),"f4")
          board.move_piece(board.value_from("a7"),"a5")
          board.move_piece(board.value_from("f4"),"f5")
          board.move_piece(board.value_from("g7"),"g5")
          moved = board.move_piece(board.value_from("f5"),"g6")
          expect(moved).to eq(true)
          expect(board.value_from("g5")).to be_nil
        end
      end

      context "when is can make en passant move but doesn't make" do
        it "doesn't can make en passan move next time" do
          board.move_piece(board.value_from("f2"),"f4")
          board.move_piece(board.value_from("a7"),"a5")
          board.move_piece(board.value_from("f4"),"f5")
          board.move_piece(board.value_from("g7"),"g5")
          board.move_piece(board.value_from("b2"),"b4")
          board.move_piece(board.value_from("a5"),"b4")
          expect(board.move_piece(board.value_from("f5"),"g6")).to eq(false)
        end
      end

      context "when is a promotion move" do
        it "allows to choose other ally piece to replace the pawn" do
          ["e7","f7","g7","f8"].each {|position| board.fill_square(position,nil)}
          board.fill_square("f7",board.value_from("f2"))
          board.value_from("f2").position = "f7"
          board.fill_square("f2",nil)
          allow(board).to receive(:promote_to).with(no_args).and_return("Q")
          board.move_piece(board.value_from("f7"),"f8")
          expect(board.promotion).to eq(true)
          expect(board.value_from("f8").type).to eq(:queen)
        end
      end

    end

    context "when is a rook piece" do

      context "when is a valid move to an empty position" do
        it "moves a piece to the new position" do
          board.fill_square("a2",nil)
          moved = board.move_piece(white_pieces[:rook],"a4")
          expect(moved).to eq(true)
          expect(board.value_from("a4")).to eq(white_pieces[:rook])
        end
      end

      context "when is a valid capture move" do
        it "allows the capture move to occur" do
          board.fill_square("a2",nil)
          board.fill_square("a2",black_pieces[:rook])
          expect(board.move_piece(white_pieces[:rook],"a2")).to eq(true)
        end
      end

      context "when is an invalid move to a position that is not possible move" do
        it "doesn't moves the piece to the new position" do
          expect(board.move_piece(white_pieces[:rook],"b2")).to eq(false)
        end
      end

    end

    context "when is a bishop piece" do

      context "when is a valid move to an empty position" do
        it "moves a piece to the new position" do
          board.fill_square("d2",nil)
          moved = board.move_piece(white_pieces[:bishop],"f4")
          expect(moved).to eq(true)
          expect(board.value_from("f4")).to eq(white_pieces[:bishop])
        end
      end

      context "when is a valid capture move" do
        it "allows to the capture move occurr" do
          board.fill_square("d4",nil)
          board.fill_square("f4",black_pieces[:bishop])
          expect(board.move_piece(white_pieces[:bishop],"f4")).to eq(true)
        end
      end

      context "when is an invalid move to a position that is not possible move" do
        it "doesn't moves the piece to the new position" do
          expect(board.move_piece(white_pieces[:bishop],"c2")).to eq(false)
        end
      end

    end

    context "when is a queen piece" do

      context "when is a valid move to an empty position" do
        it "moves a piece to the new position" do
          board.fill_square("d2",nil)
          moved = board.move_piece(white_pieces[:queen],"d4")
          expect(moved).to eq(true)
          expect(board.value_from("d4")).to eq(white_pieces[:queen])
        end
      end

      context "when is a valid capture move" do
        it "allows to the capture move occurr" do
          board.fill_square("d2",nil)
          board.fill_square("d4",black_pieces[:queen])
          expect(board.move_piece(white_pieces[:queen],"d4")).to eq(true)
        end
      end

      context "when is an invalid move to a position that is not possible move" do
        it "doesn't moves the piece to the new position" do
          expect(board.move_piece(white_pieces[:queen],"e3")).to eq(false)
        end
      end

    end

    context "when is a knight piece" do

      context "when is a valid move to an empty position" do
        it "moves a piece to the new position" do
          moved = board.move_piece(white_pieces[:knight],"c3")
          expect(moved).to eq(true)
          expect(board.value_from("c3")).to eq(white_pieces[:knight])
        end
      end

      context "when is a valid capture move" do
        it "allows to the capture move occurr" do
          board.fill_square("b2",nil)
          board.fill_square("c3",black_pieces[:knight])
          expect(board.move_piece(white_pieces[:knight],"c3")).to eq(true)
        end
      end

      context "when is an invalid move to a position that is not possible move" do
        it "doesn't moves the piece to the new position" do
          expect(board.move_piece(white_pieces[:knight],"d3")).to eq(false)
        end
      end

    end

    context "when is a king piece" do

      context "when is a valid move to an empty position" do
        it "moves a piece to the new position" do
          board.fill_square("e2",nil)
          moved = board.move_piece(white_pieces[:king],"e2")
          expect(moved).to eq(true)
          expect(board.value_from("e2")).to eq(white_pieces[:king])
        end
      end

      context "when is a valid capture move" do
        it "allows to the capture move occurr" do
          board.fill_square("e2",nil)
          board.fill_square("e2",black_pieces[:king])
          expect(board.move_piece(white_pieces[:king],"e2")).to eq(true)
        end
      end

      context "when is an invalid move to a position that is not possible move" do
        it "doesn't moves the piece to the new position" do
          expect(board.move_piece(white_pieces[:king],"e3")).to eq(false)
        end
      end

      context "when is a valid castling move" do

        context "when is a castling to king side" do
          it "allows to the king makes the castling move" do
            board.fill_square("f1",nil)
            board.fill_square("g1",nil)
            expect(board.move_piece(board.value_from("e1"),"g1")).to eq(true)
          end
        end

        context "when is a castling to queen side" do
          it "allows to the king makes the castling move" do
            board.fill_square("d1",nil)
            board.fill_square("c1",nil)
            board.fill_square("b1",nil)
            expect(board.move_piece(board.value_from("e1"),"c1")).to eq(true)
          end
        end

      end

      context "when is an invalid castling move" do

        context "when there is a piece between the king and the rook" do
          it "doesn't allow that the castling move to be done" do
            board.fill_square("g1",nil)
            expect(board.move_piece(board.value_from("e1"),"g1")).to eq(false)
          end
        end

        context "when the rook already made a move" do
          it "doesn't allow that the castling move to be done" do
            board.fill_square("h2",nil)
            board.move_piece(board.value_from("h1"),"h2")
            board.move_piece(board.value_from("h2"),"h1")
            expect(board.move_piece(board.value_from("e1"),"g1")).to eq(false)
          end
        end

        context "when the king already made a move" do
          it "doesn't allow that the castling move to be done" do
            board.fill_square("e2",nil)
            board.move_piece(board.value_from("e1"),"e2")
            board.move_piece(board.value_from("e2"),"e1")
            expect(board.move_piece(board.value_from("e1"),"g1")).to eq(false)
          end
        end

      end

    end

  end

  describe '#check' do

    context "when the king is under attack" do

      context "when there is no piece between the attacker and the king" do

        it "indicates the situation to the owner player of the king" do
          clear_board
          board.fill_square("c6",black_pieces[:king])
          black_pieces[:king].position = "c6"

          board.fill_square("c2",white_pieces[:rook])
          white_pieces[:rook].position = "c2"
          board.fill_square("e1",white_pieces[:king])

          expect(board.check?(players[:player1],black_pieces[:king])).to eq(true)
        end

      end

    end

    context "when there is a piece between the attacker and the king" do

      it "no indicates that the king is in check" do
        clear_board
        board.fill_square("c6",black_pieces[:king])
        black_pieces[:king].position = "c6"
        board.fill_square("c4",black_pieces[:pawn])
        black_pieces[:pawn].position = "c4"

        board.fill_square("c2",white_pieces[:rook])
        white_pieces[:rook].position = "c2"
        board.fill_square("e1",white_pieces[:king])

        expect(board.check?(players[:player1],black_pieces[:king])).to eq(false)

      end

    end

  end
end
