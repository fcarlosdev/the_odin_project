require './lib/pieces/piece.rb'
require './lib/pieces/pieces.rb'

describe "Piece" do

  include Pieces

  let(:king) {create_piece(:king,"white")}

  describe '#new' do
    it "creates a new instance of piece" do
      expect(king).to be_instance_of(King)
      expect(king.is_a?(Piece)).to eq(true)
    end
  end

end
