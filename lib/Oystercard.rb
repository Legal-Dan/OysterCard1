

class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance 

  def initialize
    @balance = 0
    @in_use = false
  end
  
  def top_up(cash)
    raise "maximum exceeded: #{MAXIMUM_BALANCE}" if @balance + cash >= MAXIMUM_BALANCE
    @balance += cash
  end 

  def deduct(cash)
    @balance -= cash
  end 

  def in_use?
    @in_use
  end

  def touch_in
    raise "Insufficient balance" if balance < MINIMUM_BALANCE
    @in_use = true
  end
  
  def touch_out
    @in_use = false
  end

end
