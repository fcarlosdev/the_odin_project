require "./queen.rb"

describe "Queen" do

  let(:queen) {Queen.new(:light_white)}
  let(:new_pos) {"Kd4"}

  def set_current_position
    queen.current_pos = new_pos
  end

  describe "#new" do
    it "creates a new piece of queen" do
      expect(queen).to be_instance_of(Queen)
    end
  end

  describe "#move_to" do

    before do
      set_current_position
    end

    context "When is valid move" do
      it "moves the queen to the position " do
        expect(queen.move_to(new_pos)).to eql(new_pos)
      end
    end

    # context "when is invalide move" do
    #
    # end
  end


end
