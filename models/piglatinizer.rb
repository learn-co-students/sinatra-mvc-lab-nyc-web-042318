class PigLatinizer
  attr_accessor :text

  def initialize(text='')
    @text = text
  end

  def word_to_pl(word)
    consonants = "BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyz"
    new_phrase = ""
    if consonants.include?(word[0])
      new_phrase = word[1..-1] + word[0] + "ay"
      if(consonants.include?(word[1]))
        new_phrase = word[2..-1] + word[0..1] +"ay"
        if(consonants.include?(word[2]))
          new_phrase = word[3..-1] + word[0..2] +"ay"
        end
      end
    else
      new_phrase = word + "way"
    end
    new_phrase
  end

  def piglatinize(str)
    result = str.split(" ")
    result.map {|word| word_to_pl(word)}.join(" ")
  end

  def phrase_to_pl
    piglatinize(text)
  end
end
