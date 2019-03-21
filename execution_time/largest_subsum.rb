require 'byebug'

list1 = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]

def largest_contiguous_subsum_bad(arr) # O(n**3) because of nested loops
    largest_array = [arr.first]
    (0...arr.length-1).each do |first|
        (first...arr.length).each do |last|
            sub_array = arr[first..last]
            largest_array = sub_array if sub_array.sum > largest_array.sum   
        end
    end
    # largest_array = arr.sort.reverse.first if largest_array.empty?
    largest_array.sum
end

# def largest_contiguous_subsum_good(arr) #this is actually O(n**2)
#     largest_sum_arr = [arr.first]
#     (0...arr.length).each do |start|
#         range_sum = arr[start..-1]
#         largest_sum_arr = [arr[start]] if arr[start] > largest_sum_arr.sum
#         largest_sum_arr = range_sum if range_sum.sum > largest_sum_arr.sum
#     end
#     largest_sum_arr.sum
# end

# def largest_contiguous_subsum_good(arr) 
#     # this is O(n), space complexity O(n)
#     # space complexity could be O(1) if we used 2 variables instead of largest_sum_arr
#     largest_sum_arr = [0]
#     arr.each do |start|
#         temp_sum = largest_sum_arr.last + start
#         if temp_sum < 0
#             largest_sum_arr << start
#             largest_sum_arr << 0
#         else
#             largest_sum_arr << largest_sum_arr[-1] + start
#         end
#     end
#     largest_sum_arr.delete(0) if !arr.include?(0)
#     largest_sum_arr.max
# end

def largest_contiguous_subsum_good(arr) 
    last_max = arr.first
    current_max = 0
    arr.each do |num|
        temp_sum = current_max + num
        if temp_sum < 0
            last_max = current_max if temp_sum > last_max
        else
            if temp_sum > last_max
                last_max = temp_sum
            end
        end
        if num > temp_sum
            current_max = num
        else
            current_max = temp_sum
        end        
    end
    last_max
end

p largest_contiguous_subsum_good(list1)
p largest_contiguous_subsum_good(list2)
p largest_contiguous_subsum_good(list3)