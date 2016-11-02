require './enumerable_methods'

describe "Enumerable" do

  !let(:values) {[0,1,2,3,4]}
  !let(:values_with_false_element) {[0,1,2,3,4,false]}
  !let(:values_with_nil_element) {[0,1,2,3,4,nil]}

  describe "#my_each" do

    it "returns the elements if a block is given" do
      elements = []
      values.my_each {|e| elements << e*2}
      expect(elements).to eql([0,2,4,6,8])
    end

    it "returns itself if no block is given" do
      expect(values.my_each).to eql(values)
    end

  end

  describe "#my_select" do

    it "returns the elements selecteds if a block given" do
      selecteds = []
      values.my_select {|e| selecteds << e if (e%2==0)}
      expect(selecteds).to eql([0,2,4])
    end

    it "returns itself if no block is given" do
      expect(values.my_select).to eql([0,1,2,3,4])
    end

  end

  describe "#my_all?" do

    context "block is given" do

      it "returns true if the condition is true for all elements" do
        expect(values.my_all?{|e| e < 5}).to eql(true)
      end

      it "returns false if the condition is false for all elements" do
        expect(values.my_all?{|e| e > 5}).to eql(false)
      end

    end

    context "block not given" do
      it "returns true if none of all elements is nil or false " do
        expect(values.my_all?).to eql(true)
      end

      it "returns false if any element is false" do
        expect(values_with_false_element.my_all?).to eql(false)
      end

      it "returns false if any element is nil" do
        expect(values_with_nil_element.my_all?).to eql(false)
      end

    end
  end

  describe "#my_any?" do

    context "block given" do

      it "returns true if the condition is true for any element" do
        expect(values.my_any? {|e| e.even?}).to eql(true)
      end

      it "returns false if the condition is false for all elements" do
        expect(values.my_any? {|e| e > 5 }).to eql(false)
      end

    end

    context "block not given" do

      it "returns true if at least one element is not false or nil" do
        expect([false,false,1].my_any?).to eql(true)
      end

      it "returns false if all elements false or nil" do
        expect([false,nil].my_any?).to eql(false)
      end

    end

  end

  describe "#my_one?" do

    context "block given" do

      it "return true if the condition is false for all elements" do
        expect(values.my_none?{|x| x > 5}).to eql(true)
      end

      it "return false if the condition is true for any element" do
        expect(values.my_none?{|x| x == 4}).to eql(false)
      end

    end

    context "block not given" do

      it "return true if all elements is false" do
        expect([false,false].my_none?).to eql(true)
      end

      it "return false if any element is true" do
        expect([false,nil,1].my_none?).to eql(false)
      end

    end

  end

  describe "#count" do

    context "a argument is given" do

      it "returns the number of elements equals to the argument" do
        values << 1
        expect(values.count(1)).to eql(2)
      end

    end

    context "a argument is not given" do

      it "counts the number of elements on the enumeration" do
        expect(values.count).to eql(5)
      end

    end

    context "block given" do

      it "counts the number of elements for that the codition is true" do
        expect(values.count {|e| e%2==0}).to eql(3)
      end

    end

  end

end
