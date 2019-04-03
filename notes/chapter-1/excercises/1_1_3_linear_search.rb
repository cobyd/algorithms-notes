def linear_search(arr, val)
  (0..arr.count).each do |i|
    return i if arr[i] == val
  end
  return -1
end

puts linear_search([3,6,2,7,8,9,2], 7)
puts linear_search([3,6,2,7,8,9,2], 2)
puts linear_search([3,6,2,7,8,9,2], 10)
