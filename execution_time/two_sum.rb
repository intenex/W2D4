def bad_two_sum?(arr, target)
    # O(n^2) because two loops
    arr.each_with_index do |e1, i1|
        arr.each_with_index do |e2, i2|
            return true if e1 + e2 == target && i2 > i1
        end
    end
    false
end

# can keep track of two index pointers one at the end and one at the front and increment and decrement each

def okay_two_sum?(arr, target) # O(nlogn)
    new_arr = arr.sort
    #hardcode lol
    return false if target < new_arr.first || target > new_arr.last
    new_arr.each_with_index do |el, idx| # O(n)
        new_arr.delete_at(idx)
        # times O(log(n)) == O(nlog(n))
        return true if new_arr.binary_search(target - el)
    end
    false
end

class Array
    def binary_search(target) # O(log(n))
        return true if self[length/2] == target
        return false if length <= 1 && self[0] != target
        pivot = length/2
        left = take(pivot)
        right = drop(pivot)
        right.binary_search(target) || left.binary_search(target)
    end
end

def two_sum_hash?(arr, target) # O(n)
    hash = Hash.new(0)
    arr.each do |el|
        hash[el] += 1
    end
    arr.each_with_index do |el, idx|
        if target-el == el
            return true if hash[el] > 1
        else
            return true if hash[target - el] > 0
        end
    end
    false
end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false

p two_sum_hash?(arr, 6) # => should be true
p two_sum_hash?(arr, 10) # => should be false