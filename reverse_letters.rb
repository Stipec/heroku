def reverse_letters(word)
    while word.length != 2 do
        word = Array.new
        puts "word is not 2 letters enter again"
        str_word = gets
        str_word = str_word.chop
        str_word.each_char do |idx|
            word.push(idx)
        end
    end
    return word.rotate()
end

def get_word()
    puts "Enter a 2 letter word"
    str_word = gets
    str_word = str_word.chop
    word = Array.new
        str_word.each_char do |idx|
            word.push(idx)
        end
    return word
end


word2let = get_word()
rotword = reverse_letters(word2let)
puts rotword