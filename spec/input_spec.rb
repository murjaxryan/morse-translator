require 'spec_helper'
require_relative '../lib/input.rb'

describe Input do
  describe 'get_text' do
    it 'gets input from user and chomps new line' do
      text = 'ruby is fun'
      allow(STDIN).to receive_message_chain(:gets, :chomp).and_return(text)
      expect(Input.get_text).to eq(text)
    end
  end
end

