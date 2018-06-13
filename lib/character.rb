class Character
  attr_reader :character
  def initialize(character)
    @character = character
  end

  def to_i
    character.to_i
  end

  def to_sym
    character.to_sym
  end

  def is_character?
    character.length == 1
  end

  def is_letter?
    return false unless is_character?
    result = (character =~ /[A-Za-z]/)
    result == 0
  end

  def is_number?
    return false unless is_character?
    result = (character =~ /[0-9]/)
    result == 0
  end
end
