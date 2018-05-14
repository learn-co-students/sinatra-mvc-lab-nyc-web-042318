require "pry"
class PigLatinizer
  attr_reader :text

  def initialize(text="")
    @text = text
  end

  def count_of_words
    words = text.split(" ")
    words.count
  end

  def count_of_vowels
    text.scan(/[aeoui]/).count
  end

  def count_of_consonants
    text.scan(/[bcdfghjklmnpqrstvwxyz]/).count
  end

  def piglatinize(str)
    result = str.split(" ")
    # binding.pry
    result.map {|word| self.piglatin_word(word)}.join(" ")
  end

  def reallypig
    piglatinize(text)

  end

  def piglatin_word(txt)
    cons = "bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ"
    result =""
    # binding.pry
    if(cons.include?(txt[0]))

      result = txt[1..-1] +txt[0] +"ay"

      if(cons.include?(txt[1]))
        result = txt[2..-1] +txt[0..1] +"ay"
          if(cons.include?(txt[2]))
            result = txt[3..-1] +txt[0..2] +"ay"
          end
      end
    else
      result = txt +"way"
    end

    result
  end



  def most_used_letter
    s1 = text.gsub(/[^a-z]/, '') # gets rid of spaces
    arr = s1.split('')
    arr1 = arr.uniq
    arr2 = {}

    arr1.map do |c|
      arr2[c] =  arr.count(c)
    end

    biggest = { arr2.keys.first => arr2.values.first }

    arr2.each do |key, value|
      if value > biggest.values.first
        biggest = {}
        biggest[key] = value
      end
    end

    biggest
  end
end
