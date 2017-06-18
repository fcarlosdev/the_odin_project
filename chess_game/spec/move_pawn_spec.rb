require "./lib/move_pawn"
require "./lib/board_new"

describe "MovePawn" do

  let(:board) {Board_New.new}
  let(:move_pawn) {MovePawn.new(board)}
  let(:positions) {{b2: "b2", b3: "b3", b4: "b4", b6: "b6",
                    b5: "b5", b7: "b7", c2: "c2", c3: "c3",
                    c4: "c4", c5: "c5", d3: "d3", d4: "d4"}}
  let(:pieces) {
    {white_pawn: Pawn_New.new(:white,positions[:b2]),
     white_pawn_2: Pawn_New.new(:white,positions[:b3]),
     black_pawn: Pawn_New.new(:black,positions[:b7])}
  }


  describe '#new' do
    it "create a new instance of MovePawn class" do
      expect(MovePawn.new(board)).to be_instance_of(MovePawn)
    end
  end

  describe '#move' do

    context "when forward move" do

      context "when is a possible move" do
        it "moves the piece to the new position" do
          expect(move_pawn.move(pieces[:white_pawn],positions[:b3])).to eq(true)
          expect(board.value_from("b3")).to eq(pieces[:white_pawn])
        end
      end

      context "when move two positions at first move" do
        it "moves the piece to the new position" do
          expect(move_pawn.move(pieces[:white_pawn],positions[:b4])).to eq(true)
        end
      end

      context "when move two positions and no first move" do
        it "doesn't moves the piece to the new position" do
          pieces[:white_pawn].increment_moves
          expect(move_pawn.move(pieces[:white_pawn],positions[:b4])).to eq(false)
        end
      end

      context "when move more than two positions in the first move" do
        it "doesn't moves the piece to the new position" do
          pieces[:white_pawn].increment_moves
          expect(move_pawn.move(pieces[:white_pawn],positions[:b5])).to eq(false)
        end
      end

      context "when is an impossible move" do
        it "doesn't moves the piece to the new position" do
          expect(move_pawn.move(pieces[:white_pawn],positions[:c2])).to eq(false)
        end
      end

      context "when there is a piece at the end position" do
        it "doesn't moves the piece to the new position" do
          board.fill_square(positions[:b3],pieces[:black_pawn])
          expect(move_pawn.move(pieces[:white_pawn],positions[:b3])).to eq(false)
        end
      end

    end

    context "when is a capture move" do

      context "when is a possible capture move" do
        it "allows the piece to make the capture move" do
          board.fill_square(positions[:c3],pieces[:black_pawn])
          expect(move_pawn.move(pieces[:white_pawn],positions[:c3])).to eq(true)
          expect(board.value_from(:c3)).to eq(pieces[:white_pawn])
        end
      end

      context "when is a possible capture move to a position with an ally piece" do
        it "doesn't allows that the capture move to be made" do
          board.fill_square(positions[:c3],pieces[:white_pawn_2])
          expect(move_pawn.move(pieces[:white_pawn],positions[:c3])).to eq(false)
        end
      end

      context "when is a possible capture move to an empty position" do
        it "doesn't allows that the capture move to be made" do
          expect(move_pawn.move(pieces[:white_pawn],positions[:c3])).to eq(false)
        end
      end

      context "when try to make a capture move moving more than one position" do
        it "doesn't allows that the capture move to be made" do
          expect(move_pawn.move(pieces[:white_pawn],positions[:d4])).to eq(false)
        end
      end

      context "when is an invalid capture position" do
        it "doesn't allows that the capture move to be made" do
          expect(move_pawn.move(pieces[:white_pawn],positions[:d3])).to eq(false)
        end
      end

    end

    context "when is an en passant move" do

      context "when is valid en passant move" do
        it "allows that the piece to make the move" do
          board.fill_square(positions[:c2],pieces[:black_pawn])
          pieces[:white_pawn].en_passant = true
          expect(move_pawn.move(pieces[:white_pawn],positions[:c3])).to eq(true)
          expect(board.value_from(positions[:c3])).to eq(pieces[:white_pawn])
          expect(board.value_from(positions[:c2])).to be_nil
        end
      end

      # context "when has no opponent piece at beside position" do
      #   it "doesn't allows that the piece to make the move" do
      #     expect(pieces[:white_pawn].move(positions[:c3],board)).to eq(false)
      #   end
      # end

    end

  end

end
