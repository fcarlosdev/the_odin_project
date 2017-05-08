require './lib/pieces/queen.rb'

describe "Queen" do

  let(:queen) {Queen.new("white",:queen)}
  let(:positions) {
    [ "Qe3","Qf2","Qg1","Qe5","Qf6","Qg7","Qh8",
      "Qc3","Qb2","Qa1","Qd5","Qd6","Qd7","Qd8",
      "Qd3","Qd2","Qd1","Qe4","Qf4","Qg4","Qh4",
      "Qc4","Qb4","Qa4"]
  }

  describe '#new' do
    it "creates a new intance of the Queen piece" do
      expect(queen).to be_instance_of(Queen)
      expect(queen.color).to eq("white")
      expect(queen.type).to eq(:queen)
      expect(queen.image).to eq("♕")
    end
  end

  describe '#possible_moves' do

    it "calculates the possible moves from given initial positon" do
      positions.each do |position|
        expect(queen.possible_moves("Qd4")).to include(position)
      end
    end
  end

  describe '#valid_move?' do

    context "when is a valid move?" do
      it "validates the move" do
        positions.each do |position|
          expect(queen.valid_move?("Qd4",position)).to eq(true)
        end
      end
    end

    context "when is an invalid move" do
      it "invalidates the move" do
        expect(queen.valid_move?("Qd4","Qe6")).to eq(false)
      end
    end

  end

end
