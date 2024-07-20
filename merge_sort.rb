def merge_sort(arr)
  n = arr.size
  return arr if n == 1

  sorted_arr = []
  left_half = arr[0..n / 2 - 1]
  right_half = arr[n / 2..n - 1]
  # sort the halves
  left_sorted = merge_sort(left_half)
  right_sorted = merge_sort(right_half)
  # merge the halves
  index_left = 0
  index_right = 0

  while index_left < left_sorted.size && index_right < right_sorted.size
    if left_sorted[index_left] <= right_sorted[index_right]
      sorted_arr << left_sorted[index_left]
      index_left += 1
    else
      sorted_arr << right_sorted[index_right]
      index_right += 1
    end
  end

  if index_left >= left_sorted.size
    sorted_arr << right_sorted[index_right..right_sorted.size - 1]
    sorted_arr.flatten!
  else
    sorted_arr << left_sorted[index_left..left_sorted.size - 1]
    sorted_arr.flatten!
  end

  sorted_arr
end

p merge_sort([3, 2, 1, 13, 8, 5, 0, 1])
p merge_sort([3, 2, 1, 13, 8, 5, 0, 1]) == [0, 1, 1, 2, 3, 5, 8, 13]

p "############################"

p merge_sort([105, 79, 100, 110])
p merge_sort([105, 79, 100, 110]) == [79, 100, 105, 110]
