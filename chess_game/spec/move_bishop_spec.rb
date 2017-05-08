require "./lib/pieces/move_bishop.rb"
require "./lib/pieces/pieces.rb"
require "./lib/board.rb"

describe "MoveBishop" do

  include Pieces

  let(:board) {Board.new(8,8)}
  let(:move_bishop) {MoveBishop.new(board)}
  let(:pieces) {
    {
      white_bishop: create_piece(:bishop,"white"),
      black_bishop: create_piece(:bishop,"black"),
      white_pawn:   create_piece(:pawn,"white")
    }
  }

  describe '#new' do
    it "creates a new instance of MoveBishop" do
      expect(move_bishop).to be_instance_of(MoveBishop)
    end
  end

  describe '#move' do

    before(:example) do
      board.fill_square("Bd5",pieces[:white_bishop])
    end

    context "when is a valid ordinary move" do
      it "moves the bishop piece to the given destiny position" do
        expect(move_bishop.move(pieces[:white_bishop],"Bd5","Be6")).to eq(true)
        expect(board.value_from("Bd5")).to be_nil
        expect(board.value_from("Be6")).to_not be_nil
        expect(board.value_from("Be6")).to eq(pieces[:white_bishop])
      end
    end

    context "when is a capture valid move" do
      it "allows the bishop piece to capture opponent piece" do
        board.fill_square("Be6",pieces[:black_bishop])
        expect(move_bishop.move(pieces[:white_bishop],"Bd5","Be6")).to eq(true)
        expect(board.value_from("Bd5")).to be_nil
        expect(board.value_from("Be6")).to_not be_nil
        expect(board.value_from("Be6")).to eq(pieces[:white_bishop])
      end
    end

    context "when is an invalid ordinary move" do
      it "doesn't moves the bishop piece to the given destiny position" do
        expect(move_bishop.move(pieces[:white_bishop],"Bd5","Be5")).to eq(false)
        expect(board.value_from("Bd5")).to_not be_nil
        expect(board.value_from("Be5")).to be_nil
      end
    end

    context "when is an invalid capture move" do
      it "allows the bishop piece to do the capture move" do
        board.fill_square("Be6",pieces[:white_pawn])
        expect(move_bishop.move(pieces[:white_bishop],"Bd5","Be6")).to eq(false)
        expect(board.value_from("Bd5")).to eq(pieces[:white_bishop])
        expect(board.value_from("Be6")).to eq(pieces[:white_pawn])
      end
    end

    context "when there is an piece between the origin and destiiny positions" do
      it "doesn't allows the moves the bishop piece to the destiny position" do
        board.fill_square("Bd6",pieces[:white_pawn])
        expect(move_bishop.move(board.value_from("Bd5"),"Bd5","Bd8")).to eq(false)
      end
    end


  end

end
