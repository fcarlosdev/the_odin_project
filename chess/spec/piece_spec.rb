require './lib/pieces/piece.rb'
require './lib/helpers/pieces.rb'

describe "Piece" do

  include Pieces

  let(:king) {get_piece(:white_king)}

  describe '#new' do
    it "creates a new instance of piece" do
      expect(king).to be_instance_of(King)
      expect(king.is_a?(Piece)).to eq(true)
    end
  end

end
