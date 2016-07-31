class GeneratorOfCode

  def initialize(color)
    @color = color
  end

  def generate_secret_code_automatic(quantity_of_colors=4)
    randomize_colors = Array.new(0)
    quantity_of_colors.times {
      randomize_colors.push(@color.colors[Random.rand(@color.colors.length)])
    }
    return randomize_colors
  end

  def generate_secret_code_manually(my_colors)
    colors = []
    my_colors.each_index do |index|
      colors[index] = my_colors[index]
    end
    return colors
  end

  # def generate_code_of_different_colors(quantity_of_colors)
  #   return @colors.shuffle.sample(quantity_of_colors)
  # end

end
