require 'pry'
require 'colorize'
require_relative 'wallet.rb'
require_relative 'deck.rb'
require_relative 'card.rb'
require_relative 'player.rb'
# Start game player has a name and an initial bankroll
# Player can go to different games via menu
  # Slots
  # High / Low!!!
# Player places bet and wins / loses (hint: rand)
# Player's bankroll goes up and down with wins and losses
# @deck = Deck.new
# card = Card.new
def main_menu
  puts ""
  puts "~~~~~~~~~~~~~~~~~~"
  puts ""
  puts "WELCOME TO THE CASINO!!!"
  puts ""
  puts "~~~~~~~~~~~~~~~~~~"
  puts ""
  puts "Please enter your name and how much money you'd like to play with."
  puts ""
  puts "Your Name: "
  @user_name = gets.strip
  puts ""
  puts "Your Wallet Amount: "
  @user_wallet = gets.strip.to_f
  wallet = Wallet.new(@user_wallet)
  puts ""
  puts "~~~~~~~~~~~~~~~~~~"
  puts ""
  print "Welcome #{@user_name}! "
  wallet.print_balance
  puts ""
  print "Type 'play' To Be Taken To Our Casino Floor! Or Type 'exit' To Exit! "
  user_input = gets.strip.downcase

  if user_input == "play"
    casino_floor
  elsif user_input == "exit"
    puts ""
    puts "Please Come Again!"
    puts ""
    exit
  else
    puts ""
    puts "Type 'play' or 'exit' "
    user_input = gets.strip.downcase
    if user_input == "play"
      casino_floor
    elsif user_input == "exit"
      puts ""
      puts "Please Come Again!"
      puts ""
      exit
    end
  end
end

def casino_floor
  puts ""
  puts "~~~~~~~~~~~~~~~~~~"
  puts ""
  puts "WELCOME TO THE CASINO FLOOR!!!"
  puts ""
  puts "~~~~~~~~~~~~~~~~~~"
  puts ""
  print "#{@user_name} "
  wallet = Wallet.new(@user_wallet)
  wallet.print_balance
  puts ""
  puts "~~~~~~~~~~~~~~~~~~"
  puts ""
  puts "1) Slots"
  puts "2) High Low"
  puts "3) Blackjack"
  puts "4) Exit"
  puts ""
  print "What Game Would You Like To Play? "
  
  game_choice = gets.strip.to_i

  if game_choice == 1
    slots
  elsif game_choice == 2
    high_low
  elsif game_choice == 3
    blackjack
  elsif game_choice == 4
    puts ""
    puts "Thanks for playing! Come again!"
    puts ""
    exit
  else
    puts "Please Choose An Option"
    casino_floor
  end
end

def slots
  # "Welcome to slots! Get Three Numbers in a row to Win!"
  # displays player name and wallet amount
  # how much would you like to bet. bet_amount == gets
  # player pulls lever
    # puts/gets saying "type 'pull' to pull lever"
  #  3 numbers display
    # use puts and rand to generate 3 random number (rand1 rand2 rand3)
  #  if they match, the player wins
    # if rand1 == rand2 && rand2 == rand3 players money doubles
    # add bet_amount to @user_wallet
  #  If they don't match, the player loses
    # else "tough luck" minus bet_amount from @user_wallet
  # displays player name and new @user_wallet
  # would you like to play again? y/n
    # == yes, loop back to start
    # == no take back to casino floor
end

