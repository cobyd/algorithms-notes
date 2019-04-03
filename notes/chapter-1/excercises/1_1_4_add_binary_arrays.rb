def add_binary_arrays(arr1, arr2)
  ret = []
  (arr1.count - 1).downto(0).each do |i|
    ret.unshift(arr1[i] ^ arr2[i])
    ret.unshift(1) if arr1[i] + arr2[i] == 2
  end
  ret
end

puts add_binary_arrays([1,0], [0,0]).join(",")
puts add_binary_arrays([1,0], [1,0]).join(",")
puts add_binary_arrays([1,1], [0,1]).join(",")