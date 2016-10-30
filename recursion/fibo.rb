#Method without recursion
def fibs(number)
  sequence = []
  (0..number).each do |n|
    sequence[n] = (n <= 1) ? n : sequence[n-1] + sequence[n-2]
  end
  return sequence
end

#Method with recursion
def fibs_rec(n)
  return (n < 2) ? n : (fibs_rec(n-1) + fibs_rec(n-2))
end

#Without recrusion
puts fibs(3).inspect

#With recursion
0.upto(3){ |k| print fibs_rec(k), (',' if k < 3)}
puts
