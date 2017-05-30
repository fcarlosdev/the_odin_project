require "pieces"
require "board"
# require "piece"
# require "pawn"

describe '#Pieces' do

  let(:board) {Board.new}
  let(:pieces) {Pieces.new(board)}
  let(:pieces) {Pieces.new(board)}
  let(:pawn) {Pawn.new(:white,"b2")}
  let(:black_pawn) {Pawn.new(:black,"b3")}

  def set_square(to,with_piece)
    with_piece.position = to
    board.fill_square(to,with_piece)
  end

  describe '#new' do
    it "creates a new instance of Pieces class" do
      expect(Pieces.new(board)).to be_instance_of(Pieces)
    end
  end

  describe '#create_piece' do
    it "creates a new instance of piece of the given type" do
      allow(Pieces).to receive(:create_piece).with(:pawn,:white,"b2").and_return(pawn)
      piece = Pieces.create_piece(:pawn,:white,"b2")
      expect(piece.type).to eq(:pawn)
      expect(piece.color).to eq(:white)
      expect(piece.position).to eq("b2")
    end
  end

  describe '#move' do

    context "when is a valid ordinary move" do

      context "when move the piece forward one square" do
        it "moves the piece to the new position" do
          expect(pieces.move(pawn,"b3")).to eq(true)
        end
      end

      context "when move the piece forward two squares on first move" do
        it "moves the piece to the new position" do
          expect(pieces.move(pawn,"b4")).to eq(true)
        end
      end

    end

    context "when is an ordinary move and the destiny place is filled" do
      it "doesn't moves the piece to the new position" do
        set_square("b3",black_pawn)
        expect(pieces.move(pawn,"b3")).to eq(false)
      end
    end

    context "when is a capture valid move" do
      it "makes the capture move" do
        set_square("c3",black_pawn)
        expect(pieces.move(pawn,"c3")).to eq(true)
      end
    end

  end

end
