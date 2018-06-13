class TranslateMorse
  attr_reader :text
  def initialize(text)
    @text = text
  end

  def parse_text
    text.split(' ').map{ |word| parse_word(word) }.join(' / ')
  end

  def parse_word(word)
    return unless word.length > 0
    morse_characters(word).compact.join(' ')
  end

  def parse_character(character)
    return unless character.length == 1

    if is_letter?(character)
      letter_translation_table[character.to_sym]
    elsif is_number?(character)
      number_translation_table[character.to_i]
    end
  end

  def morse_characters(word)
    word.downcase.split('').map{ |character| parse_character(character) }
  end

  def is_letter?(character)
    result = (character =~ /[A-Za-z]/)
    result == 0
  end

  def is_number?(character)
    result = (character =~ /[0-9]/)
    result == 0
  end

  def letter_translation_table
    { a: '.-',
      b: '-...',
      c: '-.-.',
      d: '-..',
      e: '.',
      f: '..-.',
      g: '--.',
      h: '....',
      i: '..',
      j: '.---',
      k: '-.-',
      l: '.-..',
      m: '--',
      n: '-.',
      o: '---',
      p: '.--.',
      q: '--.-',
      r: '.-.',
      s: '...',
      t: '-',
      u: '..-',
      v: '...-',
      w: '.--',
      x: '-..-',
      y: '-.--',
      z: '--..',
    }
  end

  def number_translation_table
    [
      '.----',
      '..---',
      '...--',
      '....-',
      '.....',
      '-....',
      '--...',
      '---..',
      '----.',
      '-----',
    ]
  end
end
