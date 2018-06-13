require 'spec_helper'
require_relative '../lib/character.rb'

describe Character do
  let(:number_character) { Character.new('5') }
  let(:letter_character) { Character.new('g') }

  describe 'to_i' do
    it 'returns symbol as integer' do
      expect(number_character.to_i).to eq(5)
    end
  end

  describe 'to_sym' do
    it 'returns character as symbol' do
      expect(letter_character.to_sym).to eq(:g)
    end
  end

  describe 'is_number?' do
    context 'charcater is letter' do
      it 'is false' do
        expect(letter_character.is_number?).to eq(false)
      end
    end

    context 'character is number' do
      it 'is true' do
        character = '2'
        expect(number_character.is_number?).to eq(true)
      end
    end

    context 'character is non-alphanumeric' do
      it 'is false' do
        character = Character.new('!')
        expect(character.is_number?).to eq(false)
      end
    end

    context 'is not character' do
      it 'is false' do
        character = Character.new('123')
        expect(character.is_number?).to eq(false)
      end
    end
  end

  describe 'is_letter?' do
    context 'charcater is letter' do
      it 'is true' do
        expect(letter_character.is_letter?).to eq(true)
      end
    end

    context 'character is number' do
      it 'is false' do
        expect(number_character.is_letter?).to eq(false)
      end
    end

    context 'character is non-alphanumeric' do
      it 'is false' do
        character = Character.new('$')
        expect(character.is_letter?).to eq(false)
      end
    end

    context 'is not character' do
      it 'is false' do
        character = Character.new('foobar')
        expect(character.is_letter?).to eq(false)
      end
    end
  end

  describe 'is_character?' do
    context 'length is 1' do
      it 'is true' do
        character = Character.new('f')
        expect(character.is_character?).to eq(true)
      end
    end

    context 'length is greater than 1' do
      it 'is false' do
        character = Character.new('foobar')
        expect(character.is_character?).to eq(false)
      end
    end
  end
end
