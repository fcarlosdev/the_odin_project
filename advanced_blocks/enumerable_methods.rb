module Enumarable

  def my_each
    return self.inspect if !block_given?
    for i in 0..self.size-1
      yield(self[i])
    end
  end

  def my_each_with_index
    return self.inspect if !block_given?
    for i in 0..self.size-1
      yield(self[i],i)
    end
  end

  def my_select
    return self.inspect if !block_given?
    new_array = []
    self.my_each do |x|
      new_array << x if yield(x)
    end
    new_array.inspect
  end

  def my_all?
    return true if !block_given?
    self.my_each do |x|
      return false unless yield(x)
    end
    true
  end

  def my_any?
    return true if !block_given?
    self.my_each do |x|
      return true if yield(x)
    end
    false
  end

  def my_none?
    return false if !block_given?
    self.my_each do |x|
      return false if yield(x)
    end
    true
  end

  def my_count(arg = nil)
    count  = 0
    self.my_each do |x|
      if block_given?
        count += 1 if yield(x)
      elsif arg != nil
       count += 1 if x.equal? arg
      else
       return self.length
      end
   end
   return count
  end

  def my_map(&my_proc)
    new_array = []
    return self.inspect if !block_given?
    self.my_each do |x|
      new_array << yield(x)
    end
    new_array
  end

  def my_inject(accumulator=self.shift)
    self.my_each do |x|
      accumulator = yield(accumulator,x)
    end
    return accumulator
  end

  def multiply_els(array)
    return array.my_inject {|product,x| product * x}
  end

end
