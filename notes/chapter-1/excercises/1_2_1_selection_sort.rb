def selection_sort(arr)
  (0...arr.count).each do |i| # n times
    temp = arr[i] # n - 1 times
    idx = i # n - 1 times
    (i...arr.count).each do |j| # n(n+1)/2 times
      if arr[j] < temp # n(n+1)/2 - 1 times
        temp = arr[j] # n(n+1)/2 - 1 times
        idx = j # n(n+1)/2 - 1 times
      end
    end
    arr[idx] = arr[i] # n - 1 times
    arr[i] = temp # n - 1 times
  end
  arr
end

# O(n^2)

puts selection_sort([4,3,5,5,6,1,2]).join(',')