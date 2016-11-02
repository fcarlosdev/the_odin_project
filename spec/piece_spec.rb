require "./piece.rb"

describe "Piece" do

  let(:symbols) {
      {
       :EMPTY_DISC  => "\u26C1",
       :FILLED_DISC => "\u26C3"
      }
  }

  let(:pieces) {
      [
        Piece.new(:EMPTY_DISC),
        Piece.new(:FILLED_DISC)
      ]
  }

  context "initializing a new piece" do

    it "creates a new piece" do
      expect(pieces[0]).to be_instance_of(Piece)
    end

    it "create new piece with the given symbol" do
      expect(pieces[0].symbol).to eq(symbols[:EMPTY_DISC])
    end

  end

end
