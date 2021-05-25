class Deck
  # Getter and Setter methods for rank, suit and color
  attr_accessor :cards
 
  # Gets called when you call the new method to create an instance
  # deck = Deck.new
  def initialize
    @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    @suits = %w(Spades Diamonds Clubs Hearts)
    @cards = []
    generate_deck
  end
 
  def shuffle_cards
   @cards.shuffle
  end
  
  def generate_deck
    @ranks.each do |rank|
      if rank == 2
        value = 2
      elsif rank == 3
        value = 3
      elsif rank == 4
        value = 4
      elsif rank == 5
        value = 5
      elsif rank == 6
        value = 6
      elsif rank == 7
        value = 7
      elsif rank == 8
        value = 8
      elsif rank == 9
        value = 9
      elsif rank == 'A'
        value = 11
      else
        value = 10
      end
    @suits.each do |suit|
      # @ranks.size.times do |i|
        # Ternary Operator
        color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red' 
        @cards << Card.new(rank, suit, color, value)
      end
    end
    @cards.shuffle!
  end
 
   def display_cards
     @cards.shuffle.each do |card|
       puts "#{card.rank} #{card.suit} (#{card.color})"
     end
   end

   def deal (num, player)
    num.times {@cards.shift.generate_card(player)}
   end
 end