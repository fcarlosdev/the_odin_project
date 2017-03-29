require './player.rb'

describe "Player" do

  let(:player) {Player.new("Player1","white")}

  describe '#new' do
    it "creates a new instace of player" do
      expect(player).to be_instance_of(Player)
      expect(player.name).to eq("Player1")
      expect(player.color_of_piece).to eq("white")
    end
  end

  describe '#his_piece?' do

    context "when the piece is the same color of his pieces" do
      it "confirms that the piece is yours" do
        expect(player.his_piece?("white")).to eq(true)
      end
    end

    context "when the piece is not the same color of his pieces" do
      it "doesn't confirms that the piece is yours" do
        expect(player.his_piece?("color")).to eq(false)
      end
    end
  end

end
