def merge(array_1,array_2)
  result = array_1.concat(array_2)
  return result.sort
end

def merge_sort(array)
  return array if array.size <= 1
  mid = array.size/2
  left_array = array.slice(0,mid)
  right_array = array.slice(mid,array.size)
  merge_sort(left_array)
  merge_sort(right_array)
  merge(left_array,right_array)
end

puts merge_sort([5,4,35,1,40, 100, 10, 45, 20,7,3,9,8]).inspect
