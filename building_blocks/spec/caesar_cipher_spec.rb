require './caesar_cipher'

describe "Caesar Cipher" do

  def load_cipher(word,key)
    ciphred_characteres = cipher(word,key)
    ciphred_characteres
  end

  context "with the word or a letter and a key provided" do

      it "cipher the given word by a key" do
        expect(load_cipher("tomorrow",7)).to eq("avtvyyvd")
      end

      it "cipher the given letter by a key" do
        expect(load_cipher("m",7)).to eq("t")
      end

      it "cipher the word preserving punctuation characters" do
        expect(load_cipher("hello!",7)).to eq("olssv!")
      end

      it "cipher the word preserving the others characters" do
        expect(load_cipher("hello world!",7)).to eq("olssv dvysk!")
      end

      it "cipher the word preserving the uppercase" do
        expect(load_cipher("HELLO WORLD!",7)).to eq("OLSSV DVYSK!")
      end

      it "cipher the word wrapping the letters from z to a" do
        expect(load_cipher("zeus",1)).to eq("afvt")
      end

      it "cipher the word preserving uppercase and dowcase" do
        expect(load_cipher("Ruby on Rails!",7)).to eql("Ybif vu Yhpsz!")
      end

  end

end
