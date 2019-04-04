def binary_search(arr, val, idx=0)
  if arr.nil? || arr.count == 0
    return -1
  end
  if arr.count == 1
    return idx if arr.first == val
    return -1
  end
  half_arr_count = arr.count / 2
  mid_val = arr[half_arr_count]
  if val == mid_val
    idx + half_arr_count
  elsif val < mid_val
    binary_search(arr[0...half_arr_count], val, idx)
  else
    binary_search(arr[half_arr_count...arr.count], val, idx + half_arr_count)
  end
end

puts binary_search([1,3,4,5,6,8,9], 8)
puts binary_search([1,3,4,5,6,8,9], 11)
puts binary_search([0], 1)
puts binary_search([1,2,3,4,5,6,7,8], 1)
puts binary_search([1,2,3,4,5,6,7,8], 6)

# Binary search cuts the problem in half every time it runs.  Unlike merge sort, nothing
# else needs to happen with the non-active divisions.

# Because of that, the time it takes to solve this function is the opposite of exponential.
# If the input doubles in size, it only takes 1 more function call to run.  The opposite 
# of exponential is logatithmic, so this algo is O(logn)