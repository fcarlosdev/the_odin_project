class Node

  attr_accessor :parent, :value

  def initialize(value=nil, parent=nil)
    @parent = parent
    @value  = value
  end

end
