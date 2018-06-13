require_relative 'lib/input'
require_relative 'lib/translate_morse'

input_text = Input.get_text
translate_morse = TranslateMorse.new(input_text)
puts translate_morse.parse_text
