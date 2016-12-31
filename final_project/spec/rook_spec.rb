require "./rook.rb"

describe "Rook" do

  let(:initial_position) {"Rd5"}
  let(:rook) {Rook.new(:light_white, initial_position)}

  def new_position(current_pos,new_column,new_row)
    new_position = current_pos[0]
    new_position += (current_pos[1].ord + new_column).chr
    new_position += (current_pos[2].to_i + new_row).to_s
  end

  describe "#new" do
    it "creates a new rook" do
      expect(rook).to be_instance_of(Rook)
    end
  end

  describe "#move_to" do

    context "When is a valid move" do
      it "changes the position of the hook" do
        Rh5 = new_position(rook.current_pos,4,0)
        Ra5 = new_position(rook.current_pos,-3,0)
        Rd0 = new_position(rook.current_pos,0,3)
        Rd7 = new_position(rook.current_pos,0,-3)
        expect(rook.move_to(Rh5)).to eq(rook.current_pos)
        expect(rook.move_to(Ra5)).to eq(rook.current_pos)
        expect(rook.move_to(Rd0)).to eq(rook.current_pos)
        expect(rook.move_to(Rd7)).to eq(rook.current_pos)
      end
    end

    context "When is an invalid move" do
      it "doesn't changes the position of the hook" do
        expect(rook.move_to("Re6")).to eq(initial_position)
      end
    end
    
  end

end
