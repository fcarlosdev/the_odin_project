require "./king.rb"
require "./piece.rb"

describe "King" do

  let(:new_pos) {"Kd4"}
  let(:king) {King.new(:light_white)}

  describe "#new" do
    it "creates a new piece king" do
      expect(king).to be_instance_of(King)
    end
  end

  describe "#valid_move?" do
    context "when is a valid move" do
      it "returns true" do
        allow(king).to receive(:valid_move?).with("d","4").and_return(true)        
        expect(king.valid_move?(new_pos)).to eq(true)
      end
    end
    # context "when is an invalid move" do
    #   it "return false" do
    #     expect(king.valid_move?("K4i")).to eq(false)
    #   end
    # end
  end

end
