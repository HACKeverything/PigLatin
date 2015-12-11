require 'pry'

class PigLatin
  
  VOWEL = ["a", "e", "i", "o", "u"]

  DIGRAPHS = ["bl", "br", 
              "ch", "ck", "cl", "cr", 
              "dr",
              "fl", "fr", 
              "gl", "gr", 
              "ng", 
              "ph", "pl", "pr", 
              "qu", 
              "sc", "sh", "sk", "sl", "sm", "sn", "sp", "st", "sw", 
              "th", "tr", "tw", 
              "wh", "wr"]

  #             sc            sh     sp                   st     th

  TRIGRAPHS = ["sch", "scr", "shr", "spl", "spr", "squ", "str", "thr"]

  def self.translate(raw)
    arr = raw.split
    str = ''

    arr.each { |e|
      str << dealing_one_word(e) + ' '
    }

    str.rstrip
  end

  def self.dealing_one_word(word)
    if vowel(word[0])                                              
      word = word + "ay"                                              # v
    elsif consonant_x_y(word[0])                                      # why word[0] == 'x' || word[0] == 'y'
      if vowel(word[1]) 
        word = word[1..-1] + word[0] + "ay"                           # xv
      else
        word = word + "ay"                                            # xc
      end
    else
      if trigraphs(word[0..2]) 
        word = word[3..-1] + word[0..2] + "ay"                        # ccc
      else  
        if disgraphs(word[0..1])
          word = word[2..-1] + word[0..1] + "ay"                      # cv, cc 
        else
          word = word[1..-1] + word[0] + "ay"                         # c
        end
      end
    end

    word
  end

  def self.vowel(alphabet)
    VOWEL.include?(alphabet)
  end

  def self.consonant_x_y(alphabet) 
    alphabet == 'x' || alphabet == 'y'
  end

  def self.disgraphs(consonants)
    DIGRAPHS.include?(consonants)
  end

  def self.trigraphs(consonants)
    TRIGRAPHS.include?(consonants)
  end
end