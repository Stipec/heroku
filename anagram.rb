

def array_swap(array, a, b)
    array[a], array[b] = array[b], array[a]
    return array
end

def three_letter_rotate(let3)
    array = let3.dup
    let3a, let3b, let3c, let3s = [], [], [], []
    let3s = array_swap(array, 0, 1)
    for i in 0..2
        let3a[i] = let3.rotate(i).join()
        let3b[i] = let3s.rotate(i).join()
        i += 1
    end
    let3c = let3a + let3b
  
    return let3c
end

def rotate_array(array, idx)
    brk = array.pop(idx) 
    brk = brk.rotate()
    array = array + brk
end

def input_array(input_array)
    array, array1 = input_array.dup, input_array.dup
    inter_array, second_array, final_array, s = [], [], [], []
    inputlen = ((1..input_array.length).inject(:*))/6
    for x in 1..inputlen
        last_3_pop = array.pop(3)
        last_3 = three_letter_rotate(last_3_pop)
        second_array = second_array.fill(array.join(), (0..6))
        array = array + last_3_pop
            for y in 0..5    
                inter_array[y] = second_array[y] + last_3[y]
            end
            final_array = final_array + inter_array
            array = rotate_array(array, 4)
            for k in 4..input_array.length
                s[k-4] = ((1..k).inject(:*))/6
            end
            for z in 4..s.length+3
                if (x % s[z-4]) == 0
                    array = rotate_array(array, z+1)
                end
            end
    end
#                if final_array.uniq.length == final_array.length
#                    puts "a does not contain duplicates
#                else
#                    puts "a does contain duplicates"
#                end
    return final_array
end

def get_word()
    puts "Enter a word"
    str_word = gets
    str_word = str_word.chop
    word = Array.new
        str_word.each_char do |idx|
            word.push(idx)
        end
    return word
end

word2test = get_word()
puts input_array(word2test)