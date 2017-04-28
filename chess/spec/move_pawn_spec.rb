require "./move_pawn.rb"
require "./board.rb"
require "./modules/pieces.rb"

describe "MovePawn" do

  include Pieces

  let(:board) {Board.new(8,8)}
  let(:move_pawn) {MovePawn.new(board)}
  let(:pieces) {
    {
      white_pawn: get_piece(:white_pawn),
      black_pawn: get_piece(:black_pawn),
      white_rook: get_piece(:white_rook)
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
        expect(board.get_piece("Pf5")).to be_nil
        expect(board.get_piece("Pf6")).to eq(pieces[:white_pawn])
      end
    end

    context "when is a valid capture move" do
      it "allows to the pawn piece to capture opponent piece" do
        board.fill_square("Pg6",pieces[:black_pawn])
        expect(move_pawn.move(pieces[:white_pawn],"Pf5", "Pg6")).to eq(true)
        expect(board.get_piece("Pf5")).to be_nil
        expect(board.get_piece("Pg6")).to eq(pieces[:white_pawn])
      end
    end

    context "when is an invalid ordinary move" do

      context "when there is a ally piece on the destiny position" do
        it "doesn't moves the pawn piece to the destiny position" do
          board.fill_square("Pf6",pieces[:white_rook])
          expect(move_pawn.move(pieces[:white_pawn],"Pf5", "Pf6")).to eq(false)
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

    context "when is a valid en passant move" do
      it "allows the pawn piece to capture the opponent piece" do
        board.fill_square("Pg7",pieces[:black_pawn])
        move_pawn.move(board.get_piece("Pg7"),"Pg7","Pg5")
        expect(move_pawn.move(pieces[:white_pawn],"Pf5","Pg6")).to eq(true)
        expect(board.get_piece("Pf5")).to be_nil
        expect(board.get_piece("Pg6")).to_not be_nil
        expect(board.get_piece("Pg5")).to be_nil
      end
    end

    context "when lost the chance of en passant move" do
      it "doesn't allows the pawn piece to capture the opponent piece" do
        board.fill_square("Pg7",pieces[:black_pawn])
        move_pawn.move(board.get_piece("Pg7"),"Pg7","Pg5")
        move_pawn.move(board.get_piece("Pa2"),"Pa2","Pa3")
        expect(move_pawn.move(pieces[:white_pawn],"Pf5","Pg6")).to eq(false)
      end
    end

  end


end
