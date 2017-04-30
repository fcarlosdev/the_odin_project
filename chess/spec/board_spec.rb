require './lib/board.rb'
require 'colorize'

describe Board do

  let(:board) {Board.new(8,8)}
  let(:squares) {
    [
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil]
    ]
  }

  let(:pieces) {
    {
      black_king:King.new("black", :king),
      white_king:King.new("white", :king),
      black_pawn:Pawn.new("black", :pawn),
      white_pawn:Pawn.new("white", :pawn)
    }
  }

  describe '#new' do
    it "Creates a new board" do
      expect(board).to be_instance_of(Board)
      expect(board.squares.length).to eql(8)
      expect(squares.all?{|line| line.length == 8}).to eql(true)
    end
  end

  describe '#draw_board' do
    it "Draws a board" do
      lines = columns = 8
      expect(board).to receive(:draw_board).with(no_args).exactly(1).times
      expect(board.squares[0][4].color).to eq(pieces[:black_king].color)
      expect(board.squares[0][4].type).to eq(pieces[:black_king].type)
      expect(board.squares[1][2].type).to eq(pieces[:black_pawn].type)
      expect(board.squares[1][7].type).to eq(pieces[:black_pawn].type)
      expect(board.squares[6][7].type).to eq(pieces[:black_pawn].type)
      board.draw_board
    end
  end

  describe '#value_from' do

    context "when is given a valid location" do
      it "returns the piece on square" do
        expect(board.value_from("Pa2")).to_not be_nil
      end
    end

    context "when is given an invalid position" do
      it "returns nil" do
        expect(board.value_from("Pl2")).to be_nil
      end
    end
  end

  describe '#fill_square' do
    it "changes the value of a square" do
      board.fill_square("Pb3",pieces[:black_pawn])
      expect(board.value_from("Pb3")).to_not be_nil
    end
  end

end
