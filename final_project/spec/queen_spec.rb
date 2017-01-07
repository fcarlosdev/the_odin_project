require "./queen.rb"

describe "Queen" do

  let(:initial_position) {"Qd4"}
  let(:queen) {Queen.new(:light_white,initial_position)}

  def set_current_position
    queen.current_pos = new_pos
  end

  describe "#new" do
    it "creates a new piece of queen" do
      expect(queen).to be_instance_of(Queen)
    end
  end

  describe "#move_to" do

    context "When is a valid rank move" do
      it "moves the queen along to the rank to the new position" do
        expect(queen.move_to("Qd5")).to eql(queen.current_pos)
      end
    end

    context "When is a valid file move" do
      it "moves the queen along the file to the new position" do
        expect(queen.move_to("Qh4")).to eql(queen.current_pos)
      end
    end

    context "When is a valid diagonal move" do
      it "moves the queen along the diagonal to the new position" do
        expect(queen.move_to("Qh8")).to eql(queen.current_pos)
      end
    end

    context "When is an invalid rank move" do
      it "Doesn't moves the queen along the rank to the new position" do
        expect(queen.move_to("Qe6")).to_not eql("Qe6")
      end
    end

    context "When is an invalid file move" do
      it "Doesn't moves the queen along the file to the new position" do
        expect(queen.move_to("Qd9")).to_not eql("Qd9")
      end
    end

    context "When is an invalid diagonal move" do
      it "Doesn't moves the queen along the diagonal to the new position" do
        expect(queen.move_to("Qf5")).to_not eql("Qf5")
      end
    end
    
  end

end
