def reverse_insertion_sort(arr)
  (arr.count - 2).downto(1).each do |j|
    key = arr[j]
    i = j + 1
    # Insert arr[j] into the reverse-sorted sequence arr[0 . . j]
    while i <= arr.count - 2 && arr[i] > key do
      arr[i - 1] = arr[i]
      i += 1
    end
    arr[i - 1] = key
  end
  arr
end

puts reverse_insertion_sort([8,3,3,6,7,1])