def high_low
  # "Welcome to High/Low! In order to win you must correctly"
  # "guess whether the next card will be higher or lower!"
  # Displays player name and wallet amount
  # how much would you like to bet? Get user input bet_amount
  # generate random card 1 (clubs/spade/... ace/2/3/4....jack/queen/king)
    # 
  # Asks player if next card will be higher or lower?
    # player puts input "higher/lower"
  # generate random card 2
    # if user input == "higher" && random card 2 > random card 1
      # player doubles bet_amount and adds to wallet_amount
    # if user input == "lower" && randomcard 2 > randomcard 1
      # player loses bet_amount from wallet_amount
    # if usery_input == "lower" && random card 2 < random card 1
      # player doubles bet_amount and adds to wallet_amount
    # if user input == "higher" && random card 2 < random card 1
      # player loses bet_amount from wallet_amount
  # displays player name and new @user_wallet
  # would you like to play again? y/n
    # == yes, loop back to start
    # == no take back to casino floor
    puts ""
    puts "~~~~~~~~~~~~~~~~~~"
    puts ""
    puts "WELCOME TO HIGH/LOW!! In order to win you must correctly guess whether the next card will be higher or lower!"
    puts ""
    puts "~~~~~~~~~~~~~~~~~~"
    puts ""
    print "#{@user_name} "
    wallet = Wallet.new(@user_wallet)
    wallet.print_balance
    puts ""
    puts "How much would you like to bet? "
    bet_amount = gets.strip.to_f
    wallet.validate_money(bet_amount)
    puts ""
    user = Player.new(@user_name, [], @user_wallet)
    # card = Card.new
    # card.generate_card
    # print "#{user.hand[0].rank} of #{user.hand[0].suit}"
    deck = Deck.new
    deck.shuffle_cards
      deck.deal(1, user)
      puts "#{user.hand[0].rank} of #{user.hand[0].suit}"
    # deck = Deck.new
    # deck.display_cards
    puts ""
    puts "~~~~~~~~~~~~~~~~~~"
    puts ""
    puts "1) Higher"
    puts "2) Lower"
    puts "Will the next card be higher or lower? "
    print "Please selecter 1 for Higher or 2 for Lower! "
    user_guess = gets.strip.to_i
    
    card_2 = deck.deal(1, user)
    puts "#{user.hand[1].rank} of #{user.hand[1].suit}"
    if user_guess == 1
      puts "CONGRATULATIONS!!"
    end
end

def blackjack
  # "Welcome to Blackjack! Your Goal is to get closer to 21 than the dealer!"
  # Displays player name and wallet amount
  # How much would you like to bet? get user input bet_amount
  puts "Welcome to the Blackjack table!"
    user = Player.new(@user_name, [], @user_wallet, 0)
    dealer = Player.new('dealer', [], 100000, 0)

    puts "How much would you like to bet?"
    user_bet = gets.chomp.to_i
      if user_bet <= @user_wallet
        @user_wallet = @user_wallet - user_bet
      else
        puts "You don't have enough money to bet that amount."
        blackjack
      end

    puts "Here are your cards..."
    #player receives two cards at random
    deck = Deck.new
    deck.shuffle_cards
    deck.deal(2, user)
    puts "#{user.hand[0].rank} of #{user.hand[0].suit}"
    puts "#{user.hand[1].rank} of #{user.hand[1].suit}"
    puts "Your cards total:"
    user.total << user.hand[0].value + user.hand[1].value
    puts user.total
    puts "The dealer also has two cards. The first is:"
    #dealer receives two cards at random
    deck.deal(2, dealer)
    #dealer shows one of the cards in that hand array
    puts "#{dealer.hand[0].rank} of #{dealer.hand[0].suit}"
    
    puts "Do you want to hit or stand?"
    #player decides to hit or stand ; get strip for conditional
    user_choice = gets.chomp.to_s
    if user_choice == "hit"
      deck.deal(1, user)
      puts "#{user.hand[2].rank} of #{user.hand[2].suit}"
      puts "Your cards total:"
      user.total << user.hand[0].value + user.hand[1].value + user.hand[2].value
      puts user.total
    elsif user_choice == "stand"
      #dealer reveals cards
      puts "Dealer's second card is: #{dealer.hand[1].rank} of #{dealer.hand[1].suit}"
      puts "Dealer's cards total:"
      dealer.total << dealer.hand[0].value + dealer.hand[1].value
      puts dealer.total
    else 
      puts "Error. Choose 'hit' or 'stand'."
    end
  
    puts "The winner is:"
    #some conditional with whoever has the lowest difference when calculating 21 - total 
      if user.total > 21
        puts "The dealer wins."
        puts "You lost $#{user_bet}."
      elsif 21 - user.total > 21 - dealer.total
        puts "The dealer wins."
        puts "You lost $#{user_bet}."
      elsif user.total == dealer.total
        puts "Draw."
        @user_wallet = @user_wallet + user_bet
      elsif 21 - user.total < 21 - dealer.total
        puts "You win!"
        blackjack_win = user_bet * 2
        @user_wallet << blackjack_win
        puts "You won $#{blackjack_win}"
      else 
        puts "You win!"
        @user_wallet << blackjack_win
        puts "You won $#{blackjack_win}"
      end
    puts "Your current bankroll is $#{@user_wallet}."
    puts "Do you want to play again? (y/n)"
    #include conditional to loop back or exit
      user_replay = gets.chomp.to_s.downcase
      if user_replay == 'y'
        blackjack
      elsif user_replay == 'n'
        main_menu
      else 
        puts "Error. Choose y or n."
      end
  end
main_menu