def contains_dups?(arr)
  seen = {} # 1 time
  arr.each do |el| # n times
    if seen[el] # n - 1 times
      return true # 1 time
    end
    seen[el] = true # n times
  end
  return false # 1 time
end

# O(n)

def contains_dups_no_set?(arr)
  arr.sort! # O(nlogn)
  (0...arr.count - 1).each do |i| # O(n)
    return true if arr[i] == arr[i+1]
  end
  false
end

# O(nlogn)

puts contains_dups?([1,1,2])
puts contains_dups?([3,5,11,2,6,11,9])
puts contains_dups?([1,2,3])

puts contains_dups_no_set?([1,1,2])
puts contains_dups_no_set?([3,5,11,2,6,11,9])
puts contains_dups_no_set?([1,2,3])