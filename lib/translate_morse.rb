require 'character'

class TranslateMorse
  attr_reader :text
  def initialize(text)
    @text = text
  end

  def parse_text
    text.split(' ').map{ |word| parse_word(word) }.join(' / ')
  end

  def parse_word(word)
    morse_characters(word).compact.join(' ')
  end

  def parse_character(string)
    character = Character.new(string)
    if character.is_letter?
      letter_translation_table[character.to_sym]
    elsif character.is_number?
      number_translation_table[character.to_i]
    end
  end

  def morse_characters(word)
    character_array = characters_from_word(word)
    parse_characters(character_array)
  end

  def parse_characters(character_array)
    character_array.map{ |character| parse_character(character) }
  end

  def characters_from_word(word)
    word.downcase.split('')
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
