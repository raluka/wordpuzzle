

## puzzle start

## take all words with letter 'i'

WORDS = File.readlines('/usr/share/dict/words').map { |w| w.downcase.chomp }
FILTERED_LIST = WORDS.select { |word| word.length <= 9 && word.include?('i')}
# SORTED_LIST = FILTERED_LIST.map { |word| word.downcase.chars.sort.join }

def order_words(number)
  ordered_words = {}
  FILTERED_LIST.select { |word| word.length == number }.map do |value|
    key = value.chars.sort
    ordered_words[key] = value
  end
  ordered_words
end

def original_word(array, hash)
  hash[array]

end

def link(hash_big, array_small, number)
  linked_words = { }
  hash_big.keys.each do |value|
    array_small.each do |key|
      linked_words[key] = value if (value & key).count == number
    end
  end
  linked_words
end

def previous_key(found_key, previous)

end

# TODO: make arrays for words_with_x_letters

# TODO: put condition when a letter appears more than once: check for no of occurrences & get uniq on array

p no_2 = order_words(2) # returns a hash with key = array of sorted letters, value = original string
puts
p no_3 = order_words(3)
puts
# link(order_words(3), order_words(2), 2)
p temp_2 = link(order_words(3), order_words(2).keys, 2).values # returns a hash with keys = array of 2 letters, values = arrays of 3 letters

puts
p order_words(4)
puts
p link(order_words(4), temp_2, 3)
puts
p temp_3 = link(order_words(4), temp_2, 3).values
puts
p order_words(5)
puts
p temp_4 =  link(order_words(5), temp_3, 4).values
puts
p order_words(6)
puts
p temp_5 = link(order_words(6), temp_4, 5).values
puts
p order_words(7)
puts
p temp_6 = link(order_words(7), temp_5, 6).values
puts
p no_8 = order_words(8)
puts
link_8 = link(order_words(8), temp_6, 7)
p temp_7 = link_8.values
puts
p no_9 = order_words(9)
puts
link_9 = link(order_words(9), temp_7, 8)
p temp_8 = link_9.values
puts
p original_word(temp_8.flatten, no_9) # takes array and hash as parameters and returns value of hash[array.first]
p key_8 = link_9.key(temp_8.flatten)
puts
p original_word(key_8, no_8)
