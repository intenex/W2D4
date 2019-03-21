list1 = [ 5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]

def largest_contiguous_subsum(arr)
    largest_array = [arr.first]
    (0...arr.length-1).each do |first|
        (first...arr.length).each do |last|
            sub_array = arr[first..last]
            largest_array = sub_array if sub_array.sum > largest_array.sum   
        end
    end
    # largest_array = arr.sort.reverse.first if largest_array.empty?
    largest_array
end

