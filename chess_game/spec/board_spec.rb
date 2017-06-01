require 'board'
require 'colorize'
require 'piece'

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

    end

  end

end
