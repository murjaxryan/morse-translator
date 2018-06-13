class TranslateMorse
  attr_reader :text
  def initialize(text)
    @text = text
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

  def is_letter?(character)
    result = (character =~ /[A-Za-z]/)
    result == 0
  end

  def is_number?(character)
    result = (character =~ /[0-9]/)
    result == 0
  end

  def parse_character(character)
    return unless character.length == 1

    if is_letter?(character)
      letter_translation_table[character.to_sym]
    elsif is_number?(character)
      number_translation_table[character.to_i]
    end
  end
end
