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
end
