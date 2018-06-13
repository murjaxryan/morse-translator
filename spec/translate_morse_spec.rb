require 'spec_helper'
require_relative '../lib/translate_morse.rb'

describe TranslateMorse do
  let(:text) { 'ruby is fun' }
  let(:translate_morse) { TranslateMorse.new(text) }

  describe 'initialize' do
    it 'sets text attribute from user input' do
      expect(translate_morse.text).to eq(text)
    end
  end

  describe 'letter_translation_table' do
    it 'returns hash of letter to morse translations' do
      translations = { a: '.-',
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
      expect(translate_morse.letter_translation_table).to eq(translations)
    end
  end

  describe 'number_translation_table' do
    it 'returns array of number translations indexed in order' do
      translations = [
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
      expect(translate_morse.number_translation_table).to eq(translations)
    end
  end
end
