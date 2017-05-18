require "./lib/pieces/move_pawn.rb"
require "./lib/board.rb"
require "./lib/pieces/pieces.rb"

describe "MovePawn" do

  include Pieces

  let(:board) {Board.new(8,8)}
  let(:move_pawn) {MovePawn.new(board)}
  let(:pieces) {
    {
      white_pawn: create_piece(:pawn,"white","Pf5"),
      white_pawn_2: create_piece(:pawn,"white","Ph2"),
      black_pawn: create_piece(:pawn,"black"),
      white_rook: create_piece(:rook,"white")
    }
  }

  describe '#new' do
    it "creates a new move pawn instance of MovePawn class" do
      expect(move_pawn).to be_instance_of(MovePawn)
    end
  end

  describe '#move' do

    before (:example) do
      board.fill_square("Pf5",pieces[:white_pawn])
    end

    context "when is a valid ordinary move" do
      it "moves the pawn piece to the destiny position" do
        expect(move_pawn.move(pieces[:white_pawn],"Pf5", "Pf6")).to eq(true)
        expect(board.value_from("Pf5")).to be_nil
        expect(board.value_from("Pf6")).to eq(pieces[:white_pawn])
        expect(pieces[:white_pawn].current_position).to eq("Pf6")
      end
    end

    context "when is a valid capture move" do
      it "allows to the pawn piece to capture opponent piece" do
        board.fill_square("Pg6",pieces[:black_pawn])
        expect(move_pawn.move(pieces[:white_pawn],"Pf5", "Pg6")).to eq(true)
        expect(board.value_from("Pf5")).to be_nil
        expect(board.value_from("Pg6")).to eq(pieces[:white_pawn])
        expect(pieces[:white_pawn].current_position).to eq("Pg6")
      end
    end

    context "when is an invalid ordinary move" do

      context "when there is a ally piece on the destiny position" do
        it "doesn't moves the pawn piece to the destiny position" do
          board.fill_square("Pf6",pieces[:white_rook])
          expect(move_pawn.move(pieces[:white_pawn],"Pf5", "Pf6")).to eq(false)
          expect(pieces[:white_pawn].current_position).to eq("Pf5")
        end
      end

      context "when is a not possible move" do
        it "doesn't moves the pawn piece to the destiny position" do
          expect(move_pawn.move(pieces[:white_pawn],"Pf5", "Pg5")).to eq(false)
        end
      end

      context "when should move to north direction but move to south" do
        it "doesn't moves the pawn piece to the destiny position" do
          expect(move_pawn.move(pieces[:white_pawn],"Pf5", "Pf4")).to eq(false)
        end
      end
    end

    context "when is an invalid capture move" do

      context "when capture position is empty" do
        it "doesn't allows to the pawn piece to capture the opponent piece" do
          expect(move_pawn.move(pieces[:white_pawn],"Pf5", "Pg6")).to eq(false)
        end
      end

      context "when there is an ally piece on capture position" do
        it "doesn't allows to the pawn piece to capture the opponent piece" do
          board.fill_square("Pg6",pieces[:white_rook])
          expect(move_pawn.move(pieces[:white_pawn],"Pf5", "Pg6")).to eq(false)
        end
      end

    end

    describe '#en_passant_move?' do

      context "when is en passant move" do

        context "when a piece make the en passant move" do
          it "allows the piece to make en passant move" do
            pieces[:white_pawn].current_position = "Pf5"
            black_pawn = board.value_from("Pg7")
            move_pawn.move(black_pawn,"Pg7","Pg5")
            expect(move_pawn.move(pieces[:white_pawn],"Pf5","Pg6")).to eq(true)
            expect(board.value_from("Pf5")).to be_nil
            expect(board.value_from("Pg6")).to_not be_nil
            expect(board.value_from("Pg5")).to be_nil
          end
        end

        context "when a piece with en passant move do not it" do

          it "to be not allowed make an en passant move to next move" do
            pieces[:white_pawn_2].current_position = "Ph2"

            pieces[:white_pawn].current_position = "Pf5"
            black_pawn = board.value_from("Pg7")
            move_pawn.move(black_pawn,"Pg7","Pg5")
            move_pawn.move(pieces[:white_pawn_2],"Ph2","Ph3")
            expect(pieces[:white_pawn].en_passant_allowed).to eq(false)
          end

         end

      end

    end


  end

end
