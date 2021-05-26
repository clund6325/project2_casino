class Player
  attr_accessor :name, :hand, :bankroll 
  def initialize(name, hand, bankroll)
    @name = name
    @hand = hand
    @bankroll = bankroll
  end
end