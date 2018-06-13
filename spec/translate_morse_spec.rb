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

  describe 'is_number?' do
    context 'charcater is letter' do
      it 'is false' do
        character = 'a'
        expect(translate_morse.is_number?(character)).to eq(false)
      end
    end

    context 'character is number' do
      it 'is true' do
        character = '2'
        expect(translate_morse.is_number?(character)).to eq(true)
      end
    end

    context 'character is non-alphanumeric' do
      it 'is false' do
        character = '!'
        expect(translate_morse.is_number?(character)).to eq(false)
      end
    end
  end

  describe 'is_letter?' do
    context 'charcater is letter' do
      it 'is true' do
        character = 'a'
        expect(translate_morse.is_letter?(character)).to eq(true)
      end
    end

    context 'character is number' do
      it 'is false' do
        character = '2'
        expect(translate_morse.is_letter?(character)).to eq(false)
      end
    end
  end

  describe 'parse_character' do
    context 'character is letter' do
      it 'returns morse translation' do
        character = 'z'
        morse_translation = translate_morse.letter_translation_table[character.to_sym]
        expect(translate_morse.parse_character(character)).to eq(morse_translation)
      end

      context 'uppercase letter' do
        it 'converts letter to lowercase and returns translation' do
          character = 'A'
          morse_translation = translate_morse.letter_translation_table[character.to_sym]
          expect(translate_morse.parse_character(character)).to eq(morse_translation)
        end
      end
    end

    context 'character is valid' do
      it 'returns morse translation' do
        character = '5'
        morse_translation = translate_morse.number_translation_table[character.to_i]
        expect(translate_morse.parse_character(character)).to eq(morse_translation)
      end
    end

    context 'character is invalid' do
      it 'is nil' do
        non_alphanumeric = '*'
        empty = ''
        word = 'hello'
        expect(translate_morse.parse_character(non_alphanumeric)).to eq(nil)
        expect(translate_morse.parse_character(empty)).to eq(nil)
        expect(translate_morse.parse_character(word)).to eq(nil)
      end
    end
  end

  describe 'parse_word' do
    it 'returns morse translation of word' do
      word = 'ruby'
      translation = '.-. ..- -... -.--'
      expect(translate_morse.parse_word(word)).to eq(translation)
    end

    context 'empty string' do
      it 'is nil' do
        word = ''
        expect(translate_morse.parse_word(word)).to eq(nil)
      end
    end

    context 'word contains non-alphanumeric characters' do
      it 'strips non-alphanumeric characters' do
        word = 'Ru$by!'
        translation = '.-. ..- -... -.--'
        expect(translate_morse.parse_word(word)).to eq(translation)
      end
    end
  end

  describe 'morse_characters' do
    it 'returns array of morse translated characters' do
      word = 'ruby'
      morse_characters = ['.-.', '..-', '-...', '-.--']
      expect(translate_morse.morse_characters(word)).to eq(morse_characters)
    end
  end

  describe 'parse_text' do
    it 'translates text into morse code with words separated by slash' do
      text = 'Ruby is fun.'
      translation = '.-. ..- -... -.-- / .. ... / ..-. ..- -.'
      expect(translate_morse.parse_text).to eq(translation)
    end
  end
end
