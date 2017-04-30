require './lib/piece.rb'
require './lib/king.rb'

describe "Piece" do

  let(:king) {King.new("white",:king)}

  describe '#new' do
    it "creates a new instance of piece" do
      expect(king).to be_instance_of(King)
      expect(king.is_a?(Piece)).to eq(true)
    end
  end

end
