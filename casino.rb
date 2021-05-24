require 'pry'
require 'colorize'
# Start game player has a name and an initial bankroll
# Player can go to different games via menu
  # Slots
  # High / Low!!!
# Player places bet and wins / loses (hint: rand)
# Player's bankroll goes up and down with wins and losses
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
  puts ""
  puts "~~~~~~~~~~~~~~~~~~"
  puts ""
  puts "Welcome #{@user_name}! You have $#{@user_wallet} to play with!"
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
  puts "#{@user_name}      #{@user_wallet}"
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
    slots_game
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

def slots_game

  @winnings = []
  @user_wager = []
  @fruits = ['grape', 'pineapple', 'clover', 'watermelon', 'diamond', 'lemon', 'cherry', 'horseshoe', 'seven', 'bell']

      # bankroll is displayed 
      # and bankroll and winning variable are declared.  player is asked how much $ to want to play with
      # code for slots
      # slot game costs one dollar, which is one token
  puts ""
  puts "Let's Play Slots".colorize(:red)
  puts "Total cash: $#{@user_wallet}".colorize(:green)
  puts "------------------------------------------------------------"
  
  puts "The stakes of the game are:"
  puts ""
  puts "You make a wager."
  puts ""
  puts  "If 2 slots are equal, the user wins 10x the wager"
  puts ""
  puts "If 3 slots are equal, the user wins 100x the wager"
  puts ""
  puts "If no slots are equal, the user loses the value of the wager"
  puts ""
  puts "Would you like to stay and play?  type y/n"
  puts ""
  user_input = gets.strip
      if user_input == "n"
          puts "goodbye" 
          casino_floor
      else 
          wager_validation
      end
  end
              
  def wager_validation
  
      puts "You may wager only the amount that you have in the bankroll, which is $#{@user_wallet}"
          puts "How much would you like to wager or press 0 to return to casino menu?"
          @user_wager = gets.strip.to_i
              if @user_wallet >= @user_wager && @user_wager > 0
                  pull_lever
              elsif @user_wager == 0
                  casino_floor
              else 
                  puts "Error. Please enter a valid number" 
                  wager_validation
              end
  end
  
  def pull_lever
      slot_1 = @fruits.sample
      slot_2 = @fruits.sample
      slot_3 = @fruits.sample
  
      puts "#{slot_1} - #{slot_2} - #{slot_3}"
      
      if slot_1==slot_2 && slot_2==slot_3
              @winnings = @user_wager * 100
  
  
      elsif slot_1==slot_2 || slot_2==slot_3 || slot_1==slot_3
              @winnings = @user_wager * 10
  
      else
              @winnings = 0      
      end
  
      if @winnings>0
          puts "You just won $#{@winnings}!"
          @user_wallet += @winnings
      else 
          puts "You've lost your wager, which was $#{@user_wager}"
          @user_wallet = @user_wallet - @user_wager
      
      end
  
      puts "Your new balance is $#{@user_wallet}"
          if @user_wallet == 0
              puts "return to casino floor and add money to your bankroll"
              casino_floor
          else 
              puts "Play again? type y/n"
              user_input = gets.strip
              user_input == 'n' ? casino_floor : wager_validation
          end
          
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
end

def blackjack
  # "Welcome to Blackjack! Your Goal is to get closer to 21 than the dealer!"
  # Displays player name and wallet amount
  # How much would you like to bet? get user input bet_amount
  
end
main_menu