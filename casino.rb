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
  @user_name = gets.strip.downcase
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

end

def high_low

end

def blackjack

end
main_menu