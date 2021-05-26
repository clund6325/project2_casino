class Card
  # Getter and Setter methods for rank, suit and color
  attr_accessor :rank, :suit, :color
  # Gets called when you call the new method to create an instance
  # card = Card.new('10', 'Spades', 'Black')
  def initialize(rank, suit, color)
    @rank = rank
    @suit = suit
    @color = color
  end
  def generate_card(player)
    new_card = Card.new rank, suit, color
    player.hand << new_card
    # player.total = player.total + new_card.value
  end
 end