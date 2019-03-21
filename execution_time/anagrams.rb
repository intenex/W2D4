def anagram?(word1, word2)

end

def first_anagram?(word1)
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

p first_anagram?("ho")
p first_anagram?("run")
p first_anagram?("ford")
p first_anagram?("hello")