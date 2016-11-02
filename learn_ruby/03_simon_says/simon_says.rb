def echo(word)
  word
end

def shout(word)
  word.upcase
end

def repeat(word, times=2)
  ("#{word} " * times).chop
end

def start_of_word(word,pos)
  word[0..pos-1]
end

def first_word(words)
  words[0..words.index(" ")-1]
end

def titleize(sentence)

  words_capitalized = ""
  words = sentence.split(" ")

  words.each_with_index do |word,index|
    if (index == 0 || index == words.length - 1 || word.length > 4)
       words_capitalized += word.capitalize + " "
    elsif word.length <= 4
       words_capitalized += word + " "
    end
  end
  return words_capitalized.chop
end
