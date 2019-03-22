def windowed_max_range_naive(arr, window_size)
    # O(n^2) because loop + slice + .max + .min
    current_max_range = -9899999999
    current_max_range_window = nil

    (0..arr.length - window_size).each do |idx|
        sub_array = arr[idx...idx + window_size]
        # p sub_array
        max_range = sub_array.max - sub_array.min
        if max_range > current_max_range
            current_max_range = max_range 
            current_max_range_window = sub_array
        end
    end
    current_max_range
end

p windowed_max_range_naive([1, 0, 2, 5, 4, 8], 2) # == 4 # 4, 8
p windowed_max_range_naive([1, 0, 2, 5, 4, 8], 3) # == 5 # 0, 2, 5
p windowed_max_range_naive([1, 0, 2, 5, 4, 8], 4) # == 6 # 2, 5, 4, 8
p windowed_max_range_naive([1, 3, 2, 5, 4, 8], 5) # == 6 # 3, 2, 5, 4, 8