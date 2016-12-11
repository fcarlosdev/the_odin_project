require './square.rb'

describe "Square" do

  let(:square) {Square.new}

  let(:empty_white_square) {
    "▏      ▏
     ▏      ▏
     ▏      ▏"
  }

  let(:full_white_square) {
    "▏      ▏
     ▏\u2654 ▏
     ▏      ▏"
  }

  let(:empty_black_square) {
    "▓▓▓▓▓▓▓
     ▓▓   ▓▓
     ▓▓▓▓▓▓▓"
   }

  let(:full_black_square) {
    "▓▓▓▓▓▓▓
     ▓▓ \u265A ▓▓
     ▓▓▓▓▓▓▓"
   }

  describe "#new" do
    it "creates a new square" do
      expect(square).to be_instance_of(Square)
    end
  end

  describe "#create" do

    context "when it's a white square with no content" do
      it "shows a empty white square" do
        expect(square.create).eql?(:empty_white_square)
      end
    end

    context "when it's a white square with a content" do
      it "shows a full white square" do
        expect(square.create).eql?(:full_white_square)
      end
    end

    context "when it's a black square with no content" do
      it "shows a empty black square" do
        expect(square.create).eql?(:empty_black_square_square)
      end
    end

    context "when it's a black square with content" do
      it "shows a full black square" do
        expect(square.create).eql?(:full_black_square_square)
      end
    end

  end

end
