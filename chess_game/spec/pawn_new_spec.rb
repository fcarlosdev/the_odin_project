require "pawn"
require "board_new"
require "./lib/forward_move"
require "./lib/diagonal_move"


describe "Pawn_New" do

  let(:board) {Board_New.new}
  let(:positions) {
    {b2: "b2", b3: "b3", b4: "b4", b7: "b7", c2: "c2", c3: "c3" }
  }
  let(:movements) {{forward: ForwardMove.new, diagonal: DiagonalMove.new}}
  let(:pieces) {
    {white_pawn: Pawn_New.new(:white,positions[:b2],movements),
     black_pawn: Pawn_New.new(:black,positions[:b7],movements)}
  }

  def clear_board
    board.squares.each do |square|
      square.each do |value|
        if !value.nil?
          board.fill_square(value.position,nil)
        end
      end
    end
  end

  def initialize_board
    board.fill_square(positions[:b2],pieces[:white_pawn])
    board.fill_square(positions[:b7],pieces[:black_pawn])
  end

  describe '#new' do
    it "creates a new instance of Pawn class" do
      expect(Pawn_New.new(:white,positions[:b2],movements)).to be_instance_of(Pawn_New)
    end
  end

  describe '#Move' do

    before (:example) do
      clear_board
      initialize_board
    end

    context "when is a valid forward move" do
      it "moves the piece to the new position" do
        expect(pieces[:white_pawn].move(positions[:b3],board)).to eq(true)
        expect(board.value_from(positions[:b2])).to be_nil
        expect(board.value_from(positions[:b3])).to_not be_nil
        expect(board.value_from(positions[:b3])).to eq(pieces[:white_pawn])
      end
    end

    context "when is an invalid forward move" do
      it "doesn't moves the piece to the new position" do
        board.fill_square(positions[:b3],pieces[:black_pawn])
        expect(pieces[:white_pawn].move(positions[:b3],board)).to eq(false)
      end
    end

    context "when is the first move and move two positions" do
      it "moves the piece to the new position" do
        expect(pieces[:white_pawn].move(positions[:b4],board)).to eq(true)
      end
    end

    context "when is a valid capture move" do
      it "allows that the piece make the capture move" do
        board.fill_square(positions[:c3],pieces[:black_pawn])
        expect(pieces[:white_pawn].move(positions[:c3],board)).to eq(true)
        expect(board.value_from(positions[:b2])).to be_nil
        expect(board.value_from(positions[:c3])).to eq(pieces[:white_pawn])
      end
    end

    context "when is a invalid capture move" do
      it "allows that the piece make the capture move" do
        expect(pieces[:white_pawn].move(positions[:c3],board)).to eq(false)
      end
    end

    context "when is a valid en passant move" do
      it "allows that the piece make the en passant move" do
        board.fill_square(positions[:c2],pieces[:black_pawn])
        expect(pieces[:white_pawn].move(positions[:c3],board)).to eq(true)
        expect(board.value_from(positions[:b2])).to be_nil
        expect(board.value_from(positions[:c3])).to eq(pieces[:white_pawn])
        expect(board.value_from(positions[:c2])).to be_nil
      end
    end

  end

end
