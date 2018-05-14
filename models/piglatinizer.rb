class PigLatinizer

  def piglatinize(string)
    consonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'y', 'z']
    string_array = string.split
      latinized_array = string_array.map do |string|
        letter_array = string.split("")
        if letter_array.length == 1 || !consonants.include?(letter_array[0].downcase)
          string << "way"
        elsif consonants.include?(letter_array[0].downcase) && consonants.include?(letter_array[1]) && consonants.include?(letter_array[2])
          letter_array.insert(letter_array.length-1, letter_array.delete_at(0))
          letter_array.insert(letter_array.length-1, letter_array.delete_at(0))
          letter_array.insert(letter_array.length-1, letter_array.delete_at(0))
          letter_array.push("a", "y")
          new_string = letter_array.join
          new_string
        elsif consonants.include?(letter_array[0].downcase) && consonants.include?(letter_array[1])
          letter_array.insert(letter_array.length-1, letter_array.delete_at(0))
          letter_array.insert(letter_array.length-1, letter_array.delete_at(0))
          letter_array.push("a", "y")
          new_string = letter_array.join
          new_string
        else
          letter_array.insert(letter_array.length-1, letter_array.delete_at(0))
          letter_array.push("a", "y")
          new_string = letter_array.join
          new_string
        end
      end
      latinized_array.join(" ")
  end
end
