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
end
