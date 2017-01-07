require "./knight.rb"

describe "Knight" do

  let(:initial_position) {"Nd4"}
  let(:knight) {Knight.new(:light_white,initial_position)}

  describe "#new" do
    it "Create a new knight piece" do
      expect(knight).to be_instance_of(Knight)
    end
  end

  describe "#move_to" do

    context "When is valid move" do
      it "moves the knight to the new position" do
        expect(knight.move_to("Nc6")).to eql(knight.current_pos)
      end
    end

    context "When is an invalid move" do
      it "doesn't moves the knight to the new position" do
        expect(knight.move_to("Nf6")).to_not eql("Nf6")
      end
    end
  end

end
