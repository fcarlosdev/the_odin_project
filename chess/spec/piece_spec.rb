require './piece.rb'

describe "Piece" do

  describe '#new' do
    it "raises an error" do
      expect{Piece.new}.to raise_error(RuntimeError,
                            "You are trying to instantiate an abstract class!")
    end
  end

end
