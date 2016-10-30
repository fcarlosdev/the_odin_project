class Piece

  attr_accessor :symbol

  def initialize(chosen_symbol)
    @symbol = get_symbol(chosen_symbol)
  end

  private

    def get_symbol(chosen_symbol)
       symbols[chosen_symbol]
    end

    def symbols
      symbols = {
        :EMPTY_DISC  => "\u26C1",
        :FILLED_DISC => "\u26C3"
      }
    end

end
