def add(a,b)
  a + b
end

def subtract(a,b)
  a - b
end

def sum(array)
  result  = 0
  array.each do |e|
    result = result + e
  end
  result
end

def multiply(a,b)
  a * b
end

def multiply_numbers(array)
  result = 1
  array.each do|e|
   result = result * e
  end
  result
end

def power(base,exponent)
  base**exponent
end

def factorial(n)
   if (n == 0 || n == 1)
    return n
  else 
    result = 1
    n.downto(1) { |i| result = result * i }
    result
  end
end
