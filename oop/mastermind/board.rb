class Board

  attr_accessor :code, :feedbacks, :guesses

  def initialize()
    @code         = []
    @feedbacks    = Hash.new
    @guesses      = Hash.new
    @feed_number  = 0
    @guess_number = 0
  end

  def hold_feedbacks(feedback)
    @feedbacks[@feed_number] = feedback
    @feed_number += 1
  end

  def hold_guesses(guess)
    @guesses[@guess_number] = guess
    @guess_number += 1
  end

end
