require "./lib/move_pawn"
require "./lib/board"

describe "MovePawn" do

  let(:board) {Board.new}
  let(:move_pawn) {MovePawn.new(board)}
  let(:positions) {{a5: "a5", b2: "b2", b3: "b3", b4: "b4",
                    b5: "b5", b6: "b6", b7: "b7", c2: "c2",
                    c3: "c3", c4: "c4", c5: "c5", c6: "c6",
                    c7: "c7", d3: "d3", d4: "d4"}}
  let(:pieces) {
    {white_pawn: Pawn.new(:white,positions[:b2]),
     white_pawn_2: Pawn.new(:white,positions[:b3]),
     black_pawn: Pawn.new(:black,positions[:c7])}
  }


  describe '#new' do
    it "create a new instance of MovePawn class" do
      expect(MovePawn.new(board)).to be_instance_of(MovePawn)
    end
  end

  describe '#move' do

    context "when is a valid forward move" do

      context "when move one forward positon" do
        it "moves the pawn piece to the new position" do
          expect(move_pawn.move(pieces[:white_pawn],positions[:b3])).to eq(true)
          expect(board.value_from(positions[:b3])).to eq(pieces[:white_pawn])
        end
      end

      context "when move two forward position on the first move" do
        it "moves the pawn piece to the new position" do
          expect(move_pawn.move(pieces[:white_pawn],positions[:b4])).to eq(true)
          expect(board.value_from(positions[:b4])).to eq(pieces[:white_pawn])
        end
      end
    end

    context "when is a valid capture move" do
      it "allows the pawn move to capture the opponent piece" do
        board.fill_square(positions[:c3],pieces[:black_pawn])
        expect(move_pawn.move(pieces[:white_pawn],positions[:c3])).to eq(true)
        expect(board.value_from(positions[:c3])).to eq(pieces[:white_pawn])
      end
    end

    context "when is a valid en passant move" do
      it "allows the pawn piece to make the en passant move" do
        pieces[:white_pawn].position = positions[:b5]
        board.fill_square( positions[:b5],pieces[:white_pawn])
        move_pawn.move(pieces[:black_pawn],positions[:c5])
        expect(move_pawn.move(pieces[:white_pawn],positions[:c6])).to eq(true)
        expect(board.value_from(positions[:c6])).to eq(pieces[:white_pawn])
      end
    end

  end

end
