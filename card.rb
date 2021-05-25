class Card
  # Getter and Setter methods for rank, suit and color
  attr_accessor :rank, :suit, :color, :value
  # Gets called when you call the new method to create an instance
  # card = Card.new('10', 'Spades', 'Black')
  def initialize(rank, suit, color, value)
    @rank = rank
    @suit = suit
    @color = color
    @value = value
  end

  def generate_card(player)
    new_card = Card.new rank, suit, color, value
    player.hand << new_card
    player.total = player.total + new_card.value
  end
  def generate_card(player)
    new_card = Card.new rank, suit, color
    player.hand << new_card
    # player.total = player.total + new_card.value
  end
 end