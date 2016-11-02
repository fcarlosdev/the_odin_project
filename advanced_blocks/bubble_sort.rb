def bubble_sort(array)
    minus_index = 0 #Only to optimize the time algorithm
    (array.length-minus_index).times do
      array.each_with_index do |element,i|
        next_element = array[i+1]
        if !next_element.nil? && element > next_element
            array[i],array[i+1] = next_element,element
        end
      end
      minus_index += 1
    end
    return array
end

def bubble_sort_by(array)
  (array.length - 1).times do
    array.each_with_index do |element, index|
      next_element = array[index+1]
      if !next_element.nil? && yield(element,next_element) > 0
          array[index],array[index+1] = next_element,element
      end
    end
  end
  return array
end

puts bubble_sort([4,3,78,2,0,2]).inspect
puts (bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end).inspect
