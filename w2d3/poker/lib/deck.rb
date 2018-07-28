require_relative 'card'
class Deck

  TYPES = [:club, :spade, :heart, :diamond]
  VALUES = (2..14).to_a
  NAMES = %w(two three four five six seven eight nine ten Jack Queen King Ace)

  attr_reader :sleeve

  def initialize
    @sleeve = Deck.populate_deck.shuffle
    #debugger
  end

  def self.populate_deck
    deck = []
    TYPES.each do |type|
      VALUES.each_with_index do |value, idx|
        deck << Card.new(type, value, NAMES[idx])
      end
    end
    deck
  end

end
