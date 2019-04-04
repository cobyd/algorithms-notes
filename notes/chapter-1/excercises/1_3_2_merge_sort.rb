def merge(arr1, arr2)
  ret = []
  i = j = k = 0
  while i <= arr1.count - 1 || j <= arr2.count - 1
    if i == arr1.count # arr1 has been fully merged
      ret << arr2[j]
      j += 1
    elsif j == arr2.count # arr2 has been fully merged
      ret << arr1[i]
      i += 1
    else # Both arrays have un-merged values
      if arr1[i] <= arr2[j]
        ret << arr1[i]
        i += 1
      else
        ret << arr2[j]
        j += 1
      end
    end
  end
  ret
end

def merge_sort(arr)
  return arr if arr.count == 1
  idx = arr.count / 2
  merge(
    merge_sort(arr[0...idx]),
    merge_sort(arr[idx...arr.count])
  )
end

puts merge([1,3,5,7], [2,4,6,8]).join(',')
puts merge([1,3], [2,4,6,8]).join(',')
puts merge([1,2,3,4], [2,4,6,8]).join(',')

puts merge_sort([2,1,4,5,6,3,3,9]).join(',')
puts merge_sort([2,1]).join(',')
puts merge_sort([-1,7,4]).join(',')