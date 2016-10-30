class Player

  attr_reader :type, :guess

  def initialize(type)
    @type  = type
    @guess = []
    @feedback = Array.new(4,"")
    @frequences_of_items = Hash.new
  end

  def make_a_guess(guess)
    guess
  end

  def generate_code(my_code=nil,generator_of_code)
    return generator_of_code.generate_secret_code_automatic if my_code.nil?
    return generator_of_code.generate_secret_code_manually(my_code) if !my_code.nil?
  end

  def right_guess?(guess,code)
    @feedback = Array.new(4,"")
    initialize_frequences_of_items_of(guess)
    get_feedback_to_right_items_of(guess,code)
    get_feedback_to_items_on_wrong_postition(guess,code)
    return @feedback
  end

  def generate_guess(color)
    guess = []
    base_colors = color.colors
    4.times {
      guess.push(base_colors[Random.rand(base_colors.length)])
    }
    return guess
  end

  def copy_items_right_of_last_guess_to(guess,last_guess,last_feedback)
    last_feedback.each_with_index do |value,index|
      if value == "Black"
        guess[index] = last_guess[index]
      elsif value == "White"
        new_pos = Random.rand(4)
        while last_feedback[new_pos] == "Black"
          new_pos = Random.rand(4)
        end
        guess[new_pos] = last_guess[index]
      end
    end
    return guess
  end

  private

  def get_feedback_to_right_items_of(guess,code)
    guess.each_with_index do |value,index|
      if guess[index] == code[index]
        @feedback[index] = "Black"
        @frequences_of_items[value] = @frequences_of_items[value]+1
      end
    end
  end

  def get_feedback_to_items_on_wrong_postition(guess,code)
    items_on_wrong_position = @feedback
    guess.each_index do |index|
      if guess[index] != code[index] && code.include?(guess[index])
        if @frequences_of_items[guess[index]] < code.count(guess[index])
          items_on_wrong_position[index] = "White"
          @frequences_of_items[guess[index]] = @frequences_of_items[guess[index]]+1
        end
      end
    end
  end

  def initialize_frequences_of_items_of(guess)
    guess.each do |value|
      @frequences_of_items[value] = 0
    end
  end

end
