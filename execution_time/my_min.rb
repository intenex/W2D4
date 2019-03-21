# def my_min_bad(arr) # O(n**2) because iterating over a nested loop
#     min = 0
#     arr.each do |first|
#         arr.each do |last|
#             min = first if (first < last && first < min)
#         end
#     end
#     min
# end

list = [0,3,5,4, -5, 10, 1, 90]

def my_min_bad(arr) # O(n**2) because iterating over a nested loop
    arr.each do |el|
        return el if arr.all? { |other_el| el <= other_el }
    end
end

def my_min_good(arr) # O(n) because iterating once through all elements
    min = 0
    arr.each do |num|
        min = num if num < min
    end
    min
end