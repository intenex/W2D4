def anagram?(word1, word2)
    first_anagram?(word1).include?(word2)
end

def first_anagram?(word1) 
    # pls no O(n!)
    return [word1] if word1.length <= 1
    last_anagram = first_anagram?(word1[0...-1])
    new_permutes = Array.new
    word1.length.times do |index|
        last_anagram.each do |permute|
            new_permutes << permute.dup.insert(index, word1[-1]) # fucking dup problem lmao you got it just needed to dup so close
        end
    end
    new_permutes
end

def second_anagram?(word1, word2) 
    # is O(n^2) because loop + slice
    word1.each_char do |char|
        # return false unless idx
        return false unless word2.include?(char)
        idx = word2.index(char)
        word2 = word2[0...idx] + word2[idx + 1..-1]
    end
    true
end

def third_anagram?(word1, word2) 
    # is O(n log n) because Array.sort = quicksort
    word1.split("").sort == word2.split("").sort
end

def fourth_anagram?(word1, word2) 
    # is O(n) because 2 separate loops + uniq
    hash = Hash.new(0)
    word1.each_char do |char|
        hash[char] += 1
    end
    word2.each_char do |char|
        hash[char] -= 1
    end
    hash.values.uniq == [0]
end

# p first_anagram?("ho")
# p first_anagram?("run")
# p first_anagram?("ford")
# p first_anagram?("hello")

# p anagram?("gizmo", "sally")    #=> false
# p anagram?("elvis", "lives")    #=> true

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true