def translate(phrase)

  regex_vowels = /^(a|A)|^(e|E)|^(i|I)|^(o|O)|^(u|U){1}/
  regex_qu = /qu|Qu/
  regex_punct = /[\.,;!?-]/

  words = ""
  phrase.split(" ").each do|word|
    index_punct    = word.index(regex_punct)
    first_vowel    = word.index(/[aeiou|AEIOU]/)
    capital_letter = (word.match(/^(B|D|C|D|F|G|H|J|K|L|M|N|P|Q|R|S|T|V|W|X|Y|Z)/))
    letters_only   = (index_punct != nil ? word.delete(word[index_punct]) : word)

    words.concat(letters_only.match(regex_vowels)? letters_only.concat("ay") : "" )

    words.concat(letters_only.match(regex_qu) ? letters_only.delete(word[0..first_vowel]).concat(word[0..first_vowel]).concat("ay"): "")

    words.concat(!letters_only.match(regex_vowels) && !letters_only.match(regex_qu) ? letters_only.delete(letters_only[0..first_vowel-1]).concat(letters_only[0..first_vowel-1]).concat("ay") :"" )

    words.split(/[, \t\n]/).each do |w|
      if w.match(/[BDCDFGHJKLMNPQRSTVWXYZ]/)
        words.gsub!(w,w.capitalize)
      end
    end
    words.concat(index_punct != nil ? word[index_punct] : "").concat(" ")
  end
  words.chop
end
