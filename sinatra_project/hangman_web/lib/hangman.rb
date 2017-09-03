require 'yaml'

class Hangman

  attr_reader :secret_word, :hidden_letters, :guess_number, :wrong_letters

  def initialize
    @secret_word    = get_words_from_file.sample.downcase
    @hidden_letters = []
    @wrong_letters  = []
    @guess_number   = 0
  end

  def check_letter(letter)
    draw_hidden_letters(letter)
    if @guess_number < 6 && @hidden_letters.join("") != @secret_word
      draw_wrong_letters if !@secret_word.include?(letter)
    elsif @guess_number < 6 && @hidden_letters.join("") == @secret_word
      return :won
    else
      return :game_over
    end
  end

  def show_hidden_letters
    (@hidden_letters.length > 0) ? @hidden_letters.join(" ") : "_ " * @secret_word.length
  end

  protected

  def draw_hidden_letters(entered_letter)
    if @secret_word.include?(entered_letter)
      for index in 0..@secret_word.length-1 do
        if @secret_word[index] != entered_letter && @hidden_letters[index] == nil
          @hidden_letters[index] = "_"
        elsif @secret_word[index] == entered_letter
          @hidden_letters[index] = entered_letter
        end
      end
    else
      @guess_number += 1
      @wrong_letters.push(entered_letter) if !@wrong_letters.include?(entered_letter)
    end
  end

  def get_words_from_file
    words = []
    File.open("./hangman_web/lib/5desk.txt", "r").each_line do |word|
      words.push(word.strip) if word.strip.length >= 5 && word.strip.length <= 12
    end
    words
  end

  def draw_wrong_letters
    @wrong_letters.join(" ")
  end

end
