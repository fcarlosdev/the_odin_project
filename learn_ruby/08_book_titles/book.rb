class Book

  def title
    @title
  end

  def title=(words)
    words_capitalized = ""
    words.split(" ").each do |word|
      if !word.match(/\band\b|\bin\b|\ban\b|\ba\b|\bon\b|\bof\b|\bthe\b/) || words_capitalized.length <= 1
        words_capitalized += word.capitalize.concat(" ")
      else
        words_capitalized += word.concat(" ")
      end
    end
    @title = words_capitalized.chop
  end
end
