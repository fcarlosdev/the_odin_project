require "./lib/move_knight.rb"
require "./lib/board.rb"
require "./lib/pieces.rb"

describe "Moveknight" do

  include Pieces

  let(:board) {Board.new(8,8)}
  let(:move_knight) {Moveknight.new(board)}
  let(:pieces) {
    {
      white_knight: get_piece(:white_knight),
      black_knight: get_piece(:black_knight),
      white_pawn: get_piece(:white_pawn)
    }
  }

  describe '#new' do
    it "creates a new instance of Moveknight" do
      expect(move_knight).to be_instance_of(Moveknight)
    end
  end

  describe '#move' do

    before (:example) do
      board.fill_square("Nd4",pieces[:white_knight])
    end

    context "when is a valid ordinary move" do
      it "moves the knight piece to the destiny position" do
        expect(move_knight.move(pieces[:white_knight],"Nd4","Ne6")).to eq(true)
        expect(board.value_from("Nd4")).to be_nil
        expect(board.value_from("Ne6")).to_not be_nil
        expect(board.value_from("Ne6")).to eq(pieces[:white_knight])
      end
    end

    context "when is a valid capture move" do
      it "allows the knight piece to capture the opponent piece" do
        board.fill_square("Ne6",pieces[:black_knight])
        expect(move_knight.move(pieces[:white_knight],"Nd4","Ne6")).to eq(true)
        expect(board.value_from("Nd4")).to be_nil
        expect(board.value_from("Ne6")).to_not be_nil
        expect(board.value_from("Ne6")).to eq(pieces[:white_knight])
      end
    end

    context "when is an invalid ordinary move" do
      it "doesn't moves the knight piece to the destiny position" do
        expect(move_knight.move(pieces[:white_knight],"Nd4","Nd6")).to eq(false)
        expect(board.value_from("Nd4")).to_not be_nil
        expect(board.value_from("Nd6")).to be_nil
      end
    end

    context "when is an invalid capture move" do
      it "doesn't allows the knight piece to capture the opponent piece" do
        board.fill_square("Ne6",pieces[:white_pawn])
        expect(move_knight.move(pieces[:white_knight],"Nd4","Ne6")).to eq(false)
        expect(board.value_from("Nd4")).to eq(pieces[:white_knight])
        expect(board.value_from("Ne6")).to eq(pieces[:white_pawn])
      end
    end

  end



end
