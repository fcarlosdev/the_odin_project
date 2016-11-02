require "./cell.rb"

describe "Cell" do

  subject(:cell) {Cell.new()}

  describe "#new" do

    it "creates a new cell" do
      expect(Cell.new).to be_instance_of(Cell)
    end

  end

  describe "#cell" do

    context "when cell has no value" do

      it "returns the default value" do
        expect(cell.value).to eql("")
      end

    end

    context "when cell has a value" do

      let(:value) {"value"}

      before do
        cell.value = value
      end

      it "returns the value" do
        expect(cell.value).to eql(value)
      end

    end

  end

end
