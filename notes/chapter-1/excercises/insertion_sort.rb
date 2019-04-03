def insertion_sort(arr)
  (1..arr.count - 1).each do |j|
    key = arr[j]
    i = j - 1
    # Insert arr[j] into the sorted sequence arr[0 . . j]
    while i >= 0 && arr[i] > key do
      arr[i + 1] = arr[i]
      i -= 1
    end
    arr[i + 1] = key
  end
  arr
end

puts insertion_sort([8,3,3,6,7,1])