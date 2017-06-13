require "pawn"
require "board_new"
require "./lib/forward_move"
require "./lib/diagonal_move"


describe "Pawn_New" do

  let(:board) {Board_New.new}
  let(:positions) {{b2: "b2", b3: "b3", b4: "b4", b7: "b7",
                    c2: "c2", c3: "c3", c4: "c4"}}
  let(:pieces) {
    {white_pawn: Pawn_New.new(:white,positions[:b2]),
     white_pawn_2: Pawn_New.new(:white,positions[:b3]),
     black_pawn: Pawn_New.new(:black,positions[:b7])}
  }

  def clear_board
    board.squares.each do |square|
      square.each do |value|
        board.fill_square(value.position,nil) if !value.nil?
      end
    end
  end

  def initialize_board
    board.fill_square(positions[:b2],pieces[:white_pawn])
    board.fill_square(positions[:b7],pieces[:black_pawn])
  end

  describe '#new' do
    it "creates a new instance of Pawn class" do
      expect(Pawn_New.new(:white,positions[:b2])).to be_instance_of(Pawn_New)
    end
  end

  describe '#move' do

    # context "when is a valid forward move" do
    #   it "moves the piece to the new position" do
    #     expect(pieces[:white_pawn].move(positions[:b3],board)).to eq(true)
    #   end
    # end
    #
    # context "when is an invalid forward move" do
    #   it "doesn't moves the piece to the new position" do
    #     expect(pieces[:white_pawn].move(positions[:c2],board)).to eq(false)
    #   end
    # end
    #
    # context "when the destiny position is filled" do
    #   it "doesn't moves the piece to the new position" do
    #     board.fill_square(positions[:b3],pieces[:black_pawn])
    #     expect(pieces[:white_pawn].move(positions[:b3],board)).to eq(false)
    #   end
    # end
    #
    # context "when is a valid capture move" do
    #   it "captures the opponent piece" do
    #     board.fill_square(positions[:c3],pieces[:black_pawn])
    #     expect(pieces[:white_pawn].move(positions[:c3],board)).to eq(true)
    #   end
    # end
    #
    # context "when is a capture move to an empty destiny" do
    #   it "doesn't moves the piece to the destiiny" do
    #     expect(pieces[:white_pawn].move(positions[:c3],board)).to eq(false)
    #   end
    # end
    #
    # context "when is a capture move to a position where there is a ally piece" do
    #   it "doesn't moves the piece to the destiiny" do
    #     board.fill_square(positions[:c3],pieces[:white_pawn_2])
    #     expect(pieces[:white_pawn].move(positions[:c3],board)).to eq(false)
    #   end
    # end
    #
    # context "when is a valid en passant move" do
    #   it "allows the piece to do the move" do
    #     pieces[:white_pawn].en_passant = true
    #     board.fill_square(positions[:c2],pieces[:black_pawn])
    #     expect(pieces[:white_pawn].move(positions[:c3],board)).to eq(true)
    #     expect(board.value_from(positions[:c3])).to eq(pieces[:white_pawn])
    #     expect(board.value_from(positions[:c2])).to be_nil
    #   end
    # end

    context "when is a valid forward move that cause en passant move" do
      it "enables the en passant move to opponents beside that piece" do
        clear_board
        initialize_board
        board.fill_square(positions[:c4],pieces[:black_pawn])
        pieces[:black_pawn].position = positions[:c4]
        pieces[:black_pawn].move(positions[:c2],board)
        expect(pieces[:white_pawn].en_passant).to eq(true)
      end
    end

  end

end
