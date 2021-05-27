class  Wallet
  def initialize(money)
    @wallet = money
  end
  def validate_money(spending_money)
    if @wallet - spending_money >= 0
      true
    else
      puts "You don't have enough money! Get out of here, ya bum!!"
      exit
    end
  end

  def subtract_money(money)
    @wallet -= money
  end

  def add_money(money)
    @wallet += money
  end

  def print_balance
    puts "Your current balance is $#{@wallet}".colorize(:green)
  end

  def get_wallet
    @wallet
  end

end