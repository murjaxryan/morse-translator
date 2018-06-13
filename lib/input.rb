class Input
  def self.get_text
    puts 'Please enter the text to translate: '
    STDOUT.flush
    STDIN.gets.chomp
  end
end
