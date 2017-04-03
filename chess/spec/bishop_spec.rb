require './bishop.rb'

describe "Bishop" do

  let(:bishop) {Bishop.new("white",:bishop, "\u2657")}

  describe '#new' do
    it "creates a new intance of the bishop piece" do
      expect(bishop).to be_instance_of(Bishop)
      expect(bishop.color).to eq("white")
      expect(bishop.type).to eq(:bishop)
      expect(bishop.image).to eq("♗")
    end
  end

  describe '#possible_moves' do
    it "calculates the possible moves from given initial positon" do
      expect(bishop.possible_moves("Bc1")).to include("Bb2")
      expect(bishop.possible_moves("Bc8")).to include("Be6")
      expect(bishop.possible_moves("Bc8")).to include("Ba6")
      expect(bishop.possible_moves("Bc1")).to include("Bf4")
    end
  end

  # describe '#valid_move?' do
  #
  #   context "when is a valid move?" do
  #     it "validates the move" do
  #       expect(bishop.valid_move?("Bc1","Bd2")).to eq(true)
  #       expect(bishop.valid_move?("Bc1","Bb2")).to eq(true)
  #     end
  #   end

    # context "when is an invalid move" do
    #   it "invalidates the move" do
    #     expect(bishop.valid_move?("Bc1","Bd1")).to eq(false)
    #   end
    # end

  # end

end
