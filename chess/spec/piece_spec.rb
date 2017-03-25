require './piece.rb'

describe 'Piece' do

  let(:piece) {
    Piece.new({color: "black", position: "Ke8"})
  }

  describe '#new' do
    it "creates a new piece" do
      expect(piece).to be_instance_of(Piece)
      expect(piece.color).to eq("black")
      expect(piece.position).to eq("Ke8")
      expect(piece.first_move).to eq(true)
    end
  end

end
