def cipher(text, shift)
  text_ciphered = "";
  regex_letters_down_case = /[a-z]/
  regex_letters =/[a-zA-Z]/
  text.each_char do |l|
    if ( l.match(regex_letters))
      first_letter = (l.match(regex_letters_down_case)? 96 : 64)
      last_letter = (l.match(regex_letters_down_case)? 122 : 90)
      grather_than_last_pos = (l.ord + shift) - last_letter

      if ( grather_than_last_pos > 0)
        text_ciphered += (first_letter + grather_than_last_pos).chr
      else
        text_ciphered += (l.ord + shift).chr
      end
    else
      text_ciphered += l
    end
  end
  text_ciphered
end
