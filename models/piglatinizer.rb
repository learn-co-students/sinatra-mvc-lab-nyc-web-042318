# This class will translate a string into pig latin
class PigLatinizer

  # Credit to @fosterdill of Stack Overflow
  def piglatinize(word)
    oinkedsentence = word.split(" ")
    oinkedsentence.map! do |str|
      oinkify(str)
    end
    oinkedsentence.join(' ')
  end

  def oinkify(word)
    # word starts with y
    if word.match(/^[y]/)
      (word[1..-1] + 'yay')
    # starts with a vowel
    elsif word.match(/^[aeiou]/i)
      (word + 'way')
    # starts with 'qu'
    elsif word.match(/^[qu]{2}/)
      start = word.slice!(/^[qu]{2}/)
      (word + start + 'ay')
    # starts with 'pl'
    elsif word.match(/^[pl]{2}/)
      start = word.slice!(/^[pl]{2}/)
      (word + start + 'ay')
    else
    # Word starts with *a* consonant
      start = word.slice!(/^[^aeiouy]{1,}/)
      (word + start + 'ay')
    end
  end
end
