class Card

  attr_reader :type, :value, :hidden, :name

  def initialize(type, value, name)
    @type = type
    @name = name
    @value = value
    @hidden = true
  end

  def show
    @hidden = false
    "#{@type}: #{@name}"
  end

  def ==(other_card)
    self.value == other_card.value
  end
end
