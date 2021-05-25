class  Wallet
  def initialize(money)
    @wallet = money.to_f
  end
  def validate_money(spending_money)
    if @wallet.to_f - spending_money.to_f >= 0
      print "money"
    else
      false 
    end
  end

  def subtract_money(money)
    @wallet -= money.to_f
  end

  def add_money(money)
    @wallet += money.to_f
  end

  def print_balance
    puts "Your current balance is $#{@wallet}"
  end
end